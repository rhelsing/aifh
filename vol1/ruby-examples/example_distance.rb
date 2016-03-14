# This example shows how three different distance metrics calculate the same three points.
# Euclidean Distance
# pos1->pos2: 5.196152422706632
# pos2->pos3: 5.196152422706632
# pos3->pos1: 10.392304845413264
#
# Manhattan (city block) Distance
# pos1->pos2: 9.0
# pos2->pos3: 9.0
# pos3->pos1: 18.0
#
# Chebyshev Distance
# pos1->pos2: 3.0
# pos2->pos3: 3.0
# pos3->pos1: 6.0

require_relative 'lib/distance'

# Create three different positions.
pos1 = [1.0, 2.0, 3.0]
pos2 = [4.0, 5.0, 6.0]
pos3 = [7.0, 8.0, 9.0]

# Calculate the distance between the specified points in 3 metrics.
puts "Euclidean Distance\n"
puts "pos1->pos2: #{Distance.euclidean(pos1, pos2)}"
puts "pos2->pos3: #{Distance.euclidean(pos2, pos3)}"
puts "pos3->pos1: #{Distance.euclidean(pos3, pos1)}"
puts "\nManhattan (city block) Distance\n"
puts "pos1->pos2: #{Distance.cityblock(pos1, pos2)}"
puts "pos2->pos3: #{Distance.cityblock(pos2, pos3)}"
puts "pos3->pos1: #{Distance.cityblock(pos3, pos1)}"
puts "\nChebyshev Distance\n"
puts "pos1->pos2: #{Distance.chebyshev(pos1, pos2)}"
puts "pos2->pos3: #{Distance.chebyshev(pos2, pos3)}"
puts "pos3->pos1: #{Distance.chebyshev(pos3, pos1)}"
