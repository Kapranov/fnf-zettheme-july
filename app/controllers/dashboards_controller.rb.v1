class DashboardsController < ApplicationController
  before_action :set_dashboard, only: [:show, :edit, :update, :destroy]
  layout 'dashboards', only: [:index]

  def index
    @users = User.all
    @dashboards = current_user.dashboards
  end

  def new
    @dashboard = current_user.dashboards.new
  end

  def create
    @dashboard = current_user.dashboards.build(dashboard_params)
    @dashboard.user_id = current_user.id

    respond_to do |format|
      if @dashboard.save
        format.html { redirect_to @dashboard, notice: 'Dashboard was successfully created.' }
        format.json { render :show, status: :created, location: @dashboard }
      else
        format.html { render :new }
        format.json { render json: @dashboard.errors, status: :unprocessable_entity }
      end
    end
  end

  private
    def set_dashboard
      @dashboard = Dashboard.find(params[:id])
      unless @dashboard = current_user.dashboards.where(id: params[:id]).first
        flash[:alert] = 'Dashboard not found.'
        redirect_to root_url
      end
    end

    def dashboard_params
      params.require(:dashboard).permit(:user_id)
    end
end
