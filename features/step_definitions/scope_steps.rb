module SectionLocator

  def within_parent(content, elements = ['*'], &block)
    expr = "//*[(#{elements.join('|')})/descendant-or-self::*[contains(., '#{content}')]]"
    within(:xpath, expr, &block)
  end

end

World(SectionLocator)

When /^(.*) in the "([^\"]*)" row$/ do |action, title|
  within_parent(title, %w(th td)) do
    When action
  end
end

sections = %w(hgroup h1 h2 h3 h4 h5 h6 legend caption dt strong)

When /^(.*) in the "([^\"]*)" section$/ do |action, title|
  within_parent(title, sections) do
    When action
  end
end

Then /^I should see "([^"]*)" "(\d+)" times?$/ do |text, count|
  page.should have_css("div", :text => text, :count => count.to_i)
end

Then /I should see "([^\"]*)" in the "([^\"]*)" description/ do |text, title|
  page.should have_xpath("//dt[contains(.,'#{title}')]/following-sibling::dd[1][.='#{text}']")
end

Then /I should see "([^\"]*)" in the preceding "([^\"]*)" description/ do |text, title|
  page.should have_xpath("//dt[contains(.,'#{title}')]/preceding-sibling::dd[1][.='#{text}']")
end

When /^(.*) in the modal$/ do |action|
  within(:css, "#modal") do
    When "#{action}"
  end
end

Then /^I should see an? "([^\"]*)" section$/ do |title|
  page.should have_xpath("//*[(#{sections.join('|')})[contains(., '#{title}')]]")
end

Then /^I should not see an? "([^\"]*)" section$/ do |title|
  page.should have_no_xpath("//*[(#{sections.join('|')})[contains(., '#{title}')]]")
end
