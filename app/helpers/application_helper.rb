module ApplicationHelper
  def dashboard_sidebar_items
    [
     {
      label: "Home",
      path: root_path,
      icon: "icons/home.svg"
     },
     {
      label: "New post",
      path: new_post_path,
      icon: "icons/plus.svg"
     }
    ]
  end
end
