Given(/^User go to amazon$/) do
  amazon_home_page.visit
end

When(/^User input items (.*) to search$/) do |query|
  amazon_home_page.header_widget.search_bar.set query
  amazon_home_page.header_widget.search_button.click

end


Then(/^User get (.*) from result$/) do |query|

  search_result_page.right_result_list_widget.search_item.wait_until_present(10)
  assert_it ("Get search result") {search_result_page.layer.text.include? query}

end