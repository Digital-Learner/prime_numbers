require 'spec_helper'

describe PrimeNumber do 

  # first 10 prime numbers [2, 3, 5, 7, 11, 13, 17, 19, 23, 29]

  # based on Sieve of Erotosthenes (en.wikipedia.org/wiki/Sieve_of_Eratosthenes)
  # Algorithm Description
  # =====================
  # To find all the prime numbers less than or equal to a given integer n by Eratosthenes' method:
  # Create a list of consecutive integers from 2 to n: (2, 3, 4, ..., n).
  # Initially, let p equal 2, the first prime number.
  # Starting from p, count up in increments of p and mark each of these numbers greater than p itself in the list. 
  #   These will be multiples of p: 2p, 3p, 4p, etc.; 
  #   note that some of them may have already been marked.
  # Find the first number greater than p in the list that is not marked. 
  #   If there was no such number, stop. 
  #    Otherwise, let p now equal this number (which is the next prime), and repeat from step 3.
  # When the algorithm terminates, all the numbers in the list that are not marked are prime.

  describe "Generate 1st 'n' prime numbers" do

    let(:pm) { PrimeNumber.new(10) }

    context "initialization" do

      it "should initialise 'up_to' with '10'" do
        pm.up_to.should == 10
      end
    end

    context "range generation" do
      before(:each) do
        @pm = PrimeNumber.new(10).generate_range 
      end

      # take the number of primes to find and create a range 
      # which is n squared and only odd numbers (approximation)
      it "creates range from 2 to the square of 'up_to' numbers" do
        @pm.should cover(2, 3, 99, 100)
      end

      it "created range should exclude numbers outside the range '(1, 101)'" do
        @pm.should_not cover(1, 101)
      end
    end

    context "creates array of odd numbers generation from range" do

      it "should contain '3, 5, 97, 99'" do
        pm.create_candidates_array.should include(3, 5, 97, 99)
      end

      it "should not contain '1, 2, 4, 100, 101'" do
        pm.create_candidates_array.should_not include(1, 2, 4, 100, 101)
      end

      it "should have minimum of '3'" do
        pm.create_candidates_array.min.should == 3
      end

      it "should have maximum of '99'" do
        pm.create_candidates_array.max.should eq 99
      end

      it "should have size of '49' elements" do
        pm.create_candidates_array.size.should == 49
      end
    end

  end
end