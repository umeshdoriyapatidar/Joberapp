class AddColumnToApplicants < ActiveRecord::Migration[6.0]
  def change
    add_column :applicants, :name, :string
    add_index :applicants, :name 
    
  end
end
