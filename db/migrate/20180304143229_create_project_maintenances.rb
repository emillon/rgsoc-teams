class CreateProjectMaintenances < ActiveRecord::Migration[5.1]
  def change
    create_table :project_maintenances do |t|
      t.integer :project_id
      t.integer :user_id
      t.integer :season_id
      t.integer :position, null: false

      t.timestamps
    end
    add_index :project_maintenances, :project_id
    add_index :project_maintenances, :user_id
    add_index :project_maintenances, :season_id
    add_index :project_maintenances, :position
  end
end
