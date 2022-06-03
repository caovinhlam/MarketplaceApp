class SessionsController < ApplicationController
  before_action :read_sessions
  # delete this when we deploy
  skip_before_action :verify_authenticity_token

  def index
    # send back all the resources to the client

    # render json: { sessions: sessions }
    render json: @sessions
  end

  def create
    new_session = { id: params[:id].to_i, title: params[:title], description: params[:description] }
    @sessions << new_session
    write_sessions(@sessions)
    render plain: "Added session!"
  end

  def show
    found_session = @sessions.find do |session|
      session['id'] == params[:id].to_i
    end

    render json: found_session
  end

  def write_sessions(sessions)
    File.write(Rails.public_path.join('sessions.json'), JSON.generate(sessions))
  end

  def read_sessions
    @sessions = JSON.parse(File.read(Rails.public_path.join('sessions.json')))
  end
end
