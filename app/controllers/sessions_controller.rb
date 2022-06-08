class SessionsController < ApplicationController
  # uncomment during development
  skip_before_action :verify_authenticity_token
  # comment during development
  # before_action :authenticate_user!, except: [:index, :show]
  before_action :check_auth, only: [:mysession, :new, :create]
  before_action :set_sessions
  before_action :set_session, only: [:show, :update, :edit, :destroy]
  before_action :check_session, only: [:edit, :update, :destroy]

  def index
  end

  def show
  end

  def new
    @session = Session.new
  end

  # Grab current_user for their ID and associate ID as FK in session entity
  def create
    @session = current_user.sessions.create(session_params)
    if @session.valid?
      # Go to show page, flash a session created message
      redirect_to @session, notice: "Session has been created!".html_safe
    else
      # Error message if session doesn't have a title
      flash.now[:alert] = @session.errors.full_messages.join('<br>').html_safe
      render 'new'
    end
  end

  def edit
  end

  def update
    begin
      # Update session entity in DB based on EDIT form params
      @session.update!(session_params)
      # Display new changes
      redirect_to @session
    rescue
      # Error message if sessions doesn't have a title
      flash.now[:alert] = @session.errors.full_messages.join('<br>').html_safe
      render 'edit'
    end
  end

  # Delete session from Session Model
  def destroy
    begin
      # Doesn't work atm, keeps asking for api_key, maybe bugged?
      # @session.cover.purge
      # Cloudinary::Uploader.destroy(@session.cover)
      @session.destroy
      # Go back to home page
      redirect_to sessions_path
    rescue => error_msg
      redirect_to sessions_path, alert: error_msg
    end

  end

  def mysession
  end

  private

  def check_auth
    authorize Session
  end

  def check_session
    authorize @session
  end

  # Get all sessions from DB
  def set_sessions
    @sessions = Session.all
  end

  # Get all users from DB and order by first name
  def set_users
    @users = User.order(:first_name)
  end

  # Get a specific session from their ID
  def set_session
    @session = Session.find(params[:id])
  end

  # Grab required parameters from the EDIT/CREATE FORMS for POST
  def session_params
    return params.require(:session).permit(:title, :description, :cover)
  end

end
