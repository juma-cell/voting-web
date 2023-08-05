# app/controllers/voting_events_controller.rb
class VotingEventsController < ApplicationController
    before_action :set_voting_event, only: [:show, :update, :destroy]
  
    def index
      @voting_events = VotingEvent.all
      render json: @voting_events
    end
  
    def show
      render json: @voting_event
    end
  
    def create
      @voting_event = VotingEvent.new(voting_event_params)
  
      if @voting_event.save
        render json: @voting_event, status: :created
      else
        render json: @voting_event.errors, status: :unprocessable_entity
      end
    end
  
    def update
      if @voting_event.update(voting_event_params)
        render json: @voting_event, status: :ok
      else
        render json: @voting_event.errors, status: :unprocessable_entity
      end
    end
  
    def destroy
      @voting_event.destroy
      head :no_content
    end
  
    private
  
    def set_voting_event
      @voting_event = VotingEvent.find(params[:id])
    end
  
    def voting_event_params
      params.require(:voting_event).permit(:event_Name, :event_Description, :duration, :user_id)
    end
  end
  