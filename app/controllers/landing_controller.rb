class LandingController < ApplicationController
  before_filter :authenticate_user!, except: [:index]
  layout 'landing', only: [:index]

  def index; end
end
