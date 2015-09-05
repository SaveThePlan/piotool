module ButtonsHelper

  def actions_group(*btns)
    content_tag :div, class: 'actions-group' do
      btns.join.html_safe
    end
  end

  def img_btn_to(path, h_options = {})
    link_to '', path, h_options
  end

  def show_btn(path, h_options = {})
    h_options[:title] ||= t('helpers.buttons.show')
    h_options[:class] ||= 'btn show-btn'

    img_btn_to(path, h_options)
  end

  def edit_btn(path, h_options = {})
    h_options[:title] ||= t('helpers.buttons.edit')
    h_options[:class] ||= 'btn edit-btn'

    img_btn_to(path, h_options)
  end

  def delete_btn(path, h_options = {})
    h_options[:title] ||= t('helpers.buttons.delete')
    h_options[:method] ||= :delete
    h_options[:data] ||= {}
    h_options[:data][:confirm] ||= t('helpers.buttons.delete_confirm')
    h_options[:class] ||= 'btn delete-btn'

    img_btn_to(path, h_options)
  end

end
