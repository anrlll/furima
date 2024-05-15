class SessionsController < ApplicationController
  def new
    redirect_to new_user_session_path
  end

  def desrtoy
    redirect_to desrtoy_user_session_parh
  end
end
