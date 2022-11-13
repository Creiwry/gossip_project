# frozen_string_literal: true

# Comments Controller
class CommentsController < ApplicationController
  def index; end

  def show; end

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

  def edit; end

  def update; end

  def destroy; end
end
