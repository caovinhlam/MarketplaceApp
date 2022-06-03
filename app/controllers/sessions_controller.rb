class SessionsController < ApplicationController
    before_action :read_sessions

    def index
        # send back all the resources to the client

        # render json: { sessions: sessions }
        render json: @sessions
    end

    def show

        found_session = @sessions.find do |session| 
           session["id"] == params[:id].to_i
        end

        render json: found_session
    end

    def read_sessions
        @sessions = JSON.parse(File.read(Rails.public_path.join('sessions.json')))
    end
end
