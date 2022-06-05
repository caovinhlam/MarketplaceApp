class SessionsController < ApplicationController
  # delete this when we deploy
  skip_before_action :verify_authenticity_token
  # before_action :set_user
  before_action :set_sessions
  # before_action :set_users, only: [:new, :edit, :create, :update]
  before_action :set_session, only: [:show, :update, :edit, :destroy]
  

  def index
  end

  def show
  end

  def new
    @session = Session.new
  end

  def create
    @session = current_user.sessions.create(session_params)
    if @session.valid?
        redirect_to @session
    else
      flash.now[:alert] = @session.errors.full_messages.join('<br>').html_safe
      render 'new'
    end
  end

  def edit
  end

  def update
    begin
      @session.update!(session_params)
      redirect_to @session
    rescue
      flash.now[:alert] = @session.errors.full_messages.join('<br>').html_safe
      render 'edit'
    end
  end

  def destroy
    @session.destroy
    redirect_to sessions_path
  end

  def mysession
  end

  private

  def set_sessions
    @sessions = Session.all
  end

  def set_users
    @users = User.order(:first_name)
  end

  def set_session
    @session = Session.find(params[:id])
  end

  def session_params
    return params.require(:session).permit(:title, :description)
  end

end
