class Apply < ApplicationRecord
  belongs_to :job 
  belongs_to :applicant
  enum status: {hold:0, accepted:1, rejected:2}
end
