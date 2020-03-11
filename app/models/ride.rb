class Ride < ApplicationRecord
  belongs_to :user
  belongs_to :attraction

  def take_ride
    too_short = (self.attraction.min_height > self.user.height)
    not_enough_tix = (self.attraction.tickets > self.user.tickets)

    if too_short || not_enough_tix #user can't ride attraction
      if too_short && not_enough_tix
        msg = "Sorry. You do not have enough tickets to ride the #{self.attraction.name}. You are not tall enough to ride the #{self.attraction.name}."
      elsif too_short
        msg = "Sorry. You are not tall enough to ride the #{self.attraction.name}."
      else
        msg = "Sorry. You do not have enough tickets to ride the #{self.attraction.name}."
      end 

    else #user can ride attraction
      user = self.user
      user.tickets = user.tickets - self.attraction.tickets
      user.happiness = user.happiness + self.attraction.happiness_rating
      user.nausea = user.nausea + self.attraction.nausea_rating
      user.save 
    end 
  end #take_ride

end
