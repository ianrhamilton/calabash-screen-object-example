Given(/^the app is launched$/) do

  @screen = page(WordPressApp)

end

When /^I am on the "(.+)"$/ do |screen|

  @screen.send(screen.downcase.tr(' ', '_')).await

end

And(/^I login with (valid|invalid) credentials to Add WordPress.com blog$/) do |negate|

  @screen.welcome_screen.await
  @screen.welcome_screen.touch_add_blog

  @screen.login_screen.await
  @screen.login_screen.login_with(USERS[:valid][:email], USERS[:valid][:password]) if negate.eql? 'valid'
  @screen.login_screen.login_with(USERS[:invalid][:email], USERS[:invalid][:password]) if negate.eql? 'invalid'

end

Then /^I (should|should not) be logged in$/ do |negate|

  if negate.include? 'not'
    @screen.login_screen.should be_not_logged_in
  else
    @screen.home_screen.await
    @screen.home_screen.should be_logged_in
  end

end
