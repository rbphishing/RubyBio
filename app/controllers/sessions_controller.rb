class SessionsController < ApplicationController
  def new
  end
   
  def create
    user = User.find_by(email: params[:email])
    if user&.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to links_path, notice: "Logado com sucesso!"
    else
      flash.now[:alert] = "Email ou senha inválidos"
      render :new
    end
  end

  before_action :require_login, only: [:destroy]

  def redirect_if_logged_in
    redirect_to "/" if current_user
  end

  def destroy
    session[:user_id] = nil
    redirect_to "/login", notice: "Saiu com sucesso!"
  end
end
