class CommentsController < ApplicationController

	def new
		@comment = Comment.new
	end

	def create
		paracomm = params[:comment]
		puts paracomm
		@gossip = Gossip.find(params[:gossip_id])
#		puts @gossip
		@comment = @gossip.comments.create(content: paracomm[:content] )

		puts @comment
		redirect_to gossip_comment_path(@comment, :gossip_id)
		#action:gossip_comment_path, id:1
	end

	def show
		@commentaire = Comment.find(params[:gossip_id])
	end

	def index
		@comment = Comment.all
	end
end
