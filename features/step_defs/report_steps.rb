Then(/^I validate the Report Page is displayed$/) do
@reports.header.assertionValidateReportIsSelected()
end

Then(/^I validate the Inflow Outflow are correcly$/) do
@reports.AssertionValidateTheOutflowAndInflowAreTheSameInReportsPage()
end

Then(/^I validate the calculation of expenses are equal to the outflow total$/) do
@reports.AssertionValidateTheCalculationOfTheExpensesIsEqualToTheOutflow()
end

Then(/^I validate the expenses order of the outflow$/) do
@reports.AserstionValidateExpensesOrder()
end