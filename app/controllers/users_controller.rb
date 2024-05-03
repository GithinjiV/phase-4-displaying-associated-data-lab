class UsersController < ApplicationController
    rescue_from ActiveRecord::RecordNotFound, with: :render_record_not_found
    def show
        user = User.find(params[:id])
        render json: user, include: :items
    end

    private

    def render_record_not_found
        render json: {error: "Record not found."}, status: :unprocessable_entity
    end

end
