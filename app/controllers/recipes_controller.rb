class RecipesController < ApplicationController
    before_action :authorize

    def index
        recipe = Recipe.all
        render json: recipe, include: 'user', status: :created
    end

    def create
        recipe = Recipe.create!(
            title: params[:title], 
            instructions: params[:instructions], 
            minutes_to_complete: params[:minutes_to_complete], 
            user_id: session[:user_id]
            )
        render json: recipe, include: 'user', status: :created
    rescue ActiveRecord::RecordInvalid => invalid
        render json: { errors: [invalid.record.errors] }, status: :unprocessable_entity
    end

    private

    def authorize
        return render json: { errors: ["Unauthorized"] }, status: :unauthorized unless session.include? :user_id
    end
end
