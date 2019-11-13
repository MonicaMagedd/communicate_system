every 45.minutes do
    command "echo 'Update Job started'"
    runner "Jobs.UpdateCounts.update_messages_count"
    runner "Jobs.UpdateCounts.update_chats_count"
end