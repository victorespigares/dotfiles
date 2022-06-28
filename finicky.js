module.exports = {
	defaultBrowser: 'Brave Browser',
	handlers: [
	  {
		match: [
		  'zoom.us*',
		  finicky.matchDomains(/.*\zoom.us/),
		  /zoom.us\/j\//,
		],
		browser: 'us.zoom.xos',
	  },
	  {
 		match: "https://www.figma.com/file/*",
  		browser: "Figma",
	  },
	  {
		match: [
		  ({ url }) => url.host.endsWith('wordpress.com'),
		  ({ url }) => url.host.endsWith('wordpress.org'),
		  ({ url }) => url.host.endsWith('a8c.com'),
		  ({ url }) => url.host.endsWith('wpjobmanager.com'),
		  ({ url }) => url.host.endsWith('senseilms.com'),
		  ({ url }) => url.host.endsWith('woocommerce.com'),
		  ({ url }) => url.host.endsWith('tumblr.com'),
		  ({ url }) => url.host.endsWith('trello.com'),
		  ({ url }) => url.host.endsWith('woothemes.zendesk.com'),
		  ({ url }) => url.host.endsWith('greenhouse.io'),
		  ({ url }) => url.host.endsWith('github.com'),
		  ({ url }) => url.host.endsWith('automattic.com'),
		  ({ url }) => url.host.endsWith('wp.me'),
		],
		browser: {
			name: 'Google Chrome',
			profile: 'Default',
		}
	  },
	  {
		match: ({ url }) => url.protocol === 'slack',
		browser: '/Applications/Slack.app',
	  },
	  {
      match: [
        // Open Around.co meeting links in the Around app directly,
        /around.co\/r\//,
      ],
      browser: "around"
    },
    {
      // Open Spotify URLs in the Spotify app
      // match: finicky.matchDomains("open.spotify.com"),
      match: "open.spotify.com/*",
      browser: "Spotify"
    },
	],
	rewrite: [
	    {
	      // Redirect all urls to use https
	      match: ({ url }) => url.protocol === "http",
	      url: { protocol: "https" }
	    },
	  {
		match: [
		  '*.slack.com/*',
		],
		url({ url, urlString }) {
		  const subdomain = url.host.slice(0, -10);
		  const pathParts = url.pathname.split('/');

		  let team; let
			patterns = {};
		  if (subdomain != 'app') {
			switch (subdomain) {
			  case 'a8c':
				team = 'T024FN1V2';
				break;
			  default:
				finicky.notify(
				  `No Slack team ID found for ${url.host}`,
				  'Add the team ID to ~/.finicky.js to allow direct linking to Slack.',
				);
				return url;
			}

			if (subdomain.slice(-11) == '.enterprise') {
			  patterns = {
				file: [/\/files\/\w+\/(?<id>\w+)/],
			  };
			} else {
			  patterns = {
				file: [/\/messages\/\w+\/files\/(?<id>\w+)/],
				team: [/(?:\/messages\/\w+)?\/team\/(?<id>\w+)/],
				channel: [/\/(?:messages|archives)\/(?<id>\w+)(?:\/(?<message>p\d+))?/],
			  };
			}
		  } else {
			patterns = {
			  file: [
				/\/client\/(?<team>\w+)\/\w+\/files\/(?<id>\w+)/,
				/\/docs\/(?<team>\w+)\/(?<id>\w+)/,
			  ],
			  team: [/\/client\/(?<team>\w+)\/\w+\/user_profile\/(?<id>\w+)/],
			  channel: [/\/client\/(?<team>\w+)\/(?<id>\w+)(?:\/(?<message>[\d.]+))?/],
			};
		  }

		  for (const [host, host_patterns] of Object.entries(patterns)) {
			for (const pattern of host_patterns) {
			  const match = pattern.exec(url.pathname);
			  if (match) {
				let search = `team=${team || match.groups.team}`;

				if (match.groups.id) {
				  search += `&id=${match.groups.id}`;
				}

				if (match.groups.message) {
				  let { message } = match.groups;
				  if (message.charAt(0) == 'p') {
					message = `${message.slice(1, 11)}.${message.slice(11)}`;
				  }
				  search += `&message=${message}`;
				}

				const output = {
				  protocol: 'slack',
				  username: '',
				  password: '',
				  host,
				  port: null,
				  pathname: '',
				  search,
				  hash: '',
				};
				const outputStr = `${output.protocol}://${output.host}?${output.search}`;
				finicky.log(`Rewrote Slack URL ${urlString} to deep link ${outputStr}`);
				return output;
			  }
			}
		  }

		  return url;
		},
	  },
	],
  };
