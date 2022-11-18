# frozen_string_literal: true

# Comments Controller
class CommentsController < ApplicationController
  def index; end

  def show
    puts params
  end

  def new; end

  def create
    @post = Comment.new(content: params[:content], user_id: session[:user_id], gossip_id: params[:gossip_id])

    if @post.save
      redirect_to gossip_path(params[:gossip_id]), notice: 'Comment posted successfully'
    else
      redirect_to gossip_path(params[:gossip_id]), alert: @post.errors.full_messages.join(', ')
    end
  end

  def edit
    puts params
    @comment = Comment.find(params[:id])
    if @comment.user == current_user
      @comment
    else
      flash[:danger] = 'Please log in.'
      redirect_to new_session_path
    end
  end

  def update
    @comment = Comment.find(params[:id])
    post_params = params.require(:comment).permit(:content)

    if @comment.update(post_params)
      redirect_to gossip_path(params[:gossip_id]), notice: 'Comment edited'
    else
      flash.now[:alert] = @comment.errors.full_messages.join(', ')
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @comment = Comment.find(params[:id])

    if @comment.user == current_user
      @comment.destroy
      redirect_to root_path, notice: 'Comment deleted successfully'
    else
      flash[:danger] = 'Please log in.'
      redirect_to new_session_path
    end
  end

  private

  def current_user
    User.find_by(id: session[:user_id])
  end

  def log_in(user)
    session[:user_id] = user.id
  end
end
