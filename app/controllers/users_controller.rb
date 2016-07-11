class UsersController < ApplicationController
   
   def index
      @users = User.all   
   end
   
   def new
       @user = User.new
   end
   
   def create
      @user = User.new(user_params)
      if @user.save
         flash[:success] = "Hello #{@user.username}, welcome to Wormblog!"
         redirect_to articles_path
      else
         render 'new'
      end
   end
   
   def edit
      @user = User.find(params[:id])
      
   end
   
   def update
      @user = User.find(params[:id])
      if @user.update(user_params)
         flash[:success] = "Your account has been changed"
         redirect_to articles_path
      else
         render 'edit'
      end
   end
   
   def show
      @user = User.find(params[:id])
   end
   
   
   private
   def user_params
      params.require(:user).permit(:username, :email, :password)
   end
end