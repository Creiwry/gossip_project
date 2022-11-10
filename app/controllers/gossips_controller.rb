class GossipsController < ApplicationController
  def index
  end

  def show
    @gossip = Gossip.find_by(id: params[:id])
  end

  def new
  end

  def create
    puts '$' * 10
    puts params
    puts '$' * 10

    @post = Gossip.new(title: params[:title], content: params[:content], user_id: 42)
    puts @post
    if @post.save
      puts @post
      redirect_to root_path, notice: 'Gossip posted successfully'
    else
      messages = []

      @post.errors.messages.each do |type, message|
        messages << message
      end

      redirect_to new_gossip_path, notice: messages.join(', ')

    end
  end

  def edit
  end

  def update
  end

  def destroy
  end
end