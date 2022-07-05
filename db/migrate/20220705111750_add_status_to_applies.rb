class AddStatusToApplies < ActiveRecord::Migration[6.0]
  def change
    add_column :applies,:status, :integer, default:0
    add_index  :applies, :status
  
  end
end
