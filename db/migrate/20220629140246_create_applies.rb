class CreateApplies < ActiveRecord::Migration[6.0]
  def change
    create_table :applies do |t|
      t.date :apply_date
      t.belongs_to :applicant
      t.belongs_to :job
      t.timestamps
    end
  end
end
