class LoginScreen < DroidPress

  trait(:trait)                { "* id:'#{username_field}'" }

  element(:username_field)     { 'username' }
  element(:password_field)     { 'password' }
  element(:login_button)       { 'save' }

  value(:not_logged_in?)       { element_exists("* id:'#{login_button}'") }

  action(:touch_login_button)  { touch("* id:'#{login_button}'") }

  def login_with(username, password)
    query("* id:'#{username_field}'", {:setText => username})
    query("* id:'#{password_field}'", {:setText => password})
    performAction('scroll_down')
    touch_login_button
    performAction('wait_for_no_progress_bars')
    performAction('wait_for_dialog_to_close')
  end

end