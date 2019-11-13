# communicate_system

Points to be implemented in the challange: 

1- to get application by token and not the id , and get chat by application token with the number of chat and messages as well -> in index, show and will be assoc in create, and in router I use hierarchy way for routes.

2- elastic search -> I use the gen of elastic search.

3- Add a scheduler job to run every 45 min to get all chats and update application table with chat counts, and get all messages group by chat id and update meesage count in chat table.

4- Add message and chat creation Using Rabbitmq "bunny gem", to avoid race condition in database write, the queue will handle the params comes from api and then consume this params and create the meesage and chat with consistency.

5- Add docker compose.