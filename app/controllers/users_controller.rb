class UsersController < ApplicationController
  def create
    @user = User.new(user_params)
    if @user.save
      render json: { message: I18n.t(:account_successfully_created) }, status: :created
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end

  private
    def user_params
      params.require(:user).permit(:name, :email, :password)
    end
end