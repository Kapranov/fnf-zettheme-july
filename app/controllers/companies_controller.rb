class CompaniesController < ApplicationController
  before_action :set_company, only: [:show, :edit, :update, :destroy]
  layout 'dashboards'

  def index
    @users = User.all
    @companies = current_user.companies
  end

  def show
  end

  def new
    @company = current_user.companies.new
  end

  def edit
  end

  def create
    @company = current_user.companies.build(company_params)
    @company.user_id = current_user.id

    respond_to do |format|
      if @company.save
        format.html { redirect_to @company, notice: 'Company was successfully created.' }
        format.json { render :show, status: :created, location: @company }
      else
        format.html { render :new }
        format.json { render json: @company.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @company.update(company_params)
        format.html { redirect_to @company, notice: 'Company was successfully updated.' }
        format.json { render :show, status: :ok, location: @company }
      else
        format.html { render :edit }
        format.json { render json: @company.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @company.destroy
    respond_to do |format|
      format.html { redirect_to companies_url, notice: 'Company was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    def set_company
      @company = Company.find(params[:id])
      unless @company = current_user.companies.where(id: params[:id]).first
        flash[:alert] = 'Company not found.'
        redirect_to root_url
      end
    end

    def company_params
      params.require(:company).permit(
        :user_id,
        :name,
        :description,
        :status,
        attachments_attributes: [
          :id,
          :company_id,
          :_destroy,
          :attach,
          :attach_filename,
          :attach_size,
          :file_content_type,
          :attach_cache_id,
          :remove_attach
        ],
        uploads_avatars: [ ]
      )
    end
end
