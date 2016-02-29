module Amazon

  class HeaderWidget < Amazon::Widget

    def layer
      @container.div(:id => 'navbar')
    end

    def search_bar
      layer.text_field(id: "twotabsearchtextbox")
    end
    def search_button
      layer.div(:class => 'nav-right')
    end
    def your_amazon_link
      layer.link(:id => "nav-your-amazon")
    end

  end
  Amazon::Page.create_widget_call_method(Amazon::HeaderWidget, :header_widget)
end