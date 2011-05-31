Then /^"([^"]*)" (should|should not) have "([^"]*)" selected$/ do |field, assertion, value|
  selected_value = find_field(field).value
  selected_value = selected_value.is_a?(Array) ? selected_value.first : selected_value
  selected_value.send(assertion.parameterize('_')) == value
end
