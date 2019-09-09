module ApplicationHelper

  # Generate breadcrumbs
  def breadcrumbs(opt = {})
    render 'common/breadcrumbs', crumbs: opt
  end

  def bootstrap_class_for flash_type
    { success: "alert-primary", error: "alert-danger", alert: "alert-warning", notice: "alert-info" }[flash_type.to_sym] || "alert-primary"
  end

  def flash_messages(opts = {})
    flash.each do |msg_type, message|
      concat(content_tag(:div, message, class: "alert #{bootstrap_class_for(msg_type)}") do 
              concat content_tag(:button, 'x', class: "close", data: { dismiss: 'alert' })
              concat message 
            end)
    end
    nil
  end

  def alert_tag(role, copy)
    "<div class=\"alert alert-#{role}\" role=\"#{role}\">#{copy}</div>".html_safe
  end
  
end
