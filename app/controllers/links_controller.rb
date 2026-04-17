class LinksController < ApplicationController
  before_action :require_login
  before_action :set_link, only: [:edit, :update, :destroy, :fetch_icon]

  def index
    @links = current_user.links
  end

  def new
    @link = Link.new
  end

  def create
    @link = current_user.links.build(link_params)

    if @link.save
      redirect_to links_path, notice: "Link criado!"
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @link.update(link_params)
        
      redirect_to links_path, notice: "Link atualizado!"
    else
      render :edit
    end
  end

  # 🔥 REDIRECT COM TRACKING
  def redirect
    link = Link.find(params[:id])

    if link.active
      link.increment!(:clicks)
      redirect_to link.url, allow_other_host: true
    else
      redirect_to "/", alert: "Link inativo"
    end
  end

  def destroy
    @link.destroy
    redirect_to links_path, notice: "Link excluído!"
  end

  # 🔥 PEGAR ÍCONE AUTOMÁTICO
  def fetch_icon
    begin
      uri = URI.parse(@link.url)
      domain = uri.host

      raise "URL inválida" if domain.nil?

      icon_url = "https://www.google.com/s2/favicons?domain=#{domain}&sz=128"

      @link.update(icon_url: icon_url)

      render json: {
        success: true,
        icon_url: icon_url
      }

    rescue => e
      render json: {
        success: false,
        error: e.message
      }, status: :unprocessable_entity
    end
  end

  private

  def set_link
    @link = current_user.links.find(params[:id])
  end

  def link_params
    params.require(:link).permit(:title, :url, :active, :icon_url)
  end
end