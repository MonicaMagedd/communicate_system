module Api
    class MessagesController < ApplicationController

        # rescue_from ActiveRecord::RecordNotFound, with: :record_not_found
        before_action :set_message, only: [:show, :update, :destroy]
    
        def index
            application = Application.new
            sp_application = application.first.where(token: params['application_id'])
            chat = Chat.new
            sp_chat = chat.first.where(application_id: sp_application.id, number: params['chat_id'])
            @messages = Message.all.where(chat_id: sp_chat.id)
            render json: {status: 'SUCCESS', message: 'Loaded all messages', data: @messages}, status: :ok
        end
    
        # POST /messages
        def create
            # we have to call send"app/jobs/queue/send.rb" to queue instead of create and enqueue the params and the creation goes in consumer"app/jobs/queue/consume.rb"" 
            @message = Message.create!(message_params)
            render json: {status: 'SUCCESS', message: 'Message Created', data: @message}, status: :ok
        end
    
        # GET /messages/:id
        def show
            render json: {status: 'SUCCESS', message: 'Message', data: @message}, status: :ok
        end
    
        # PUT /messages/:id
        def update
            @message.update(message_params)
            head :no_content
        end
    
        # DELETE /messages/:id
        def destroy
            @message.destroy
            head :no_content
        end
    
        private
    
        def message_params
            # whitelist params
            permitted = params.permit(:number, :body, :chat_id)
        end
    
        def set_message
            application = Application.new
            sp_application = application.first.where(token: params['application_id'])
            chat = Chat.new
            sp_chat = chat.first.where(application_id: sp_application.id, number: params['chat_id'])
            @message = Message.where(chat_id: sp_chat.id, number: params['id'])
        end
    end
end
