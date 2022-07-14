class AddConfirmableToEmployees < ActiveRecord::Migration[6.0]
  def change
    add_column :employees, :confirmation_token, :string
    add_column :employees, :confirmed_at, :datetime
    add_column :employees, :confirmation_sent_at, :datetime
    add_index :employees, :confirmation_token, unique: true
  end
end
