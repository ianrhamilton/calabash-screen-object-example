class LoginScreen < IWordPress

  trait(:trait)                 { "view marked:'Username'" }

  element(:username_field)      { 'Username' }
  element(:password_field)      { 'Password' }
  element(:login_button)        { 'Sign In' }

  value(:not_logged_in?)        { element_exists("view marked:'#{login_button}'") }

  action(:touch_username_field) { touch("view marked:'#{username_field}'") }
  action(:touch_password_field) { touch("view marked:'#{password_field}'") }
  action(:touch_login_button)   { touch("view marked:'#{login_button}'") }

  def login_with(username, password)
    touch_username_field
    await_keyboard
    keyboard_enter_text(username)
    touch_password_field
    keyboard_enter_text(password)
    done
    wait_for_none_animating
  end

end
