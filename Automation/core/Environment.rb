require 'browser'
require 'log'

module Amazon

  class Environment
    attr_accessor :browser
    attr_accessor :logger

    def initialize
      @logger = Logger
      print_envs
      @browser =  Browser.start
    end

    def print_envs
      @logger.text "Environment Variables:"

      unless ENV['BROWSER'].nil?
        @logger.text "                      BROWSER = #{ENV['BROWSER']}"
      else
        @logger.text "                      BROWSER = CHROME(Default)"
      end

      unless ENV['DEBUG'].nil?
        @logger.text "                      DEBUG   = #{ENV['DEBUG']}"
      else
        @logger.text "                      DEBUG   = OFF(Default)"
      end
    end

    def before scenario
      @logger.text ""
      @logger.text scenario.name
      scenario.test_steps.each do |step|
        @logger.text step.name
      end
      @logger.text ""
    end

    def after scenario
      @logger.info "End Scenario: #{scenario.name}"
      if scenario.failed?
        Dir::mkdir('screenshot') if not File.directory?('screenshot')
        screenshot = "screenshot/Failed_#{scenario.name.gsub(' ','_').gsub(/[^0-9A-Za-z_]/, '')}.jpg"
        @browser.screenshot.save(screenshot)
        # embed screenshot, 'image/jpg'

        ENV['ARCHIVE_RESULTS'] = 'no' if ENV['ARCHIVE_RESULTS'].nil?

      end
    end

    def teardown

      if ENV['DEBUG'] == "ON" || ENV['DEBUG'] == "on"
        @logger.info "Debug model is on, not close the browser."
      else
        @logger.info "close browser..."
        @browser.close

      end
    end


  end
end