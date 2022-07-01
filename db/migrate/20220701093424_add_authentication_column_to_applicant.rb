class AddAuthenticationColumnToApplicant < ActiveRecord::Migration[6.0]
  def change

    ## Confirmable
    add_column :applicants ,:confirmation_token,:string
    add_column :applicants ,:confirmed_at, :datetime
    add_column :applicants ,:confirmation_sent_at, :datetime
    add_column :applicants ,:unconfirmed_email,:string # Only if using reconfirmable

    ## Lockable
    add_column :applicants, :failed_attempts,:integer, default: 0, null: false # Only if lock strategy is :failed_attempts
    add_column :applicants, :unlock_token ,:string# Only if unlock strategy is :email or :both
    add_column :applicants, :locked_at ,:datetime
  
  end
end
