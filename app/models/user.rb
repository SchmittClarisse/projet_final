class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  after_create :welcome_email

  def welcome_email
    UserMailer.welcome_email(self).deliver 
  end

  #validates :name, 
  #presence: { message: "can't be blank" },
  #length: { in: 3..30, message: "mini:3, maxi:30" }
  #format: { with: /\A[a-z ,.'-,0-9]+\z/, message: "Please enter a valid format" }

  #validates :description, 
  #presence: { message: "can't be blank" },
  #length: { in: 3..300, message: "mini:3, maxi:300" }
  #format: { with: /\A[a-z ,.'-,0-9]+\z/, message: "Please enter a valid format" }

  has_many :stories
  
end
