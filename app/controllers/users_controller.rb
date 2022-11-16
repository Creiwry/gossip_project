
class UsersController < ApplicationController
  def index
  end

  def show
    @user = User.find_by(id: params[:id])
  end

  def new
  end

  def create
    my_user = User.create(password: params[:password], password_confirmation: params[:password_confirmation])

  end

  def edit
  end

  def update
  end

  def destroy
  end
end
