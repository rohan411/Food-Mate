require 'simplecov-json'
require 'simplecov'

SimpleCov.start 'rails' do
  add_group 'Coordinators', ['app/coordinators'] # You can also pass in an array
end

all_files = Dir['app/**/*.rb']
base_result = {}
all_files.each do |file|
  if !file.include?('enums')
    absolute = File::expand_path(file)
    lines = File.readlines(absolute, :encoding => 'UTF-8')
    base_result[absolute] = lines.map do |l|
      l.strip!
      l.empty? || l =~ /^end$/ || l[0] == '#' ? nil : 0
    end
  end
end
SimpleCov.at_exit do
  coverage_result = Coverage.result
  covered_files = coverage_result.keys
  covered_files.each do |covered_file|
    base_result.delete(covered_file)
  end
  merged = SimpleCov::Result.new(coverage_result).original_result.merge_resultset(base_result)
  result = SimpleCov::Result.new(merged)
  result.format!
end
if ENV['FORMAT'] == 'json'
  SimpleCov.formatter = SimpleCov::Formatter::JSONFormatter
else
  SimpleCov.formatter = SimpleCov::Formatter::MultiFormatter[SimpleCov::Formatter::HTMLFormatter, CodeClimate::TestReporter::Formatter]
end
