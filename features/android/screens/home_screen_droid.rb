class HomeScreen < DroidPress

  trait(:trait) { 'org.wordpress.android.util.WPTitleBar' }

  element(:blog_title)  { 'blog_title' }
  element(:home_button) { 'home_small' }
  element(:newpost_btn) { 'dashboard_newpost_btn' }
  element(:posts_btn)   { 'dashboard_posts_btn' }
  element(:pages_btn)   { 'dashboard_pages_btn' }

  value(:logged_in_as)  { query("* marked:'#{blog_title}'",:text)[0] }
  value(:logged_in?)    { element_exists("* marked:'#{blog_title}'") }

  action(:touch_newpost_btn) { touch("* id:'#{newpost_btn}'") }
  action(:touch_view_posts_btn) { touch("* id:'#{posts_btn}'") }

  def await
    wait_for_elements_exist([trait])
    self
  end

end