class LessonsController < ApplicationController
    
    def index
        @lessons = Lesson.all
    end
    
    def show
        @lesson = Lesson.find_by(id:params[:id])
        @post = Post.where(lesson_id:@lesson.id).order(created_at: :desc)
    end
    
end
