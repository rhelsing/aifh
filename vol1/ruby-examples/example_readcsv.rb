# This example shows how to simply read a CSV file. This example reads the iris data set.
require 'csv'
# Open the specified file and read row by row.
CSV.foreach(File.path("datasets/iris.csv")) do |row|
  puts row if row.size > 0
end
