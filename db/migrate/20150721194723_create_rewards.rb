class CreateRewards < ActiveRecord::Migration
  def change
    create_table :rewards do |t|
      t.string :name
      t.string :description
      t.integer :amount
      t.integer :backer_limit

      t.timestamps null: false
    end
  end
end
