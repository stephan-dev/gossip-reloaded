class UsersController < ApplicationController

  def home
    # if session[:user_id]
    #   @current_user = User.find(session[:user_id])
    # end
    
    #set_current_user
  end


	def login
	  session[:test] = "Valeur de test"
	end

  def check
    @current_user = User.where(name: params[:name], password: params[:password]).first
    if @current_user
      session[:user_id] = @current_user.id
      flash[:info] = "Vous êtes maintenant connecté"
      redirect_to "/users/home"
    else
      session[:user_id] = nil
      flash[:info] = "Échec de la connexion"
      redirect_to "/users/login"
    end
  end

  def new
  	@user = User.new
  end

  def create
  	user = params[:user]
  	@user = User.create!(name: user[:name], password: user[:password])
  end

end
