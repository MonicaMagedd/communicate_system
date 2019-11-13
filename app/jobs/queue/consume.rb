  module Jobs
  module Queue
    class Consume

      require 'bunny'
      def try

          connection = Bunny.new(automatically_recover: false)
          connection.start
          
          channel = connection.create_channel
          queue = channel.queue('commun_queue')
          
          begin
            queue.subscribe(block: true) do |_delivery_info, _properties, body|
              # the queue received params and try to save on chat table or on message yable depend on params
            end
          rescue Interrupt => _
            connection.close
          
            exit(0)
          end
      end
  end
end