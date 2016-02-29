$LOAD_PATH.unshift(File.expand_path(File.dirname(__FILE__)))
require 'watir-webdriver'
require 'cucumber'
require 'Environment'
require "zip"
require "rss/utils"





$env = Amazon::Environment.new
World(Amazon)

Before do |scenario|
  $env.before scenario
  @browser = $env.browser

  def assert_it message, &block
    begin
      if (block.call)
        puts "Assertion Passed for #{message}"
      else
        puts "Assertion Failed for #{message}"
        fail ('Assertion failure')
      end
    rescue => e
      puts "Assertion Failed for #{message} with exception '#{e}'"
      fail ('Assertion failure')
    end
  end

end

After do |scenario|
  $env.after scenario
end



at_exit do

  $env.teardown


end