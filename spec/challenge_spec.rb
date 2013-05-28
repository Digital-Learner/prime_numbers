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

      it "runs prime number generation" do
        # pending
        prime = double('prime')
        primes = PrimeNumber.new(prime)

        prime.should_receive(:array).with([2, 3, 5, 7, 11, 13, 17, 19, 23, 29])

        puts primes.main
      end
    end
  end
end