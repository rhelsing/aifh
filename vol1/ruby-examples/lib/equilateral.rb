class Equilateral
  attr_accessor :clases, :low, :high, :class_matrix

  def initialize(classes, low, high)
    @classes = classes
    @low = low
    @high = high
    #build based on classes.count
    m = Array.new(classes.count) { Array.new(classes.count-1) }
    m[0,0] = -1
    m[1,0] = 1.0
    puts m.inspect
    (2..classes.count-1).each do |k|
      r = k
      f = Math.sqrt(r*r- 1.0)/r
    #   (0..k-1).each do |i|
    #     (0..k-2).each do |j|
    #       puts m[i][j]
    #     end
    #   end
    # end
        #     r = k
        #     f = math.sqrt(r * r - 1.0) / r
        #     for i in range(0, k):
        #         for j in range(0, k - 1):
        #             self.encoded[i][j] *= f
        #
        #     r = -1.0 / r
        #     for i in range(0, k):
        #         self.encoded[i][k - 1] = r
        #
        #     for i in range(0, k - 1):
        #         self.encoded[k][i] = 0.0
        #
        #     self.encoded[k][k - 1] = 1.0
        #
        # # Scale it.
        # min_eq = -1
        # max_eq = 1
        # for row in range(0, len(self.encoded)):
        #     for col in range(0, len(self.encoded[row])):
        #         self.encoded[row][col] = ((self.encoded[row][col] - min_eq) / (max_eq - min_eq)) \
        #                                  * (normalized_high - normalized_low) + normalized_low
  end

  def encode(str)
  end

  def decode(float)
  end

end
