module ExplainerContents
  def risk_rating
    find('.rating .risk .rating-yes').text
  end
end
