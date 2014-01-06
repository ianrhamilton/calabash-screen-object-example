require 'calabash-cucumber/ibase'
require_relative '../../../features/ios/ios_base'

class WordPressApp < IWordPress

  def welcome_screen
    @welcome_screen ||= page(WelcomeScreen)
  end

  def login_screen
    @login_screen ||= page(LoginScreen)
  end

  def home_screen
    @home_screen ||= page(HomeScreen)
  end

end

