# Open Graph Protocol

The Open Graph Protocol gem has been created to facilitate ruby projects in populating open graph meta tags on their html pages. 

## Installation

Add this line to your application's Gemfile:

	gem 'open_graph_protocol'

And then execute:

	bundle

If you're not using bundler, you can install it manually via:

	gem install open_graph_protocol

## Usage

The gem provides a helper method in your view that will digest a Hash of the data you want to express as open graph protocol meta tags. Here are some usage examples:

Setting 'title', 'image', and 'url'

	<%= og({title: 'Enable Labs', image: 'http://www.enablelabs.com/logo.png', url: 'http://www.enablelabs.com'}) %>

which produces:

	<meta property="og:title" content="Enable Labs" />
	<meta property="og:image" content="http://www.enablelabs.com/logo.png" />
	<meta property="og:url" content="http://www.enablelabs.com/" />

Here's a more complex example where some of the values have additional attributes:

	<%= og({title: 'Enable Labs', 
					image: ['http://www.enablelabs.com/logo.png',
									{width: 300,
									 height: 200}],
					url: 'http://www.enablelabs.com'}) %>

which produces:

	<meta property="og:title" content="Enable Labs" />
	<meta property="og:image" content="http://www.enablelabs.com/logo.png" />
	<meta property="og:image:width" content="300" />
	<meta property="og:image:height" content="200" />
	<meta property="og:url" content="http://www.enablelabs.com/" />

For more documentation on the Open Graph Protocol, look at http://ogp.me