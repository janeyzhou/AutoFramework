module Amazon

  class RightResultListWidget < Amazon::Widget

    def layer
      @container.div(:id => 'rightContainerATF')
    end

    def search_item
      layer.li(:Xpath, "//*[@id='rightResultsATF']/div[3]/div/div/ul/li[1]")
    end



  end
  Amazon::Page.create_widget_call_method(Amazon::RightResultListWidget, :right_result_list_widget)
end
