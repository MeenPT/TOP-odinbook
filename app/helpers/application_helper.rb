module ApplicationHelper
  def field_error(object, attribute)
    return unless object&.errors&.any? && object.errors[attribute].present?

    errors = object.errors.full_messages_for(attribute).join(", ")
    content_tag(:div, errors, class: "form__field-error", role: "alert", aria: { live: "assertive" })
  end

  def sidebar_items
    [
      {
        label: "Home",
        icon: "house",
        path: posts_path
      },
      {
        label: "New post",
        icon: "circle-plus",
        path: new_post_path
      }
    ]
  end
end
