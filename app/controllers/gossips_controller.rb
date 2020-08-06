class GossipsController < ApplicationController
  before_action :authenticate_user, only: %i[new create edit update destroy]

  def home
    @gossips = Gossip.all
  end

  def show #testé
    @gossip = Gossip.find(params[:id])
  end

  def new
    @gossip = Gossip.new
  end

  def create
    @gossip = Gossip.new(gossips_params)
    city = City.new
    user = User.new
    user.city = city
    @gossip.user = user
    if @gossip.save
      redirect_to gossips_path
    else
      render 'new'
    end
  end

  def index
   @gossips = Gossip.all
 end

 def edit#aussi appelé update
   @gossip = Gossip.find(params[:id])
 end

 def destroy
  @gossip = Gossip.find(params[:id])
  @gossip.destroy

  redirect_to gossips_path
end

 private

  def gossips_params
      params.require(:gossip).permit(:title, :content)
  end

  def authenticate_user
      unless current_user
        flash[:danger] = 'Connextez-vous pour créer un potin'
        redirect_to new_session_path
      end
    end

end
