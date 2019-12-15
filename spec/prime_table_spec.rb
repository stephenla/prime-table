require "prime_table"

describe PrimeTable do
  describe "#print_table" do
    it "prints a multiplication table to standard output" do
      prime_table = PrimeTable.new(10)
      expect { prime_table.print_table }.to output("    -    2    3    5    7   11   13   17   19   23   29\n    #    #    #    #    #    #    #    #    #    #    #\n  2 #    4    6   10   14   22   26   34   38   46   58\n  3 #    6    9   15   21   33   39   51   57   69   87\n  5 #   10   15   25   35   55   65   85   95  115  145\n  7 #   14   21   35   49   77   91  119  133  161  203\n 11 #   22   33   55   77  121  143  187  209  253  319\n 13 #   26   39   65   91  143  169  221  247  299  377\n 17 #   34   51   85  119  187  221  289  323  391  493\n 19 #   38   57   95  133  209  247  323  361  437  551\n 23 #   46   69  115  161  253  299  391  437  529  667\n 29 #   58   87  145  203  319  377  493  551  667  841\n").to_stdout
    end
  end

  describe ".prime?" do
    it "checks if a given number is a prime number" do
      expect(described_class.prime?(1)).to be(false)
      expect(described_class.prime?(2)).to be(true)
      expect(described_class.prime?(3)).to be(true)
      expect(described_class.prime?(4)).to be(false)
      expect(described_class.prime?(5)).to be(true)
      expect(described_class.prime?(22)).to be(false)
      expect(described_class.prime?(23)).to be(true)
      expect(described_class.prime?(29)).to be(true)
    end
  end

  describe ".get_first_n_prime_numbers" do
    it "takes argument n and returns the first n prime numbers" do
      expect(described_class.get_first_n_prime_numbers(1)).to eq([2])
      expect(described_class.get_first_n_prime_numbers(10)).to eq([2, 3, 5, 7, 11, 13, 17, 19, 23, 29])
    end
  end
end
