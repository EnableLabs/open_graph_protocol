Gem::Specification.new do |s|
  s.name = 'open_graph_protocol'
  s.version = '0.0.2'
  s.date = '2013-02-26'
  s.summary = 'A gem to facilitate populating the open graph protocol metatags on a web page'
  s.description = 'A gem to facilitate populating the open graph protocol metatags on a web page as part of a rails helper.'
  s.authors = ['Enable Labs', 'John Fitzpatrick']
  s.email = 'john@enablelabs.com'
  s.files = [ 'lib/open_graph_protocol.rb',
              'lib/open_graph_protocol/railtie.rb',
              'lib/open_graph_protocol/view_helpers.rb']
  s.homepage = 'https://github.com/EnableLabs/open_graph_protocol'
end