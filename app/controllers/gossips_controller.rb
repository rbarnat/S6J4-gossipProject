class GossipsController < ApplicationController
  before_action :authenticate_user, only: [:show, :new, :create, :edit, :update, :destroy]

  def index
    # Méthode qui récupère tous les potins et les envoie à la view index (index.html.erb) pour affichage
    @gossips = Gossip.all
  end

  def show
    # Méthode qui récupère le potin concerné et l'envoie à la view show (show.html.erb) pour affichage
    @gossip_comment = GossipComment.new
    @gossip = Gossip.find(params[:id])
  end

  def new
    # Méthode qui crée un potin vide et l'envoie à une view qui affiche le formulaire pour 'le remplir' (new.html.erb)
    @gossip = Gossip.new
  end

  def create
    # Méthode qui créé un potin à partir du contenu du formulaire de new.html.erb, soumis par l'utilisateur
    # pour info, le contenu de ce formulaire sera accessible dans le hash params (ton meilleur pote)
    # Une fois la création faite, on redirige généralement vers la méthode show (pour afficher le potin créé)
    @gossip = Gossip.new(title: params[:title], content: params[:content], user_id: current_user.id, city_id: City.ids.sample)

    if @gossip.save # essaie de sauvegarder en base @gossip
      # si ça marche, il redirige vers la page d'index du site
      flash[:success] = "Le potin a bien été créé."
      redirect_to gossips_path
    else
      # sinon, il render la view new (qui est celle sur laquelle on est déjà)
      flash.now[:danger] = "Le potin n'a pas été créé."
      render :new
    end
  end

  def edit
    # Méthode qui récupère le potin concerné et l'envoie à la view edit (edit.html.erb) pour affichage dans un formulaire d'édition
    @gossip = Gossip.find(params[:id])
  end

  def update
    # Méthode qui met à jour le potin à partir du contenu du formulaire de edit.html.erb, soumis par l'utilisateur
    # pour info, le contenu de ce formulaire sera accessible dans le hash params
    # Une fois la modification faite, on redirige généralement vers la méthode show (pour afficher le potin modifié)
    @gossip = Gossip.find(params[:id])

    if @gossip.update(title: params[:title], content: params[:content], user_id: current_user.id, city_id: @gossip.city_id) # essaie de sauvegarder en base @gossip
      # si ça marche, il redirige vers la page d'index du site
      flash[:success] = "Le potin a bien été mis à jour."
      redirect_to gossips_path
    else
      # sinon, il render la view new (qui est celle sur laquelle on est déjà)
      flash.now[:danger] = "Le potin n'a pas été mis à jour."
      render :edit
    end
  end

  def destroy
    # Méthode qui récupère le potin concerné et le détruit en base
    # Une fois la suppression faite, on redirige généralement vers la méthode index (pour afficher la liste à jour)
    @gossip = Gossip.find(params[:id])
    @gossip.destroy
    redirect_to gossips_path
  end

  private

  def post_params
    param.require(:gossip).permit(:title, :content, :user_id, :city_id)
  end
end