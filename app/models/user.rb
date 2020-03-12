class User < ApplicationRecord
    has_secure_password

    validates :name, presence: true
    validates :password_digest, presence: true
    #validates :height, presence: true
    #validates :happiness, presence: true
    #validates :nausea, presence: true
    #validates :tickets, presence: true 

    has_many :rides
    has_many :attractions, through: :rides

    before_save :set_default_admin_status

    def set_default_admin_status
      self.admin = false unless self.admin 
    end #set_default_admin_status

    def mood
      if !self.admin
        if self.nausea > self.happiness
          "sad"
        else
          "happy"
        end
      end 
    end #mood
end
