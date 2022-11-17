
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
      log_in(my_user)
      redirect_to root_path
    else
      flash.now[:alert] = 'something went wrong'
      render 'new', status: :unprocessable_entity
    end

  end

  def edit
    @user = User.find(session[:user_id])
  end

  def update

    @user = User.find(session[:user_id])
    post_params = params.require(:user).permit(:age, :description)
    puts '$' * 10
    puts post_params
    puts @user.inspect
    puts '$' * 10

    if @user.update(age: post_params[:age], description: post_params[:description]).authenticate(password: @user.password_digest)
      redirect_to 'show', notice: 'success'

    else
      flash.now[:alert] = @user.errors.full_messages.join(', ')
      render :edit, status: :unprocessable_entity
    end

  end

  def destroy
  end
end
