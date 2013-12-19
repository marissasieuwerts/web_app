class CreateProgrammes < ActiveRecord::Migration
  def change
    create_table :programmes do |t|
      t.string :programme_id
      t.string :name
      t.string :url

      t.timestamps
    end
  end
end
