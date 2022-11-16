require_relative './tag_controller'

class GossipsController < ApplicationController
  def index
  end

  def show
    @gossip = Gossip.find_by(id: params[:id])
    @tags = TagsController.show(params[:id])
    puts @tags
  end

  def new
    @tags = tags()
    puts @tags.class.to_s + " HERE"
    @gossip = Gossip.new
  end

  def create
    puts '$' * 10
    puts params
    puts '$' * 10
    @tags = tags()
    puts @tags.class.to_s + "HERE"

    @gossip = Gossip.new(title: params[:title], content: params[:content], user_id: 42)
    puts '$' * 10
    puts "Tag id " + params[:tag_id]
    puts '$' * 10
    puts @gossip.id


    if @gossip.save
      puts "saved gossip"
      TagsController.create(@gossip.id, params[:tag_id])
      redirect_to root_path, notice: 'Gossip created successfully'

    else
      puts '$' * 10
      puts "didn't save"
      puts '$' * 10

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
    @tags = tags()
    @gossip = Gossip.find_by(id: params[:id])
  end

  def update

    @tags = tags()
    @gossip = Gossip.find(params[:id])
    post_params = params.require(:gossip).permit(:title, :content, :tag_id)
    puts '$' * 10
    puts "parameters: " + params.to_s
    puts post_params
    puts "gossip id: " + params[:id].to_s
    puts '$' * 10

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

end
