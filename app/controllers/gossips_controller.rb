class GossipsController < ApplicationController

  def home
    @gossips = Gossip.all
  end

  def show
    @gossip = Gossip.find(params[:id])
  end

  def edit
  end

  def new
  end

  def author
  @user= User.find(params[:id])
end

end
