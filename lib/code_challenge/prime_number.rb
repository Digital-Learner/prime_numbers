class PrimeNumber
  include Math
  attr_reader :prime_numbers, :candidates

  def initialize(up_to)
    @up_to = up_to
    @candidates = []
    @prime_numbers = []
  end

  def up_to
    @up_to
  end

  def range_upper_limit
    # Need to calculate approximation of maximum value for range.
    # Use this approximation and modify to use nn > 3
    # Source: http://stackoverflow.com/questions/1042902/most-elegant-way-to-generate-prime-numbers/1043247
    n = up_to

    if (n >= 7022) 
      upper_limit = n * Math.log(n) + n * (Math.log(Math.log(n)) - 0.9385)
    elsif (n >= 6)
      upper_limit = n * Math.log(n) + n * Math.log(Math.log(n))
    end
    upper_limit.round   
  end

  def generate_range
    Range.new(2, range_upper_limit)
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