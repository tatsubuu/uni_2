class LessonsController < ApplicationController
    
    def index
        @lessons = Lesson.all
    end
    
    def show
        @lesson = Lesson.find_by(id:params[:id])
        @post = Post.where(lesson_id:@lesson.id).order(created_at: :desc)
    end
    
    def new
    end
    
    def create
        @lesson = Lesson.new(
            lesson_name: params[:lesson_name],
            lesson_dcp: params[:lesson_dcp])
        @lesson.save
        redirect_to("/lessons/index")
    end
end
