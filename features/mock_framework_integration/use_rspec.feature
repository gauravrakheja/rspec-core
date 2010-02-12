Feature: mock with rspec

  As an RSpec user who likes to mock
  I want to be able to use rspec

  Scenario: Mock with rspec
    Given a file named "rspec_example_spec.rb" with:
      """
      Rspec.configure do |config|
        config.mock_framework = :rspec
      end

      describe "plugging in rspec" do
        it "allows rspec to be used" do
          target = mock('target')
          target.should_receive(:foo)
          target.foo
        end
      end
      """
    When I run "rspec rspec_example_spec.rb"
    Then the stdout should match "1 example, 0 failures" 
    And the exit code should be 0
