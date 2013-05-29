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

      it "should create an empty 'prime_numbers' array" do
        pm.prime_numbers.should be_empty
      end

      it "should create an empty 'candidates' array" do
        pm.candidates.should be_empty
      end
    end


    context "range generation" do

      context "upper range limit" do
        # Need to calculate approximation of maximum value for range.
        # Use this approximation and modify to use nn > 3
        # Source: http://stackoverflow.com/questions/1042902/most-elegant-way-to-generate-prime-numbers/1043247

        it "should have a 'range_upper_limit' of 31 when 'n=10'" do
          pm.range_upper_limit.should eq 31
        end

        it "should have a 'range_upper_limit' of 77497 when 'n=7021'" do
          pm = PrimeNumber.new(7021)
          pm.range_upper_limit.should eq 77497
        end

        it "should have a 'range_upper_limit' of 70919 when 'n=7022" do
          pm = PrimeNumber.new(7022)
          pm.range_upper_limit.should eq 70919
        end
      end

      before(:each) do
        @pm = PrimeNumber.new(10).generate_range 
      end

      # take the number of primes to find and create a range 
      # which is n squared and only odd numbers (approximation)
      it "creates range from 2 to the value of 'range_upper_limit' numbers" do
        @pm.should cover(2, 3, 27, 29, 31)
      end

      it "created range should exclude numbers outside the range '(1, 31)'" do
        @pm.should_not cover(1, 32, 101)
      end
    end

    context "creates array of odd numbers generation from range" do

      it "should contain '3, 5, 27, 31'" do
        pm.create_candidates_array.should include(3, 5, 27, 31)
      end

      it "should not contain '1, 2, 4, 32, 100, 101'" do
        pm.create_candidates_array.should_not include(1, 2, 4, 32, 100, 101)
      end

      it "should have minimum of '3'" do
        pm.create_candidates_array.min.should == 3
      end

      it "should have maximum of '31'" do
        pm.create_candidates_array.max.should eq 31
      end

      it "should have size of '15' elements" do
        pm.create_candidates_array.size.should == 15
      end
    end

    describe "prime number calculation" do

      context "prime number array" do
        before(:each) do
          @prime_numbers = pm<<(2)
        end

        # simply add the only even number which is a prime number
        # to the prime numbers array
        it "should include the first prime number '2'" do
          @prime_numbers.should include(2)
        end

        it "should have 1 item after adding '2'" do
          @prime_numbers.should have(1).items
        end
      end

      context "adds 1st element of 'candidates' to 'prime_numbers'" do
        before(:each) do
          @candidates = pm.create_candidates_array
          @prime_numbers = pm.move_zeroth_element_to_primes
        end

        it "adds 1st element of 'candidates' array to 'prime_numbers' array" do
          @candidates[0].should == 3
          @prime_numbers.should include(3)
        end

        it "'prime_numbers' should have 1 item" do
          @prime_numbers.should have(1).items
        end

        it "'prime_numbers' should contain '2, 3' when starting from 2" do
          @prime_numbers = pm<<(2)
          @prime_numbers.should include(2,3)
        end
      end

      context "removes 1st and all multiples of 1st element from 'candidates' array" do
        before(:each) do
          @candidates = pm.create_candidates_array
        end

        it "should not include '3, 9, 15, 21, 27'" do
          @candidates[0].should == 3
          @candidates = pm.delete_multiples_of_zeroth_element(@candidates.first)
          @candidates.should_not include(3, 9, 15, 21, 27)
        end

        it "should have '10' items" do
          @candidates = pm.delete_multiples_of_zeroth_element(@candidates.first)
          @candidates.should have(10).items
        end

        it "should include numbers not divisable by '3' when starting from '2'" do
          @candidates = pm.delete_multiples_of_zeroth_element(@candidates.first)
          @candidates.should include(5, 7, 11, 13, 17, 19, 23, 25, 29, 31)
        end
      end

      context "iterates over all 'candidates' until 'up_to' number reached" do
        let(:prime_numbers) { pm.main }

        it "has 'up_to' prime numbers in 'prime_numbers' array" do
          prime_numbers.should have(10).items
        end

        it "should contain prime numbers in 'prime_numbers' array" do
          prime_numbers.should include(2, 3, 5, 7, 11, 13, 17, 19, 23, 29)
        end

        it "should not contain numbers which are outside 'nth' range" do
          prime_numbers.should_not include(31, 37)
        end
      end
    end
  end
end