class ErrorsController < ApplicationController
  before_filter :authenticate_user!, except: [:show]
  layout 'errors', only: [:show]

  def show
    render status_code.to_s, :status => status_code
  end

  protected

  def status_code
    params[:code] || 500
  end
end
