class HomeScreen < IWordPress

  trait(:trait) { "view marked:'#{newpost_btn}'"  }

  element(:newpost_btn) { 'navbar add' }
  element(:posts_btn)   { 'dashboard_posts_btn' }
  element(:pages_btn)   { 'dashboard_pages_btn' }

  value(:logged_in?)    { element_exists("* marked:'#{newpost_btn}'") }

  action(:touch_newpost_btn) { touch("* marked:'#{newpost_btn}'") }
  action(:touch_view_posts_btn) { touch("* id:'#{posts_btn}'") }

end
