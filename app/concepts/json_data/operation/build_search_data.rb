# frozen_string_literal: true

class JsonData::BildSearchData < Trailblazer::Operation
  step :set_file_data
  step :build_serarch_data!

  def set_file_data(options, **)
    options[:file_data] = JsonData::ReadFile.call[:file_data]
  end

  def build_serarch_data!(options, **)
    options[:file_data] = options[:file_data].map do |element|
      make_element_searchable(element)
    end
  end

  def make_element_searchable(element)
    data_array = [element[:name], element[:type], element[:designed_by]]
    {
      name: element[:name],
      type: element[:type],
      designed_by: element[:designed_by],
      searchable_data: build_searchable_data(data_array).flatten
    }
  end

  def build_searchable_data(data_array)
    data_array.map do |element|
      element.downcase.split(',').map { |words| words.split(' ') }
    end
  end
end
