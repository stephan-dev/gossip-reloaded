class GossipsController < ApplicationController
	def new
		@gossip = Gossip.new
		#@comment = Comment.new
	end

	def create
		gossip = params[:gossip]
		@gossip = Gossip.create!(content: gossip[:content])

		redirect_to @gossip
	end

	def show
		@gossip = Gossip.find(params[:id])
		puts session[:current_user_id]
	end

	def edit
		@gossip = Gossip.find(params[:id])
	end

	def update
	  @gossip = Gossip.find(params[:id])

		gossip_params = params.require(:gossip).permit(:anonymous_gossiper, :content)
		@gossip.update(gossip_params)

		redirect_to gossips_path
	end

	def index
		@gossip = Gossip.all
	end

	def destroy
		@gossip = Gossip.find(params[:id])
		@gossip.destroy
		redirect_to gossips_path
	end
end
