module ExplainerContents
  def risk_rating
    find('.rating .risk .rating-yes').text
  end

  def heading
    find('.basics .title').text
  end

end
