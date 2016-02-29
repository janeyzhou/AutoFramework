module Amazon
  class SearchResultPage < Page
    Widgets.register_widget(Amazon::HeaderWidget, :header_widget)
    Widgets.register_widget(Amazon::RightResultListWidget, :right_result_list_widget)


    def layer
      @browser
    end


  end
  Pages.register_page(Amazon::SearchResultPage, :search_result_page)
end

