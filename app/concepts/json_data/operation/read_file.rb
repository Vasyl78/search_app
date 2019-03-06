# frozen_string_literal: true

class JsonData::ReadFile < Trailblazer::Operation
  step :read!
  success :parse_json!

  def read!(options, **)
    options[:file_data] = File.read(::CURRENT_PATH + '/data.json')
  end

  def parse_json!(options, **)
    options[:file_data] = JSON.parse(options[:file_data], symbolize_names: true)
  end
end
