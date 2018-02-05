# Rubycapybara: framework with capybara, Cucumber, SitePrism, TestUnit, POM, log4r, Selenium

## Setup
Capybara requires Ruby 2.2.0 or later. To install run this command: 

gem install capybara

gem install cucumber

gem install selenium-webdriver

gem install test-unit

gem install log4r

Then go to the path of the project downloaded and run "bundle install":

## Test application (https://budgeting-a937b.firebaseapp.com/budget) 

##Test

#### 1. Validate the Product Is created Correctly (Automated)

	#Steps
	1.Go to BadgetPage
	2.Insert the values of the Expenses product 
	3.Validate the Product is created
	4.Insert the values of the Income product 
	5.Validate the Product is created
	
#### 2. Validate the Working Balance is displayed correctly (Automated)

	1.Go to BadgetPage
	2.Insert the values of the Expenses product 
	3.Validate the Product is created
	4.Insert the values of the Income product 
	5.Validate the Product is created
	6.Validate the Values of the grid is the same as the working balance
	7.Validate the total Inflow and Outflow is the sames as Working balance

#### 3. Validate button "ADD" is enable which some conditions
	1.Go to BadgetPage
	2.Insert any different float number with this format (xxx.xx) in Textbox "value"
	3.Select any category 
	4.Validate the Button "ADD" is enable
	5.Do not insert any value insite the textbox "value"
	6.Validate the button "ADD" is disabled
	
#### 4. Validate the content is adaptable with big or small resolution
	1.Go to BadgetPage
	2.Insert a big float number(more than 20 digits) with this format (xxx.xx) in Textbox "value", select category "income"
	3.Validate the Inflow is displayed with this number in which this content all this number.
	4.Insert 10000 characters inside the textbox "description"
	5.Validate this content is inserted correctly inside the grid
	6. validate the resolution size of the Badget page.
	
#### 5. Validate the the Income Category always have a positive amount
	1.Go to BadgetPage
	2.Insert the values of the Income product with positive value
	3.Validate the Product is created with positive value
	4.Insert the values of the Income product  with negative value
	5.Validate the Product is created with positive value(negative case)
	6.Insert the values of the Outcome product with positive value
	7.Validate the Product is created with negative value(negative case)
	8.Insert the values of the Income product  with negative value
	9.Validate the Product is created with negative value"

#### 6. Validate the Inflow vs Outflow page displays the same amounts like the amounts displayed in the Budget Page (Automated)

	1.Go to BadgetPage
	2.Insert the values of the Expenses product.
	3.Validate the Product is created.
	4.Insert the values of the Income product .
	5.Validate the Product is created.
	6.Go to Reports Inflow vs Outflow Page.
	7.Validate the total Inflow is the same as the total inflow displayed in Budget Page.
	8.Validate the total Outflow is the same as the total Outflow displayed in Budget Page.
	9.Validate the total Outflow is the same as the sum of the values fo the Outcomes displayed in The page.

#### 7. Validate the outcome more expensive is displayed at the top in the page Spending by category
	1.Go to BadgetPage
	2.Insert the values of the Expenses product.
	3. calculate the expensive outcome in the Pudget page
	4.Go to Reports Spending by category
	5.Validate the expensive outcome calculated in the Budget page is at the top of all the outcomes.

#### 8. Validate The graphics are proportional with the different values at the Repors pages.
	1.Go to BadgetPage
	2.Insert the values of the Expenses product.
	3.Go to Reports  Inflow vs Outflow
	4.Validate the income and outcome value from Budget Page have proportional graphics in Reports Inflow vs Outflow
	5.Go to Reports Spending by category
	6.Validate the outcome values from reports Spending by Category are proportional in the graphics displayed
	
## Execution
1. Clone this repository ( https://github.com/ModusCreateOrg/budgeting-sample-app-webpack2 ) and execute "npm start"

2. Clone the repository of the Automation Project (https://github.com/versionfollower/Rubycapybara)  

3. Go to the local path of the project cloned and run this command "bundle exec cucumber" or "cucumber -f html -o results.htm"

4. Both command execute the cucumber tests, but the second command generate a report

## Results

test # 1 (Passed)
test # 2 (Passed)
test # 6 (Passed)

test # 1 (Failed)
The application do not work correctly when the numer of the digits are more then 14 so this test try to validate that all the data inserted is displayed

but, after this ampunt of digits the application change all the decimlas to .00

example 
values inserted : 123456789012345.54
value displayed in the application  123456789012345.00

so there is a bug in the application

