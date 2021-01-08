class CoursesController < ApplicationController
    
    def create
        @course = Course.new(
            user_id: @current_user.id,
            lesson_id: params[:lesson_id]
        )
        @course.save
        redirect_to("/lessons/#{params[:lesson_id]}")
    end
    
    def destroy
        @course = Course.find_by(
            user_id: @current_user.id,
            lesson_id:params[:lesson_id]
        )
        @course.destroy
        redirect_to("lessons/#{params[:lessons_id]}")
end