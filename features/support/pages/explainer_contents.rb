module ExplainerContents
  def risk_rating
    find('.rating .risk-rating .rating-yes').text
  end

  def heading
    find('.title').text
  end

end
