module UpdateCounts

        def update_messages_count()
            Messages.group_by("chat_id").count()
            # update chat with message count
        end


        def update_chats_count()
            Chat.group_by("application_id").count()
            # update application with chat count
        end
    end