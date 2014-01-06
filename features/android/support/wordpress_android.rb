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

  def new_post_screen
    @new_post_screen ||= page(NewPostScreen)
  end

  def posts_screen
    @posts_screen ||= page(PostsScreenIos)
  end


end

