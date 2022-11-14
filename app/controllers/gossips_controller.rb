class GossipsController < ApplicationController
  def index
  end

  def show
    @gossip = Gossip.find_by(id: params[:id])
  end

  def new
    @gossip = Gossip.new
  end

  def create
    # puts '$' * 10
    # puts params
    # puts '$' * 10

    @gossip = Gossip.new(title: params[:title], content: params[:content], user_id: 42)

    if @gossip.save
      redirect_to root_path, notice: 'Gossip posted successfully'
    else
      messages = []

    #   @gossip.errors.messages.each do |type, message|
    # #    type.each do |message|
    #       messages << message
    # #    end
    #   end
      flash.now[:alert] = @gossip.errors.full_messages.join(', ')
      render 'new', status: :unprocessable_entity
      # redirect_to new_gossip_path, alert: messages.join(', ')

    end
  end

  def edit
    @gossip = Gossip.find_by(id: params[:id])
  end

  def update
    @gossip = Gossip.find(params[:id])
    post_params = params.require(:gossip).permit(:title, :content)

    if @gossip.update(post_params)
      redirect_to gossip(params[:gossip_id])
    else
      render :edit
    end

  end

  def destroy
    @gossip = Gossip.find(params[:id])
    @gossip.destroy
    redirect_to root_path, notice: 'Gossip deleted successfully'
  end
end
