# TESTING FRAMEWORK: RSPEC
# TDD FLOW: RED, GREEN, REFACTOR

require_relative "../encrypt"

# Rspec methods: #describe, #it, #expect
describe "#encrypt" do
  it "Should return an empty string if an empty string is passed" do
    expected = ""
    actual = encrypt("")

    expect(actual).to eq(expected)
  end

  it "Should return 'QEB NRFZH YOLTK CLU GRJMP LSBO QEB IXWV ALD' if 'THE QUICK BROWN FOX JUMPS OVER THE LAZY DOG' is passed" do
    expected = "QEB NRFZH YOLTK CLU GRJMP LSBO QEB IXWV ALD"
    actual = encrypt("THE QUICK BROWN FOX JUMPS OVER THE LAZY DOG")

    expect(actual).to eq(expected)
  end

  it "Should return 'QEB NRFZH YOLTK CLU, GRJMP LSBO QEB IXWV ALD!' if 'THE QUICK BROWN FOX, JUMPS OVER THE LAZY DOG!' is passed" do
    expected = "QEB NRFZH YOLTK CLU, GRJMP LSBO QEB IXWV ALD!"
    actual = encrypt("THE QUICK BROWN FOX, JUMPS OVER THE LAZY DOG!")

    expect(actual).to eq(expected)
  end
end
