class GossipsController < ApplicationController
	def new
		@gossip = Gossip.new
	end

	def create
		gossip = params[:gossip]
		Gossip.create(content: gossip[:content])
	end
end
