module Queue 
    class Sender
    require 'bunny'
        def try(params)
            connection = Bunny.new
            connection.start
            channel = connection.create_channel
            queue = channel.queue('commun_queue')

            channel.default_exchange.publish(params, routing_key: queue.name) 
        end
end
