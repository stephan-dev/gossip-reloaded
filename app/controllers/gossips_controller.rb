class GossipsController < ApplicationController
	def new
		@gossip = Gossip.new
	end

	def create
		gossip = params[:gossip]
		@gossip = Gossip.create!(content: gossip[:content])

		redirect_to @gossip
	end

	def show
		@gossip = Gossip.find(params[:id])
	end
end
