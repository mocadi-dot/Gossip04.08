class SessionsController < ApplicationController

  def new
  end

  def create
    # cherche un utilisateur existant
    user = User.find_by(email: params[:email])

    # on vérification et authentification ac mdp (gem bcrypt)
    if user&.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to gossips_path
    else
      flash.now[:danger] = 'Invalid email/password combination'
      render :new
    end
  end

  def destroy
    session.delete(:user_id)
    redirect_to gossips_path
  end
end
