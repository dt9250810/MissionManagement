class CreateMissions < ActiveRecord::Migration[5.2]
  def change
    create_table :missions do |t|
      t.string :title
      t.text :context
      t.integer :status
      t.integer :priority
      t.datetime :start_time
      t.datetime :end_time

      t.timestamps
    end
  end
end
