require_relative 'prime_number'

class Display

  def welcome
    puts "Challenge : Prime multiplication"
  end

  def max_cell_size(rows, cols)
    max_value = rows.max * cols.max
    return max_value.to_s.length    
  end

  def r1c1(number)
    "#{number.times.collect { " " }.join('')}"
  end

  def dashes(number)
    "#{(number + 2).times.collect { "-" }.join('')}"
  end

  def cell_right_justified(number, max_chars)
    number.to_s.rjust(max_chars)
  end

  def underline(row, string)
    row.size.times.collect { string }.join('+')
  end

  def print_header(rows, cols)
    # generate and print the 1st row (header) + table horizontal seperator
    # contains blank at rxry then rows[0..max] seperated by '|'
    max_chars = max_cell_size(rows, cols)
    print r1c1(max_chars) + "| "
    rows.each { |x| print x.to_s.rjust(max_chars) + " | " }
    print "\n#{r1c1(max_chars).gsub(" ", "-")}+#{underline(rows, dashes(max_chars))}+\n"
  end

  def print_data_row(rows, cols)
    # print row for each corresponding column
    # 1st element is 'cols' value
    # subsequent cells are the value of x(row) * y(col)    
    max_chars = max_cell_size(rows, cols)
    rows.each do |x|
      print "#{cell_right_justified(x, max_chars)}| "
      cols.each do |y|
        print "#{cell_right_justified(x * y, max_chars)} | "
      end
      print "\n"
    end
    print "\n"
  end

  def print_grid
    rows = cols = PrimeNumber.new(10).main
    print_header(rows, cols)
    print_data_row(rows, cols)
  end
end

main = Display.new
main.welcome
main.print_grid
