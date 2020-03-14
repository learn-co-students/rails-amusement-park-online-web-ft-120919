class User < ActiveRecord::Base
    has_many :rides
    has_many :attractions, through: :rides
    has_secure_password

    def mood
        if happiness.nil? || nausea.nil? || happiness < nausea
            "sad"
        else
            "happy"
        end
    end
end
