class Job < ApplicationRecord
  validates :job_title ,presence: true
  validates :experience ,presence: true
  validates :salary ,presence: true 
  belongs_to :employee ,foreign_key: 'employee_id'
  has_many :applies ,dependent: :destroy
  has_many :applicant ,through: :applies, dependent: :destroy
  paginates_per 10
end
