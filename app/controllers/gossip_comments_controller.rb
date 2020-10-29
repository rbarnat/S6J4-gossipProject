class GossipCommentsController < ApplicationController
  def index
    @gossip_comments = GossipComment.all
  end

  def show
    @gossip_comment = GossipComment.find(params[:id])
  end

  def new
    @gossip_comment = GossipComment.new
  end

  def create
    @gossip_comment = GossipComment.new(content: params[:content], gossip_id: params[:gossip_id], user_id: User.ids.sample)
  
    if @gossip_comment.save
      flash[:success] = "Le commentaire a bien été créé."
      redirect_to gossip_path(params[:gossip_id])
    else
      flash.now[:danger] = "Le commentaire n'a pas été créé."
      render gossip_path(params[:gossip_id])
    end
  end

  def edit
    @gossip_comment = GossipComment.find(params[:id])
  end

  def update
    @gossip_comment = GossipComment.find(params[:id])
  
    if @gossip_comment.update(content: params[:content])
      redirect_to gossip_path(params[:gossip_id])
    else
      render edit_gossip_gossip_comment_path(params[:gossip_id],params[:id])
    end
  end

  def destroy
    @gossip_comment = GossipComment.find(params[:id])
    @gossip_comment.destroy
    redirect_to gossip_path(params[:gossip_id])
  end
end
