class SessionsController < ApplicationController
  # before_action :authenticate_user, only: [:index]

  def new
    user = User.new
  end

  def create
    # cherche s'il existe un utilisateur en base avec l’e-mail
    user = User.find_by(email: params[:email])

    # on vérifie si l'utilisateur existe bien ET si on arrive à l'authentifier (méthode bcrypt) avec le mot de passe
    if user && user.authenticate(params[:password])
      log_in(user)
    else
      flash.now[:danger] = 'Mauvaise combinaison email/mot de passe !'
      render 'new'
    end
  end

  def destroy
  end

  # private

  # def authenticate_user
  #   unless current_user
  #     flash[:danger] = "Veuillez vous connecter."
  #     redirect_to new_session_path
  #   end
  # end
end
