class UsersController < ApplicationController
  def index
    @users = User.order(created_at: :desc)
  end

  def new
    @user = User.new
    render 'registration/new'
  end

  def show
    @user = User.find(params[:id])
  end

  protected

  # Only allow a list of trusted parameters through.
  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation, :firstname, :lastname, :photo, :phone,
                                 :country, :state, :city, :lga)
  end
end
