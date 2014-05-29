class AddUserIdToStatuses < ActiveRecord::Migration
  def change
  	add_column :statuses, :used_id, :integer
  	add_index  :statuses, :used_id
  	remove_column :statuses, :name
  end
end
