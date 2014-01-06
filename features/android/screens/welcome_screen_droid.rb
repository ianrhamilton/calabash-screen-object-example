class WelcomeScreen < DroidPress

  trait(:trait)                       { "android.widget.Button marked:'Add blog hosted at WordPress.com'" }

  action(:touch_add_blog)             { touch("android.widget.Button marked:'Add blog hosted at WordPress.com'") }
  action(:touch_add_self_hosted_blog) { touch("android.widget.Button marked:'Add Self-Hosted Blog'") }
  action(:touch_create_blog)          { touch("android.widget.Button marked:'Create WordPress.com Blog") }

  def await(opts={})
    begin
      performAction('assert_text', "GNU GENERAL PUBLIC LICENSE", false)
    rescue
      touch("android.widget.Button marked:'Accept'")
    end
    wait_for_elements_exist(["* {text BEGINSWITH 'Start blogging'}"])
    self
  end

end

