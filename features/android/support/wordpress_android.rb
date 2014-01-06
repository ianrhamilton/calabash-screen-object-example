require 'calabash-android/abase'
require_relative '../../../features/android/droid_base'

class WordPressApp < DroidPress

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

