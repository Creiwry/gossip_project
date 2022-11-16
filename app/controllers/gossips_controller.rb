require_relative './tag_controller'

class GossipsController < ApplicationController

  before_action :authenticate_user, only: [:index, :create, :edit, :destroy]
  def index
    @user = User.find(session[:user_id])
  end

  def show
    @gossip = Gossip.find_by(id: params[:id])
    @tags = TagsController.show(params[:id])
  end

  def new
    @tags = tags()
    @gossip = Gossip.new
  end

  def create
    puts '$' * 10
    puts params
    puts '$' * 10
    @tags = tags()

    @gossip = Gossip.new(title: params[:title], content: params[:content], user_id: session[:user_id])

    puts @gossip.id


    if @gossip.save
      TagsController.create(@gossip.id, params[:tag_id])
      redirect_to root_path, notice: 'Gossip created successfully'

    else

      flash.now[:alert] = @gossip.errors.full_messages.join(', ')
      render 'new', status: :unprocessable_entity

    end
  end

  def edit
    @tags = tags()
    @gossip = Gossip.find_by(id: params[:id])
  end

  def update

    @tags = tags()
    @gossip = Gossip.find(params[:id])
    post_params = params.require(:gossip).permit(:title, :content, :tag_id)

    if @gossip.update(title: post_params[:title], content: post_params[:content])
      puts '$' * 10
      puts "saved gossip"
      puts '$' * 10
      if TagsController.create(params[:id], post_params[:tag_id])
        redirect_to gossip_path(params[:id]), notice: 'Gossip updated successfully'
      else
        flash.now[:alert] = 'something went wrong'
        render :edit, status: :unprocessable_entity
      end
    else
      flash.now[:alert] = 'something went wrong'
      render :edit, status: :unprocessable_entity
    end

  end

  def destroy
    @gossip = Gossip.find(params[:id])
    @gossip.destroy
    redirect_to root_path, notice: 'Gossip deleted successfully'
  end

  private
  def tags
    tags = Tag.all
  end

  def authenticate_user
    unless current_user
      flash[:danger] = "Please log in."
      redirect_to new_session_path
  end

end
