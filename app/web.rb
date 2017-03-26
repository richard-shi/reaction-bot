require 'sinatra/base'

module Reactionbot
  class Web < Sinatra::Base
    get '/' do
      'ReactionBot'
    end
  end
end
