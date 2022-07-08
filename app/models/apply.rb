class Apply < ApplicationRecord
  belongs_to :job 
  belongs_to :applicant
  enum status: {hold:0, accepted:1, rejected:2}
  paginates_per 5
  scope :accepts,->{where(status: 1)}
  scope :holds, ->{where(status: 0)}
  # scope :apply_dates, ->{oreder('apply_date asc'))}
end
