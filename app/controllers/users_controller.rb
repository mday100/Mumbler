class UsersController < ApplicationController
before_action :set_user, only: [:show, :edit, :update, :destroy, :follow, :unfollow]

  def index
    @users = User.all
  end

  def show
    @users = User.all
  end

  def new
    @user = User.new
    # render layout: "clean"
  end

  def create
    @user = User.create(user_params)
    if @user
      flash[:notice] = "Welcome to your new account!!!."
      session[:user_id] = @user.id
      redirect_to @user
    else
      flash[:alert] = "There was a problem. Please try again."
      redirect_to new_user_path
    end
  end

  def edit
  end

  def update
    if @user.update(user_params)
      flash[:notice] = "New user updated."
      redirect_to @user
    else
      flash[:alert] = "There was a problem. Please try again."
      redirect_to user_path(@user)
    end
  end

  def destroy
    if @user.delete
      flash[:notice] = "User deleted."
      redirect_to users_path
    else
      flash[:alert] = "There was a problem"
      redirect_to users_path
    end
  end

  def follow
    @rel = Relationship.create(follower_id: session[:user_id], followed_id: @user.id)
    if @rel
      flash[:notice] = "You just followed #{@user.username}!"
      redirect_to users_path
    else
      flash[:alert] = "That did not go as planned. Sawwy."
      redirect_to users_path
    end
  end

  def unfollow
    @rel = Relationship.find_by(follower_id: session[:user_id], followed_id: @user.id)
    if @rel.delete
      flash[:notice] = "You just unfollowed #{@user.username}!"
      redirect_to users_path
    else
      flash[:alert] = "That did not go as planned. Sawwy."
      redirect_to users_path
    end
  end

  private

  def user_params
    params.require(:user).permit(:username, :password, :bio, :location)
  end

  def set_user
    @user = User.find(params[:id])
  end

end
