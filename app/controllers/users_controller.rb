class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      login!(@user)
      flash[:success] = "Welcome"
      redirect_to :root
    else
      flash[:errors] = @user.errors.full_messages
      render :new
    end
  end

  def placeholder
    @current_user = current_user
    render 'placeholder'
  end

  private

    def user_params
      params.require(:user).permit(:username, :password, :session_token)
    end
end
