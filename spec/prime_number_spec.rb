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

    context "initialization" do

      it "should initialise 'up_to' with '10'" do
        pm = PrimeNumber.new(10)
        pm.up_to.should == 10
      end
    end

  end
end