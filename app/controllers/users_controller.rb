
class UsersController < ApplicationController
  def index
  end

  def show
    @user = User.find_by(id: params[:id])
  end

  def new
    @cities = City.all
  end

  def create
    @cities = City.all
    my_user = User.new(
      first_name: params[:first_name],
      last_name: params[:last_name],
      email: params[:email],
      city_id: params[:city_id],
      password: params[:password],
      password_confirmation: params[:password_confirmation]
    )
    if my_user.save
      redirect_to new_session_path
    else
      flash.now[:alert] = 'something went wrong'
      render 'new', status: :unprocessable_entity
    end

  end

  def edit
  end

  def update
  end

  def destroy
  end
end
