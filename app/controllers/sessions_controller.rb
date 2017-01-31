class SessionsController < ApplicationController

  def create
    redirect_to dashboard_index_path
  end

end
