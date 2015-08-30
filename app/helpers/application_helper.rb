module ApplicationHelper

  def flash_msg_class type
    case type.to_sym
      when :success
        'alert-success'
      when :error
        'alert-danger'
      when :alert
        'alert-warning'
      when :notice
        'alert-info'
      else
        type.to_s
    end
  end

end
