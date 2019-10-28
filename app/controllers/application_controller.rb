class ApplicationController < ActionController::Base
  protect_from_forgery
    
  helper_method :current_user, :login!, :logout!, :logged_in?, :vote_up, :vote_down, :require_user!

  private
    
    def current_user
      @current_user ||= User.find_by(session_token: session[:session_token])
    end

    def login!(user)
      @current_user = user
      session[:session_token] = user.reset_session_token!
    end

    def logout!
      current_user.reset_session_token!
      session[:session_token] = nil
    end

    def logged_in?
      !!current_user
    end
    
    def require_user!
      redirect_to new_session_url unless logged_in?
    end

    def vote_up(object)
      vote = object.votes.new(value: 1)
      flash[:errors] = "You already voted." unless vote.save
      redirect_to request.referer
    end

    def vote_down(object)
      vote = object.votes.new(value: -1)
      flash[:errors] = "You already voted." unless vote.save
      redirect_to request.referer
    end
end
