class Ride < ActiveRecord::Base
  belongs_to :user
  belongs_to :attraction

  def take_ride
    if reason_to_stop_ride
      "Sorry. #{reason_to_stop_ride}"
    else
      start_ride
    end
  end

  def start_ride
    user.tickets -= attraction.tickets
    user.happiness += attraction.happiness_rating
    user.nausea += attraction.nausea_rating
    user.save
    "Thanks for riding the #{attraction.name}!"
  end

  def reason_to_stop_ride
    if too_poor
      too_short ? "#{too_poor} #{too_short}" : too_poor
    elsif too_short
      too_short
    else
      false
    end
  end

  def too_short
    user.height < attraction.min_height ? "You are not tall enough to ride the #{attraction.name}." : nil
  end

  def too_poor
    user.tickets < attraction.tickets ? "You do not have enough tickets to ride the #{attraction.name}." : nil
  end
end
