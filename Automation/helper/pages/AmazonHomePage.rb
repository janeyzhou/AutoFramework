module Amazon
  class AmazonHomePage < Page

    Widgets.register_widget(Amazon::HeaderWidget, :header_widget)

    def url
      "www.amazon.com"
    end

    def layer
      @browser
    end

  end
  Pages.register_page(Amazon::AmazonHomePage, :amazon_home_page)
end

