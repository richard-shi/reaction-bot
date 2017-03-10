require 'spec_helper'

describe ReactionBot::Bot do
  def app
    ReactionBot::Bot.instance
  end

  subject { app }

  it_behaves_like 'a slack ruby bot'
end
