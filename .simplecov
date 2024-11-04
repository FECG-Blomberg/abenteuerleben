require 'simplecov'
SimpleCov.start 'rails' do
  enable_coverage :branch

end
SimpleCov.minimum_coverage 0
SimpleCov.minimum_coverage_by_file 0
puts "required simplecov"
