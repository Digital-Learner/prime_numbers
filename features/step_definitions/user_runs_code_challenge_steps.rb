class Output
  def messages
    @messages ||= []
  end

  def puts(message)
    messages << message
  end
end

def output
  @output ||= Output.new
end

Given(/^that I have not yet started$/) do
end

When(/^I start a new request$/) do
  challenge = CodeChallenge::Challenge.new(output)
  challenge.main
end

Then(/^I should see "(.*?)"$/) do |message|
  output.messages.should include(message)
end

