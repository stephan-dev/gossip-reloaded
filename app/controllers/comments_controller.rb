class CommentsController < ApplicationController

	def new
		@comment = Comment.new
	end

	def create
		paracomm = params[:comment]
		puts "ceci est params[:comment] dans la méthode create commentaire : #{paracomm}"
		@gossip = Gossip.find(params[:gossip_id])
#		puts @gossip
		@comment = @gossip.comments.create(content: paracomm[:content] )

		puts @comment
		redirect_to gossip_comment_path(@gossip, @comment)
		#action:gossip_comment_path, id:1
	end

	def show
		@gossip = Gossip.find(params[:gossip_id])
		
		puts "ceci est @gossip #{@gossip}"
		puts "ceci est @gossip.content : #{@gossip.content}"
		puts "ceci est params : #{params}"

		return @comment
		@commentaire = Comment.find(id: params[:comment_id])

		#Couldn't find Comment with 'id'={:gossip_id=>"1"}
	end

	def index
		@comment = Comment.all
	end
end
