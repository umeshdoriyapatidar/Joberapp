class Job < ApplicationRecord
  validates :job_title ,presence: true
  validates :experience ,presence: true
  validates :salary ,presence: true 
  belongs_to :employee ,foreign_key: 'employee_id'
  has_many :applies 
  has_many :applicant 
end
