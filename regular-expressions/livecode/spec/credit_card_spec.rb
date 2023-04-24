# TDD -> Red, Green, Refactor

require_relative "../credit_card"

describe "#credit_card_checker" do
  it "Should return 'Invalid Card' if an empty string is passed" do
    actual = credit_card_checker("")
    expected = "Invalid Card"

    expect(actual).to eq(expected)
  end

  it "Should return 'Valid Visa Card' if a 16 digits string with no spaces is passed, starting with a 4" do
    actual = credit_card_checker("4242424242424242")
    expected = "Valid Visa Card"

    expect(actual).to eq(expected)
  end

  it "Should return 'Valid Visa Card' if a 16 digits string with spaces is passed, starting with a 4" do
    actual = credit_card_checker("4242 4242 4242 4242")
    expected = "Valid Visa Card"

    expect(actual).to eq(expected)
  end

  it "Should return 'Valid Mastercard Card' if a 16 digits string with no spaces is passed, starting with a 5" do
    actual = credit_card_checker("5242424242424242")
    expected = "Valid Mastercard Card"

    expect(actual).to eq(expected)
  end

  it "Should return 'Valid Mastercard Card' if a 16 digits string with spaces is passed, starting with a 5" do
    actual = credit_card_checker("5242 4242 4242 4242")
    expected = "Valid Mastercard Card"

    expect(actual).to eq(expected)
  end

  it "Should return 'Valid Visa Card' if a 16 digits string with spaces is passed, starting with a 4" do
    actual = credit_card_checker("4 242 424 24242 4242")
    expected = "Valid Visa Card"

    expect(actual).to eq(expected)
  end

  it "Should return 'Invalid Card' if a 20 digits string with spaces is passed" do
    actual = credit_card_checker("4 242 424 24242 42424242")
    expected = "Invalid Card"

    expect(actual).to eq(expected)
  end
end
