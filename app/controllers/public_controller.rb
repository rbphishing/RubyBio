class PublicController < ApplicationController
  def show
    @user = User.find_by(username: params[:username])

    if @user.nil?
      redirect_to "/", alert: "Usuário não encontrado"
      return
    end

   @links = @user.links.where(active: true)
  end
end