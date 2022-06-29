class CreateJobs < ActiveRecord::Migration[6.0]
  def change
    create_table :jobs do |t|
      t.string :job_title
      t.text :description
      t.float :experience
      t.float :salary
      t.belongs_to :employee
      t.timestamps  
    end
    add_index :jobs , :job_title 
  end
end
