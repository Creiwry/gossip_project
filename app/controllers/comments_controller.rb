# frozen_string_literal: true

# Comments Controller
class CommentsController < ApplicationController
  def index; end

  def show;
    puts params
  end

  def new; end

  def create
    puts '$' * 10
    puts params
    puts '$' * 10

    @post = Comment.new(content: params[:content], user_id: 42, gossip_id: params[:gossip_id])

    if @post.save
      puts "SUCCESS"

      redirect_to gossip_path(params[:gossip_id]), notice: 'Comment posted successfully'
    else
      puts "FAIL"

      redirect_to gossip_path(params[:gossip_id])

    end
  end

  def edit;
    puts params
    @comment = Comment.find(params[:id])
  end

  def update;
    @comment = Comment.find(params[:id])
    post_params = params.require(:comment).permit(:content)

    if @comment.update(post_params)

      redirect_to gossip_path(params[:gossip_id]), notice: "Comment edited"
    else
      flash.now[:alert] = @comment.errors.full_messages.join(', ')
      render :edit, status: :unprocessable_entity
    end

  end

  def destroy;
    @comment = Comment.find(params[:id])
    @comment.destroy
    redirect_to root_path, notice: 'Comment deleted successfully'
  end
end
