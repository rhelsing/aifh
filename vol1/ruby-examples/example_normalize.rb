# This example shows how to normalize the iris data set.  Equilateral encoding is used for the species, and range is used for the measurements.
require_relative 'lib/normalize'

normalizer = Normalize.new(File.open("datasets/iris.csv"))

# Setup the first four fields to "range normalize" between -1 and 1, last field to equilateral class encoding.
normalizer.normailize_based_on_types(["numeric","numeric","numeric","numeric","class"], -1.0, 1.0)

#display result:
normalizer.result_set.each{|row| p row}
