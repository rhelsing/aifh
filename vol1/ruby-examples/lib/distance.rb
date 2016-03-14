class Distance

  def self.euclidean(vector1, vector2)
    sum = 0
    vector1.zip(vector2).each do |v1, v2|
      component = (v1 - v2)**2
      sum += component
    end
    Math.sqrt(sum)
  end

  def self.cityblock(vector1, vector2)
    vector1.zip(vector2).reduce(0) do |acc, elem|
      acc += (elem[0] - elem[1]).abs
    end
  end

  def self.chebyshev(vector1, vector2)
    abs_differences = vector1.zip(vector2).map { |a| (a[0] - a[1]).abs }
    abs_differences.max
  end
end
