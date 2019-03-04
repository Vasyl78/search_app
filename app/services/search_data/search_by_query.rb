# frozen_string_literal: true

module SearchData
  class SearchByQuery
    class << self
      def call(query:, search_data:)
        query_array = prepare_query_data(query)
        find_data_by_query(query_array, search_data)
      end

      private

      def prepare_query_data(query)
        changed_query = query.remove(/\"|,/).downcase
        changed_query.split(' ')
      end

      def find_data_by_query(query_array, search_data)
        finded_elements = search_data.select do |data_element|
          query_array.all? { |el| data_element[:searchable_data].include?(el) }
        end
        finded_elements.map { |obj| obj[:name] }
      end
    end
  end
end
