# This example shows how to generate normal and uniform random numbers.
require_relative 'lib/random_gaussian'

uniform_dist = Array.new(10000){ Random.rand }
nrng = RandomGaussian.new
normal_dist = Array.new(10000){ nrng.rand }

p uniform_dist.inspect
p normal_dist.inspect
