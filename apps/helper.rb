module Helper
  def menu(selected={})
    partial 'components/nav.haml'
  end

  def secondary_menu_item(text, url)
    link_to(text, url) + tag(:img, src: '/images/nav/pointer.svg', class: 'pointer')
  end

  def secondary_asset_classes_menu(selected={})
    partial 'components/secondary_menu/_asset_classes.haml', selected:'#cash'
  end

  def retirement(selected ={})
    partial 'components/secondary_menu/_retirement_subcategories.haml',
            selected: '#transition'
  end

  def asset_classes?
    page_classes.include?('asset_classes')
  end

  def retirement?
    page_classes.include?('retirement')
  end

  def secondary_menu
    if asset_classes?
      secondary_asset_classes_menu
    elsif retirement?
      retirement
    end
  end
end