# app/controllers/candidates_controller.rb
class CandidatesController < ApplicationController
    before_action :set_candidate, only: [:show, :edit, :update, :destroy]
  
    def index
      @candidates = Candidate.all
      render json: @candidates
    end
  
    def show
      render json: @candidate
    end
  
    def new
      @candidate = Candidate.new
    end
  
    def create
      @candidate = Candidate.new(candidate_params)
  
      if @candidate.save
        render json: @candidate, status: :created
      else
        render json: @candidate.errors, status: :unprocessable_entity
      end
    end
  
    def edit
    end
  
    def update
      if @candidate.update(candidate_params)
        render json: @candidate, status: :ok
      else
        render json: @candidate.errors, status: :unprocessable_entity
      end
    end
  
    def destroy
      @candidate.destroy
      head :no_content
    end
  
    private
  
    def set_candidate
      @candidate = Candidate.find(params[:id])
    end
  
    def candidate_params
      params.require(:candidate).permit(:role, :userName, :user_vote_id, :voting_event_id)
    end
  end
  