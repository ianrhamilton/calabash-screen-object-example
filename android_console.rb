require 'pry'
require 'rubygems'
require 'irb/completion'
require 'irb/ext/save-history'
require 'awesome_print'
AwesomePrint.irb!

ARGV.concat [ "--readline",
              "--prompt-mode",
              "simple" ]

# 50 entries in the list
IRB.conf[:SAVE_HISTORY] = 50

# Store results in home directory with specified file name
IRB.conf[:HISTORY_FILE] = ".irb-history"

require 'calabash-android/operations'
extend Calabash::Android::Operations

def embed(*args)
end



module Calabash
  module Android
    module Operations
      class Cucumber
        def self.wants_to_quit
          false
        end
      end
    end
  end
end

app_path = 'android-source/2.2.7/bin/Dashboard-debug.apk'
test_server_path = test_server_path(app_path)

unless ENV["TEST_SERVER_PORT"]
  ENV["TEST_SERVER_PORT"] = "34777"
end

unless ENV["PACKAGE_NAME"]
  ENV["PACKAGE_NAME"] = package_name(app_path)
end

unless ENV["MAIN_ACTIVITY"]
  ENV["MAIN_ACTIVITY"] = main_activity(app_path)
end

unless ENV["APP_PATH"]
  ENV["APP_PATH"] = app_path
end

unless ENV["TEST_APP_PATH"]
  ENV["TEST_APP_PATH"] = test_server_path
end

self.pry