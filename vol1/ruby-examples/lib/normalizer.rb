class Normalizer
  attr_accessor :column_map, :headers, :result_set
  require 'csv'
  require_relative 'equilateral'

  def initialize(data_file)
    @column_map = []
    CSV.foreach(data_file, headers: true) do |row|
      @column_map << row.to_hash if row.size > 0
    end
    @headers = column_map.first.keys
    @result_set = []
  end

  def normailize_based_on_types(type_arr, normalized_low, normalized_high)
    type_arr.each_with_index do |column_type, i|
      header = @headers[i]
      case column_type
      when "numeric"
        #find max and min
        column_values = @column_map.map{|item| item[header].to_f}
        max, min = column_values.max, column_values.min
        #replace value with normalized value
        @column_map.each{|item| item[header] = ((item[header].to_f - min)/(max-min)*(normalized_high - normalized_low) + normalized_low)}
      when "class"
        #find classes
        classes = @column_map.map{|item| item[header]}.uniq
        # Normalize classes with equilateral encoding
        eq = Equilateral.new(classes, normalized_low, normalized_high)
        #TODO: build equilateral encoding class
      end
    end
    #fill in result set from column map
  end

  #TODO: additional functionality from normalize.py .. denormalize etc, generalize other types of normalization

end
