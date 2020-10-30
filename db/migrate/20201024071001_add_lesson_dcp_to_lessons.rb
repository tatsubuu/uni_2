class AddLessonDcpToLessons < ActiveRecord::Migration[5.2]
  def change
      add_column :lessons, :lesson_dcp, :text
  end
end
