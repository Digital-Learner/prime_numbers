require 'spec_helper'

module CodeChallenge
  describe Challenge do
    
    describe "#main" do
      it "sends code challenge message" do
        output = double('output')
        challenge = Challenge.new(output)

        output.should_receive(:puts).with('Challenge : Prime multiplication')

        challenge.main
      end

    end
  end
end