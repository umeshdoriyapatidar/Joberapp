class AddColumnToApplicant < ActiveRecord::Migration[6.0]
  def change
    add_column :applicants, :apply_otp, :integer
  end
end
