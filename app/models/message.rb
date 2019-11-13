
require 'elasticsearch/model'

class class Message < ApplicationRecord
  include Elasticsearch::Model
  include Elasticsearch::Model::Callbacks
end
Message.import