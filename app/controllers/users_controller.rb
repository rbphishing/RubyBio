class UsersController < ApplicationController
  before_action :redirect_if_logged_in, only: [:new, :create]

  def new
  end

  def create
    user = User.new(user_params)

    if user.save
      session[:user_id] = user.id
      redirect_to "/", notice: "Registrado com sucesso!"
    else
      flash.now[:alert] = user.errors.full_messages.to_sentence
      render :new
    end
  end

  private

  def user_params
    params.permit(:username, :email, :password, :password_confirmation)
  end

  def redirect_if_logged_in
    redirect_to "/" if current_user
  end
end
