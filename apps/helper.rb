module Helper
  def menu
    partial 'components/nav.haml'
  end

  def secondary_menu_item(text, url)
    link_to(text, url) +
      tag(:img, src: '/images/nav/pointer.svg', class: 'pointer')
  end

  def secondary_asset_classes_menu
    partial 'components/secondary_menu/_asset_classes.haml', selected: '#cash'
  end

  def super_and_retirement
    partial 'components/secondary_menu/_retirement_subcategories.haml',
            selected: '#transition'
  end

  def supporting_content_documents
    {
      'Returns Of Australian Fixed Interest'       => '/pdfs/aus_fixed_interest.pdf',
      'Returns of Australian Property Securities'  => '/pdfs/aus_property_securities.pdf',
      'Returns on Australian Shares'               => '/pdfs/aus_shares.pdf',
      'Australian and Global Share Market Returns' => '/pdfs/aus_vs_global_share_markets.pdf',
      'Benefits of Dollar Cost Averaging'          => '/pdfs/benefits_dollar_cost_averaging.pdf',
      'Consequences of Short Term Focusing'        => '/pdfs/consequences_short_term.pdf',
      'Diversification and Consistent Returns'     => '/pdfs/diversification_and_consistent_returns.pdf',
      'Returns of Global Fixed Interest'           => '/pdfs/global_fixed_interest.pdf',
      'Returns of Global Shares'                   => '/pdfs/global_shares.pdf',
      'Long Term Investing'                        => '/pdfs/long_term_investing.pdf'
    }
  end

  def asset_classes?
    page_classes.include?('asset_classes')
  end

  def super_and_retirement?
    page_classes.include?('super_retirement') ||
      page_classes.include?('super')
  end

  def secondary_menu
    if asset_classes?
      secondary_asset_classes_menu
    elsif super_and_retirement?
      super_and_retirement
    end
  end

  def current_page_title
    current_page.data.title || 'Financial Adviser'
  end

  def google_analytics
    return '' if ENV['RACK_ENV'] != 'production'
    content_tag(:script, '',
                src: '/javascripts/analytics.js',
                type: 'text/javascript')
  end
end
