class SessionsController < ApplicationController
  # before_action :read_sessions
  before_action :read_users, only: [:new, :edit, :create, :update]
  before_action :set_session, only: [:show, :update, :edit, :destroy]
  # delete this when we deploy
  skip_before_action :verify_authenticity_token

  def index
    # send back all the resources to the client

    # render json: { sessions: sessions }
    # render json: @sessions
    @sessions = Session.all
  end

  def show
    # @session = @sessions.find do |session|
    #   session.id == params[:id].to_i
    # end
  end

  def new
    @session = Session.new
  end

  def create
    # new_session = { id: params[:id].to_i, title: params[:title], description: params[:description] }
    # @sessions << new_session
    # write_sessions(@sessions)
    # redirect_to sessions_path
    @session = Session.create(session_params)
    redirect_to @session
  end

  def edit
  end

  def update
    begin
      @session.update!(session_params)
      redirect_to @session
    rescue
      render 'edit'
    end
  end

  def destroy
    @session.destroy
    redirect_to sessions_path
  end

  private

  def write_sessions(sessions)
    File.write(Rails.public_path.join('sessions.json'), JSON.generate(sessions))
  end

  def read_sessions
    # @sessions = JSON.parse(File.read(Rails.public_path.join('sessions.json')))
    @sessions = Session.all
  end

  def read_users
    @users = User.order(:first_name)
  end

  def set_session
    @session = Session.find(params[:id])
  end

  def session_params
    return params.require(:session).permit(:title, :description, :user_id)
    # return params.permit(:title, :description, :user_id)
  end
end
