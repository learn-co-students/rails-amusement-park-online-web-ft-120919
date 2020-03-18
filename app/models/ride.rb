class Ride < ActiveRecord::Base

  belongs_to :user
  belongs_to :attraction

  def take_ride
    message =  ["Sorry."]
    if user.tickets < attraction.tickets 
      message << "You do not have enough tickets to ride the #{attraction.name}."
    end
    if user.height < attraction.min_height
      message << "You are not tall enough to ride the #{attraction.name}."
    end
    if message.size > 1
      message.join(" ")
    else
      u = user
      a = attraction
      u.tickets -= a.tickets
      u.nausea += a.nausea_rating
      u.happiness += a.happiness_rating
      u.save
      "Thanks for riding the #{a.name}!"
    end
  end

  def right_height
    self.user.height >= self.attraction.min_height
  end

  def enough_tickets
    self.user.tickets >= self.attraction.tickets
  end

end