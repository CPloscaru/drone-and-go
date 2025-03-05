module ApplicationHelper
  def display_rating(rating)
    full_star = "★"
    empty_star = "☆"

    rounded_rating = rating.ceil

    full_star * rounded_rating + empty_star * (5 - rounded_rating)
  end
end
