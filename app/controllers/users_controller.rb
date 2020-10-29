class UsersController < ApplicationController
  def index
    # Méthode qui récupère tous les potins et les envoie à la view index (index.html.erb) pour affichage
    @user = User.all
  end

  def show
    # Méthode qui récupère le potin concerné et l'envoie à la view show (show.html.erb) pour affichage
    @user = User.find(params[:id])
  end

  def new
    # Méthode qui crée un potin vide et l'envoie à une view qui affiche le formulaire pour 'le remplir' (new.html.erb)
    @user = User.new( first_name: "",
                      last_name: "",
                      description: "",
                      email: "",
                      age: "",
                      password: "",
                      password_confirmation: "",
                      city_id: City.ids.sample)
  end

  def create
    # Méthode qui créé un potin à partir du contenu du formulaire de new.html.erb, soumis par l'utilisateur
    # pour info, le contenu de ce formulaire sera accessible dans le hash params (ton meilleur pote)
    # Une fois la création faite, on redirige généralement vers la méthode show (pour afficher le potin créé)
    @user = User.new( first_name: params[:first_name],
                      last_name: params[:last_name],
                      description: params[:description],
                      email: params[:email],
                      age: params[:age],
                      password: params[:password],
                      password_confirmation: params[:password_confirmation],
                      city_id: City.ids.sample)

    if @user.save # essaie de sauvegarder en base @gossip
      # si ça marche, il redirige vers la page d'index du site
      flash[:success] = "Votre profil a bien été créé. Vous êtes désormais connecté."
      log_in(@user)
      redirect_to root_path
    else
      # sinon, il render la view new (qui est celle sur laquelle on est déjà)
      flash.now[:danger] = "Votre profil n'a pas été créé."
      render :new
    end
  end

  def edit
    # Méthode qui récupère le potin concerné et l'envoie à la view edit (edit.html.erb) pour affichage dans un formulaire d'édition
    @user = User.find(params[:id])
    # @id = params[:id].to_i
  end

  def update
    # Méthode qui met à jour le potin à partir du contenu du formulaire de edit.html.erb, soumis par l'utilisateur
    # pour info, le contenu de ce formulaire sera accessible dans le hash params
    # Une fois la modification faite, on redirige généralement vers la méthode show (pour afficher le potin modifié)
    @user = User.find(params[:id])
    @user.update(post_params)
    redirect_to users_path
  end

  def destroy
    # Méthode qui récupère le potin concerné et le détruit en base
    # Une fois la suppression faite, on redirige généralement vers la méthode index (pour afficher la liste à jour)
    @user = User.find(params[:id])
    @user.destroy
    redirect_to users_path
  end

  private

  def post_params
    param.require(:user).permit(:first_name, :last_name, :description, :email, :age, :city_id)
  end
end
