module ExplainerContents
  def risk_rating
    find('.rating .risk .rating-yes').text
  end

  def heading
    find('.asset_classes .title').text
  end

end
