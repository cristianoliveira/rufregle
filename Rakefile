require 'rake/testtask'

UNIT_TEST_PATTERN = 'test/unit/**/*_test.rb'
INTEGRATION_TEST_PATTERN = 'test/integration/**/*_test.rb'

Rake::TestTask.new(:test) do |t|
  t.test_files = FileList[UNIT_TEST_PATTERN, INTEGRATION_TEST_PATTERN]
end

Rake::TestTask.new(:unit_test) do |t|
  t.test_files = FileList[UNIT_TEST_PATTERN]
end

Rake::TestTask.new(:integration_test) do |t|
  t.test_files = FileList[INTEGRATION_TEST_PATTERN]
end

desc "Run tests"
task :default => :test
