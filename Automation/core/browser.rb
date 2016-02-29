#$LOAD_PATH.unshift(File.expand_path(File.dirname(__FILE__)))
require "log"

module Amazon
  class Browser

    #the created browser instance
    attr_accessor :browser

    def self.start type = 'CHROME'
      unless ENV['BROWSER'].nil?
        type = ENV['BROWSER']
      end

      case type.upcase

        when 'FIREFOX', 'firefox'
          @browser=Firefox.start
        when 'CHROME', 'chrome'
          @browser=Chrome.start
        else
          raise 'unsupported browser type.'
      end
    end



    class Firefox
      require 'watir-webdriver'
      def self.start

        Logger.info "Launching Chrome..."
        Watir::Browser.new :firefox
      end
    end

    class Chrome

      # def os
      #   @os ||= (
      #   host_os = RbConfig::CONFIG['host_os']
      #
      #   puts host_os
      #   case host_os
      #     when /mswin|msys|mingw|cygwin|bccwin|wince|emc/
      #       :windows
      #     when /darwin|mac os/
      #       :macosx
      #     when /linux/
      #       :linux
      #     when /solaris|bsd/
      #       :unix
      #     else
      #       raise Error::WebDriverError, "unknown os: #{host_os.inspect}"
      #   end
      #   )
      # end

      def self.start
        require 'watir-webdriver'
        Logger.info "Launching Chrome..."
        Watir::Browser.new :chrome
      end
    end
  end
end