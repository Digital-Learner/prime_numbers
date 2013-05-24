class PrimeNumber
  attr_reader :prime_numbers, :candidates

  def initialize(up_to)
    @up_to = up_to
    @candidates = []
    @prime_numbers = []
  end

  def up_to
    @up_to
  end

  def generate_range
    # take the number of primes to find and create a range 
    # which is n squared and only odd numbers (approximation)
    Range.new(2, up_to**2)
  end

  def create_candidates_array
    @candidates = generate_range.to_a.delete_if { |num| num.even? }
  end

  def <<(prime_number)
    @prime_numbers << prime_number
  end

  def move_zeroth_element_to_primes
    @prime_numbers <<@candidates.first
  end

  def divisable_by(divisor)
    lambda { |element| element % divisor == 0}
  end

  def delete_multiples_of_zeroth_element(first_element)
    # use lambda here as returned empty candidates array
    # when simply assessing 'n(and multiples of) mod n == 0'
    @candidates.delete_if(&divisable_by(first_element))
  end

  def main
    create_candidates_array
    @prime_numbers << 2
    until @prime_numbers.size == up_to
      move_zeroth_element_to_primes
      delete_multiples_of_zeroth_element(@candidates[0])
    end
    @prime_numbers

  end
end