require 'open_graph_protocol/view_helpers'

module OpenGraphProtocol
  class Railtie < Rails::Railtie
    initializer "open_graph_protocol.view_helpers" do
      ActionView::Base.send :include, ViewHelpers
    end
  end
end