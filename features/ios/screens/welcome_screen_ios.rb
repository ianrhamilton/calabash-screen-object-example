class WelcomeScreen < IWordPress

  trait(:trait)                       { "button marked:'Add WordPress.com Blog'" }

  action(:touch_add_blog)             { touch("button marked:'Add WordPress.com Blog'") }
  action(:touch_add_self_hosted_blog) { touch("button marked:'Add Self-Hosted Blog'") }
  action(:touch_create_blog)          { touch("button marked:'Create WordPress.com Blog") }

end
