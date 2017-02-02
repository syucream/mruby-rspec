mspec_runner_executed = false

describe RSpec::Runner do
  it "executes examples like this one" do
    mspec_runner_executed = true
  end
end

# Normal MRuby test assertion to ensure specs were executed
assert('RSpec::Runner executes examples') do
  # mspec_runner_executed was set true on the example above
  assert_true(mspec_runner_executed, "RSpec isn't running")
end

