module ApplicationHelper
  def field_error(object, attribute)
    return unless object&.errors&.any? && object.errors[attribute].present?

    errors = object.errors.full_messages_for(attribute).join(", ")
    content_tag(:div, errors, class: "form__field-error", role: "alert", aria: { live: "assertive" })
  end
end
