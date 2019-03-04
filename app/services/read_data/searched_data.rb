# frozen_string_literal: true

module ReadData
  class SearchedData
    class << self
      def call
        file_data = ReadData::File.call
        return [] unless file_data

        build_searched_data(file_data)
      end

      private

      def build_searched_data(file_data)
        file_data.map do |element|
          make_element_searchable(element)
        end
      end

      def make_element_searchable(element)
        data_array = [element[:name], element[:type], element[:designed_by]]
        {
          name: element[:name],
          searchable_data: build_searchable_data(data_array).flatten
        }
      end

      def build_searchable_data(data_array)
        data_array.map do |element|
          element.downcase.split(',').map { |words| words.split(' ') }
        end
      end
    end
  end
end
