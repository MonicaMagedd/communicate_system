module Api
class ApplicationsController < ApplicationController
    # rescue_from ActiveRecord::RecordNotFound, with: :record_not_found
    before_action :set_application, only: [:show, :update, :destroy]

    def index
        @applications = Application.all
        render json: {status: 'SUCCESS', message: 'Loaded all applications', data: @applications}, status: :ok
    end

    # POST /applications
    def create
        @application = Application.create!(application_params)
        render json: {status: 'SUCCESS', message: 'Application Created', data: @application}, status: :ok
    end

    # GET /applications/:id
    def show
        render json: {status: 'SUCCESS', message: 'Application', data: @application}, status: :ok
    end

    # PUT /applications/:id
    def update
        @application.update(application_params)
        head :no_content
    end

    # DELETE /applications/:id
    def destroy
        @application.destroy
        head :no_content
    end

    private

    def application_params
        # whitelist params
        params[:token] = SecureRandom.hex(3)
        params.permit(:token, :chat_counts, :name)
    end

    def set_application
        @application = Application.find(params[:id])
    end
    end
end