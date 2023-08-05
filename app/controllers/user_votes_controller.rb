# app/controllers/user_votes_controller.rb
class UserVotesController < ApplicationController
    before_action :set_user_vote, only: [:show, :update, :destroy]
  
    def index
      @user_votes = UserVote.all
      render json: @user_votes
    end
  
    def show
      render json: @user_vote
    end
  
    def create
      @user_vote = UserVote.new(user_vote_params)
  
      if @user_vote.save
        render json: @user_vote, status: :created
      else
        render json: @user_vote.errors, status: :unprocessable_entity
      end
    end
  
    def update
      if @user_vote.update(user_vote_params)
        render json: @user_vote, status: :ok
      else
        render json: @user_vote.errors, status: :unprocessable_entity
      end
    end
  
    def destroy
      @user_vote.destroy
      head :no_content
    end
  
    private
  
    def set_user_vote
      @user_vote = UserVote.find(params[:id])
    end
  
    def user_vote_params
      params.require(:user_vote).permit(:user_id, :voting_event_id)
    end
  end
  