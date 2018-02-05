Given("We are going to BudgetingApp") do
@budget = Budget.new
@budget.load
end

Then(/^I validate the Budget Page is displayed$/) do
@budget.header.assertionValidateBudgetIsSelected()
end

When(/^I create a new product with category "(.*?)" with description "(.*?)" and with value (\d+\.?\d+)$/) do |category, description,value|
@budget.createProduct(category, description,value)
end

Then(/^I validate the product is displayed correctly$/) do
@budget.assertionValidateProductCreated()
end

Then(/^I validate the working balance is calculated correctly$/) do
@budget.assertionValidateWorkingBalanceWithTheGrid()
end

When(/^I go to report Page$/) do
@budget.header.selectReport()
@reports = ReportsIO.new
end