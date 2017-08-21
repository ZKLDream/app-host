class PlatsController < ApplicationController
  before_action :set_app, only: [:index, :show, :new, :create, :edit, :update, :destroy, :comments]
  before_action :set_plat, only: [:show]

  def index
    @plats = Plat.where(app_id:params[:app_id])
    if @plats.present?
      redirect_to app_plat_path @app,@plats.first
    end
  end

  def show
    @pkgs = @plat.pkgs
    @plats = Plat.where(app_id:params[:app_id])
  end

  def new
    @plat = @app.plats.build
  end

  def create
    plat = Plat.create(plat_params)
    redirect_to app_plat_path @app, plat
  end

  private
  # # Use callbacks to share common setup or constraints between actions.
  def set_app
    @app = App.find(params[:app_id])
  end
  
  def set_plat
    @plat = Plat.find(params[:id])
  end

  # # Never trust parameters from the scary internet, only allow the white list through.
  def plat_params
    params.require(:plat).permit(:name,:app_id,:plat);
  end
end