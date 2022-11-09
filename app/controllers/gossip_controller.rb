class GossipController < ApplicationController
  def show
    @gossip = Gossip.find_by(id: params[:id])
  end
end
