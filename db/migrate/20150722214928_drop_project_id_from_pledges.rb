class DropProjectIdFromPledges < ActiveRecord::Migration
  def change
    remove_column('pledges', 'project_id')
  end
end
