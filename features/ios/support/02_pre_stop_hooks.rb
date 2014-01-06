if defined?(Calabash) && defined?(Calabash::Cucumber)
  require 'calabash-cucumber/operations'
  class CallbackWorld
    include ::Calabash::Cucumber::Operations

    def on_launch
      begin
        wait_for_elements_exist(["alertView label text:'Update Available'"], :timeout => 30)
        sleep(0.6) #for update dialog to fully load
        touch("view marked:'Dismiss'")
      rescue Calabash::Cucumber::WaitHelpers::WaitError
        #May not appear so ignore timeout error
      end
    end
  end

  World do
    ::CallbackWorld.new
  end

end
