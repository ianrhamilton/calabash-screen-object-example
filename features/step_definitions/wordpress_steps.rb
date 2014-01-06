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


When(/^I create a new blog post$/) do

  @screen.home_screen.touch_newpost_btn
  @screen.new_post_screen.await
  @blog_title, @blog_content = @screen.new_post_screen.add_new_blog_post

end

Then(/^the post should be added$/) do

  @screen.home_screen.await
  @screen.home_screen.touch_view_posts_btn

  @screen.posts_screen.await
  @screen.posts_screen.blog_title.should include @blog_title

end