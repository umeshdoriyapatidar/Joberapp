class Applicant < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  validates :name, presence: true
  validates :skills, presence: true , length: {maximum: 140}
  validates :description, length: {maximum: 210}
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
