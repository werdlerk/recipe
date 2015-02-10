module ApplicationHelper
  MENU_ITEMS = {
    :brand => 'pages#welcome',
    :recipes => 'cooking_recipes#index',
    :ingredients => 'ingredients#index',
    :units => 'units#index'
  }

  def menu_active?(menu_item)
    MENU_ITEMS[menu_item].present? &&
      ((MENU_ITEMS[menu_item].include?('#') && 
        MENU_ITEMS[menu_item].split('#')[0] == controller_name && 
        MENU_ITEMS[menu_item].split('#')[1] == action_name) ||
       (MENU_ITEMS[menu_item] == controller_name)
      )
  end

  def url_for_locale(locale)
    parts = request.host.split('.')
    parts[-1] = locale != 'en' ? locale : 'com'

    url = request.protocol + parts.join('.')
    if request.port != 80
      url << ":#{request.port}#{request.fullpath}"
    else
      url << request.fullpath
    end
  end

end
