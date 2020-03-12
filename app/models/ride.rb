class Ride < ActiveRecord::Base
  belongs_to :user
  belongs_to :attraction

  def take_ride
    if user_has_enough_tickets? && user_is_tall_enough?
      start_ride
    elsif !user_has_enough_tickets? && !user_is_tall_enough?
      "Sorry. " + not_enough_tickets + " " + not_tall_enough
    elsif !user_has_enough_tickets? && user_is_tall_enough?
      "Sorry. " + not_enough_tickets
    elsif user_has_enough_tickets? && !user_is_tall_enough?
      "Sorry. " + not_tall_enough
    end
  end

  def user_has_enough_tickets?
    self.user.tickets >= self.attraction.tickets
  end
  
  def user_is_tall_enough?
    self.user.height >= self.attraction.min_height
  end

  def not_enough_tickets
    "You do not have enough tickets to ride the #{self.attraction.name}."
  end

  def not_tall_enough
    "You are not tall enough to ride the #{self.attraction.name}."
  end

  def start_ride
    new_tickets = self.user.tickets - self.attraction.tickets
    new_happiness = self.user.happiness + self.attraction.happiness_rating
    new_nausea = self.user.nausea + self.attraction.nausea_rating
    self.user.update(
      :happiness => new_happiness,
      :nausea => new_nausea,
      :tickets => new_tickets
    )
    "Thanks for riding the #{self.attraction.name}!"
  end

end
