class AddLessonIdToPots < ActiveRecord::Migration[5.2]
  def change
      add_column :posts,:lesson_id,:integer
  end
end
