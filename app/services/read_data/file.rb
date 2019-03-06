# frozen_string_literal: true

module ReadData
  class File
    class << self
      def call
        data = read_file
        JSON.parse(data, symbolize_names: true)
      end

      private

      def read_file
        ::File.exist?(file_name) ? ::File.read(file_name) : []
      end

      def file_name
        CURRENT_PATH + '/data.json'
      end
    end
  end
end
