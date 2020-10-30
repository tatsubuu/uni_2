class UsersController < ApplicationController
    def index
        @user = User.all
    end
    
    def show
        @user = User.find_by(id: params[:id])
    end
    
    def new
    end
    
    def create
        @user = User.new(
            name: params[:name],
            password: params[:password],
            image_name: "default_user.jpg"
            )
        if @user.save
            session[:user_id] = @user.id
            flash[:notice] ="登録が完了しました"
            redirect_to("/users/#{@user.id}")
        else
            render("users/new")
        end
    end
    
    def edit
        @user = User.find_by(id: params[:id])
    end
    
    def update
        @user = User.find_by(id: params[:id])
        @user.name =params[:name]
        
        if @user.image_name = "#{@user.id}.jpg"
            image = params[:image]
            File.binwrite("public/user_images/#{@user.image_name}",image.read)
        end
        
        if @user.save
            flash[:notice] = "ユーザー情報を編集しました"
            redirect_to("/users/#{@user.id}")
        else
            render("users/edit")
        end
    end
    
    def login_form
    end
    
    def login
        @user = User.find_by(
            name: params[:name],
            password: params[:password]
            )
        
        if @user
            session[:user_id] = @user.id
            flash[:notice] = "ログインしました"
            redirect_to("/lessons/index")
        else
            @error_message = "パスワードが間違っています"
            #入力された値を初期値として表示するために代入
            @password = params[:password]
            @name = params[:name]
            render("users/login_form")
        end
        
    end
    
    def logout
        session[:user_id] = nil
        flash[:notice] = "ログアウトしました"
        redirect_to("/login")
    end
    
    def destroy
        @user = User.find_by(id: params[:id])
        if @user.destroy
            flash[:notice] ="ユーザーを削除しました"
            redirect_to("/users/index")
        end
    end
end
