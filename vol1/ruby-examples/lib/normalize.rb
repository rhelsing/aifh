class Normalize
  attr_accessor :column_map, :headers, :result_set, :eq, :original_data
  require 'csv'
  require_relative 'equilateral'

  def initialize(data_file)
    @column_map = []
    CSV.foreach(data_file, headers: true) do |row|
      @column_map << row.to_hash if row.size > 0
      @original_data = @column_map.map{|x| x.values}
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
        @eq = Equilateral.new(classes, normalized_low, normalized_high)
        @column_map.each{|item| item[header] = @eq.encode(item[header]) }
      end
    end
    #fill in result set from column map
    populate_result
  end

  def populate_result
    @result_set = []
    @column_map.each do |i|
      row = []
      i.values.each do |j|
        if j.kind_of?(Array)
          j.each do |k|
            row << k
          end
        else
          row << j
        end
      end
      @result_set << row
    end
  end

  #TODO: additional functionality from normalize.py .. denormalize etc, generalize other types of normalization

end
