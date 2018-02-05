Feature: Budgeting_app
 Scenario: Validate the Product Is created Correctly
 Given We are going to BudgetingApp
 Then I validate the Budget Page is displayed
 When I create a new product with category "Groceries" with description "test" and with value 1234567890123.54
 Then I validate the product is displayed correctly
 When I create a new product with category "Income" with description "test" and with value 5500.54
 Then I validate the product is displayed correctly
 When I create a new product with category "Travel" with description "test" and with value 4645.76
 Then I validate the product is displayed correctly
 

Scenario: Validate the Working Balance is displayed correctly
 Given We are going to BudgetingApp
 Then I validate the Budget Page is displayed
 When I create a new product with category "Groceries" with description "test" and with value 8000.99
 Then I validate the product is displayed correctly
 When I create a new product with category "Income" with description "test" and with value 12000.54
 Then I validate the product is displayed correctly
 Then I validate the working balance is calculated correctly


Scenario: Validate the Inflow vs Outflow page displays the same amounts like the amounts displayed in the Budget Page
 Given We are going to BudgetingApp
 Then I validate the Budget Page is displayed
 When I create a new product with category "Groceries" with description "test" and with value 55.99
 Then I validate the product is displayed correctly
 When I create a new product with category "Income" with description "test" and with value 1200.54
 Then I validate the product is displayed correctly
 Then I validate the working balance is calculated correctly
 When I go to report Page
 Then I validate the Report Page is displayed
 Then I validate the Inflow Outflow are correcly
 Then I validate the calculation of expenses are equal to the outflow total


Scenario: Validate the Product Is created Correctly (failing)
 Given We are going to BudgetingApp
 Then I validate the Budget Page is displayed
 When I create a new product with category "Groceries" with description "test" and with value 123456789012345.54
 Then I validate the product is displayed correctly
 When I create a new product with category "Income" with description "test" and with value 5500.54
 Then I validate the product is displayed correctly
 When I create a new product with category "Travel" with description "test" and with value 4645.76
 Then I validate the product is displayed correctly