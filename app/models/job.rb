class Job < ApplicationRecord
  validates :job_title ,presence: true
  validates :experience ,presence: true
  validates :salary ,presence: true 
  belongs_to :employee
  has_many :applies
  has_many :applicant ,through: :applies
end
