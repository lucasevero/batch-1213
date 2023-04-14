# TESTING FRAMEWORK: RSPEC
# TDD FLOW: RED, GREEN, REFACTOR

require_relative "../acronymize"

# Rspec methods: #describe, #it, #expect
describe "#acronymize" do
  it "Should return WTF when What the Fuck passed" do
    expected = "WTF"
    actual = acronymize("What The Fuck")

    expect(actual).to eq(expected)
  end

  it "Should return FFC when 'fluminense football club' passed" do
    expected = "FFC"
    actual = acronymize("fluminense football club")

    expect(actual).to eq(expected)
  end

  it "Should return an empty string when an empty string is passed" do
    expected = ""
    actual = acronymize("")

    expect(actual).to eq(expected)
  end
end
