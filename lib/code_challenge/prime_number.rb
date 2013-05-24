class PrimeNumber

  def initialize(up_to)
    @up_to = up_to
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
    generate_range.to_a.delete_if { |num| num.even? }
  end
end