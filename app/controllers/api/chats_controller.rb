module Api
    class ChatsController < ApplicationController
        # rescue_from ActiveRecord::RecordNotFound, with: :record_not_found
        before_action :set_chat, only: [:show, :update, :destroy]
    
        def index
            application = Application.new
            sp_application = application.first.where(token: params['application_id'])
            @chats = Chat.all.where(application_id: sp_application.id)
            render json: {status: 'SUCCESS', message: 'Loaded all chats', data: @chats}, status: :ok
        end
    
        # POST /chats
        def create
            # we have to call send"app/jobs/queue/send.rb" to queue instead of create and enqueue the params and the creation goes in consumer"app/jobs/queue/consume.rb"" 
            @chat = Chat.create!(chat_params)
            render json: {status: 'SUCCESS', message: 'Chat Created', data: @chat}, status: :ok
        end
    
        # GET /chats/:id
        def show
            render json: {status: 'SUCCESS', message: 'Chat', data: @chat}, status: :ok
        end
    
        # PUT /chats/:id
        def update
            @chat.update(chat_params)
            head :no_content
        end
    
        # DELETE /chats/:id
        def destroy
            @chat.destroy
            head :no_content
        end
    
        private
    
        def chat_params
            # whitelist params
            permitted = params.permit(:number, :message_counts, :application_id)
        end
    
        def set_chat
            application = Application.new
            sp_application = application.first.where(token: params['application_id'])
            @chat = Chat.where(application_id: sp_application.id, number: params['id'])
        end
    end
end