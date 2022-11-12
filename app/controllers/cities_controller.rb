# frozen_string_literal: true

# Cities Controller
class CitiesController < ApplicationController
  def index; end

  def show
    @city = City.find_by(id: params[:id])
    @users = []
    User.where(city_id: @city.id).each do |user|
      puts user.id
      @users << user.id
    end
    puts @users.class
  end

  def new; end

  def create; end

  def edit; end

  def update; end

  def destroy; end
end
