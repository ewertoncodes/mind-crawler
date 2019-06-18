class UsersController < ApplicationController
  def create
    user = User.new(user_params)
    if user.save
      render json: {status: 200, msg: 'User was created.'}
    end
  end

  private
    def user_params
      params.require(:user).permit(:email, :password)
    end
end