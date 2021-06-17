class Story < ApplicationRecord

    validates :title, 
    presence: { message: "can't be blank" },
    length: { in: 3..30, message: "mini:3, maxi:30" },
    uniqueness: { message: "already exist" }

    validates :content, 
    presence: { message: "can't be blank" },
    length: {minimum: 10, message: "mini:10" },
    uniqueness: { message: "already exist" }

    validates :author, 
    presence: { message: "can't be blank" },
    length: { in: 3..30, message: "mini:3, maxi:30" }

    belongs_to :user
    
end