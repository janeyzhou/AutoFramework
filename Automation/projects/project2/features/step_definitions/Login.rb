Given(/^User go to amazon page$/) do
  amazon_home_page.visit
end

When(/^User click Your Amazon\.com button$/) do
  amazon_home_page.header_widget.your_amazon_link.wait_until_present(10)
  amazon_home_page.header_widget.your_amazon_link.click
end




