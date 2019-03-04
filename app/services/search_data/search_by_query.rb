# frozen_string_literal: true

module SearchData
  class SearchByQuery
    NEGATIVE_REGEX = /[\A\s]?-\S*/.freeze
    def initialize(query:, search_data:)
      @query       = query
      @search_data = search_data
    end

    def call
      find_queries
      find_data_by_query
    end

    private

    attr_reader :search_data, :query
    attr_accessor :negative_query, :positive_query

    def find_queries
      @negative_query = find_negative_query
      @positive_query = find_positive_query
    end

    def find_positive_query
      query.downcase.remove(/\"|,/).remove(NEGATIVE_REGEX).split(' ')
    end

    def find_negative_query
      query.downcase.scan(NEGATIVE_REGEX).map(&:strip).map { |s| s[1..-1] }
    end

    def prepare_query_data
      changed_query = query.remove(/\"|,/).downcase
      changed_query.split(' ')
    end

    def find_data_by_query
      finded_elements = find_data_by_positive_query
      exclude_negative = find_data_by_negative_query(finded_elements)
      exclude_negative.map { |obj| obj[:name] }
    end

    def find_data_by_positive_query
      search_data.select do |data_element|
        positive_query.all? { |el| data_element[:searchable_data].include?(el) }
      end
    end

    def find_data_by_negative_query(finded_elements)
      finded_elements.reject do |data_element|
        negative_query.any? { |el| data_element[:searchable_data].include?(el) }
      end
    end
  end
end
