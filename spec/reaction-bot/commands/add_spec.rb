require 'spec_helper'

describe ReactionBot::Commands::Add do
  def app
    SlackMathbot::Bot.instance
  end

  subject { app }

  it 'should complain if no parameters' do
    expected_response = 'Error: Please give me a <trigger> word and a <image> link.'
    expect(message: "#{slackrubybot.config.user} add", channel: 'channel').to respond_with_slack_message(expected_response)
  end

  it 'should complain if missing image link' do
    expected_response = "Error: Hey, you're missing a reaction <image> link for me to post."
    expect(message: "#{slackrubybot.config.user} add key", channel: 'channel').to respond_with_slack_message(expected_response)
  end

  it 'should complain if invalid image link' do
    expected_response = "Error: Your image link doesn't work :("
    expect(message: "#{slackrubybot.config.user} add key notalink", channel: 'channel').to respond_with_slack_message(expected_response)
  end

#  it 'should tell you if image successfully added' do
#    expected_response = "I successfully added your image! I'll react to "
#    expect(message: "#{slackrubybot.config.user} add key ", channel: 'channel').to respond_with_slack_message(expected_response)
#  end
end
