class PostsController < ApplicationController
    
    def show
        @post = Post.find_by(id: params[:id])
        #ユーザー情報を表示するために該当するユーザー情報をインスタンスメゾットを用いて取得
        @user = @post.user
    end
    
    def new
         #新規作成ページでcreateアクションに飛ばすためのURLの:id部分に使うため。
        @lesson = Lesson.find_by(id: params[:id])
    end
    
    def create
        @post = Post.new(
            content: params[:content],
            lesson_id: params[:id],
            user_id: @current_user.id)
        
        if @post.save
            flash[:notice] ="投稿が完了しました"
            redirect_to("/lessons/#{@post.lesson_id}")
        else
            redirect_to("/posts/#{@post.lesson_id}/new")
        end
    end
    
    def edit
        @post = Post.find_by(id: params[:id])
    end
    
    def update
        @post = Post.find_by(id:    params[:id])
        @post.content = params[:content]
        if @post.save
            flash[:notice] = "投稿が完了しました"
            redirect_to("/lessons/#{@post.lesson_id}")
        else
            redirect_to("/posts/#{@post.id}/edit")
        end
    end
    
    def destroy
        @post = Post.find_by(id: params[:id])
        if @post.destroy
            flash[:notice] ="投稿を削除しました"
            redirect_to("/lessons/index")
        end
    end
end
