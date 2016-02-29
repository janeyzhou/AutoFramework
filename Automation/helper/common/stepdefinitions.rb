Then(/^Current page must be (.*) page$/) do |page_name|
  wait_page_loaded(page_name)
end

