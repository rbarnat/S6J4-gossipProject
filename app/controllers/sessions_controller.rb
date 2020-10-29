class SessionsController < ApplicationController
  def new
    @user = User.new
  end

  def create
    # cherche s'il existe un utilisateur en base avec l’e-mail
    @user = User.find_by(email: params[:email])

    # on vérifie si l'utilisateur existe bien ET si on arrive à l'authentifier (méthode bcrypt) avec le mot de passe
    if @user && @user.authenticate(params[:password])
      log_in(@user)
      flash[:success] = "Vous êtes maintenant connecté."
      redirect_to root_path
    else
      flash.now[:danger] = "La connexion a échoué : mauvaise combinaison email/mot de passe."
      render :new
    end
  end

  def destroy
    log_out()
    flash[:success] = "Vous êtes maintenant déconnecté."
    redirect_to root_path
  end
end
