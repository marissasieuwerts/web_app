class CreateCourses < ActiveRecord::Migration
  def change
    create_table :courses do |t|
      t.string :acode
      t.string :code
      t.string :sgid
      t.string :name
      t.integer :ects
      t.integer :year
      t.string :period
      t.string :institute
      t.string :description
      t.string :timetable
      t.string :lecture_material
      t.string :goals
      t.integer :participant_count
      t.string :specialities
      t.string :examination

      t.timestamps
    end
  end
end
