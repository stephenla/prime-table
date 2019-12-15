# A script to print a prime number multiplication table to STDOUT

# All prime numbers other than 2 & 3 are of the form 6n +/- 1.
# All composite numbers have prime factors.
# Time Complexity: O(n)
# Space Complexity: O(1)
class PrimeTable
  def initialize(number)
    @number_of_primes = number
  end

  ##
  # Returns true of given number is a prime number, otherwise returns false
  def print_table
    row_primes = self.class.get_first_n_prime_numbers(@number_of_primes)
    column_primes = row_primes

    if row_primes
      print "    -" # empty corner of top left multiplication table
      column_primes.each { |prime| print sprintf("%5d", prime) } # print top axis of primes
      puts
      (column_primes.length + 1).times { print "    #" }
      puts

      row_primes.each do |row_prime|
        print sprintf("%3d #", row_prime) # print the left axis of primes

        column_primes.each do |col_prime|
          print sprintf("%5d", row_prime * col_prime)
        end

        puts
      end
    else
      "Unexpected error"
    end
  end

  class << self
    ##
    # Returns true of given number is a prime number, otherwise returns false
    def prime?(number)
      return true if number == 2 || number == 3
      return false if number < 2 || number % 2 == 0

      return true if number < 9
      return false if (number % 3) == 0

      possible_divisors = Math.sqrt(number).to_i
      divisor = 5

      while divisor <= possible_divisors
        return false if number % divisor == 0
        return false if number % (divisor + 2) == 0

        divisor +=6
      end

      true
    end

    ##
    # Gets the first n prime numbers, given n
    def get_first_n_prime_numbers(n)
      max_loops = 999999999
      primes = []
      counter = 2

      while primes.length < n || counter == max_loops
        primes << counter if prime?(counter)
        counter += 1
      end

      primes.length === n ? primes : nil
    end
  end
end
