class Equilateral
  attr_accessor :classes, :low, :high, :class_matrix

  def initialize(classes, low, high)
    @classes = classes
    @low = low
    @high = high
    m = Array.new(@classes.count) { Array.new(@classes.count-1){0.0} }
    m[0][0] = -1.0
    m[1][0] = 1.0
    (2..@classes.count-1).each do |k|
      r = k
      f = Math.sqrt(r*r- 1.0)/r
      (0..k-1).each do |i|
        (0..k-2).each do |j|
          m[i][j] *= f
        end
      end
      r = -1.0/r
      (0..k-1).each do |i|
        m[i][k-1] = r
      end
      (0..k-2).each do |i|
        m[k][i] = 0.0
      end
      m[k][k-1] = 1.0
    end
    #Scale it.
    min_eq = -1
    max_eq = 1
    m.each do |row|
      row.each do |column|
        column = ((column - min_eq) / (max_eq - min_eq)) * (high - low) + low
      end
    end
    @class_matrix = m
  end

  def encode(str)
    @class_matrix[@classes.index(str)]
  end

  def decode(point)
    current_min = Float::INFINITY
    result = -1
    @class_matrix.each_with_index do |vector, i|
      dist = euclidean_distance(point, vector)
      if dist < current_min
        current_min = dist
        result = i
      end
    end
    return @classes[i]
  end

  def euclidean_distance(vector1, vector2)
    sum = 0
    vector1.zip(vector2).each do |v1, v2|
      component = (v1 - v2)**2
      sum += component
    end
    Math.sqrt(sum)
  end

end
