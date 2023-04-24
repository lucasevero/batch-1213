def credit_card_checker(card_number)
  if card_number.match?(/^(4|5)\s*(\d\s*){15}$/)
    if card_number.match?(/^4/)
      "Valid Visa Card"
    else
      "Valid Mastercard Card"
    end
  else
    "Invalid Card"
  end
end
