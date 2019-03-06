# frozen_string_literal: true

class Search::DataByQuery < Trailblazer::Operation
  NEGATIVE_REGEX = /[\A\s]?-\S*/.freeze

  step    :set_query!
  step    :find_negative_query!
  step    :find_positive_query!
  step    :buid_search_data!
  step    :find_data_by_positive_query!
  step    :find_data_by_negative_query!
  success :data_formatting!

  def set_query!(options, params:, **)
    options[:query] = params[:params][:query]
  end

  def find_negative_query!(options, **)
    query = options[:query].downcase.scan(NEGATIVE_REGEX)
    options[:negative_query] = query.map(&:strip).map { |s| s[1..-1] }
  end

  def find_positive_query!(options, **)
    query = options[:query].downcase.remove(/\"|,/).remove(NEGATIVE_REGEX)
    options[:positive_query] = query.split(' ')
  end

  def buid_search_data!(options, **)
    options[:search_data] = JsonData::BildSearchData.call[:search_data]
  end

  def find_data_by_positive_query!(options, **)
    options[:search_data] = options[:search_data].select do |data_element|
      options[:positive_query].all? do |el|
        data_element[:searchable_data].include?(el)
      end
    end
  end

  def find_data_by_negative_query!(options, **)
    options[:search_data] = options[:search_data].reject do |data_element|
      options[:negative_query].any? do |el|
        data_element[:searchable_data].include?(el)
      end
    end
  end

  def data_formatting!(options, **)
    options[:response] = options[:search_data].map { |obj| obj[:name] }
  end
end
