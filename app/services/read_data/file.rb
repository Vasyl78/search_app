# frozen_string_literal: true

module ReadData
  class File
    class << self
      def call
        file = search_file
        return parse_data unless file

        JSON.parse(file, symbolize_names: true)
      end

      private

      def search_file
        ::File.exist?(file_name) ? ::File.read(file_name) : nil
      end

      def fetch_data
        uri_link = 'https://gist.githubusercontent.com/g3d/8f524cb3252d9e026d3f33196c1b51dd/raw/ac40d1510efbe4674a69aff7e19b5d894826be38/data.json'
        uri = URI.parse uri_link
        Net::HTTP.get uri
      end

      def parse_data
        data = JSON.parse(fetch_data)
        parsed_data = data.map { |element| wrap_hash(element) }
        write_data_to_file(parsed_data)
        parsed_data
      end

      def write_data_to_file(parsed_data)
        ::File.open(file_name, 'w') do |f|
          f.write(parsed_data.to_json)
        end
      end

      def wrap_hash(element)
        {
          name: element['Name'],
          type: element['Type'],
          designed_by: element['Designed by']
        }
      end

      def file_name
        CURRENT_PATH + '/tmp/data.json'
      end
    end
  end
end
