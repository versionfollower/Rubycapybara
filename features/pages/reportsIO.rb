class ReportsIO < SitePrism::Page

require 'test/unit/assertions'
include Test::Unit::Assertions

#WebObejcts
  attr_reader :header
  def initialize
    @header = Header.new
  end
  #Web Elements
  element :totalInflow, :xpath, ".//*[local-name() = 'text'][.='INFLOW']/following-sibling::*"
  element :totalOutFlow, :xpath, ".//*[local-name() = 'text'][.='OUTFLOW']/following-sibling::*"
  element :spendingByCategorysec, :xpath, ".//a[.='Spending by Category']"

  #array of Web Elements
  elements :categorysAmount, :xpath, ".//span[contains(@class,'styles-value')]"

  #Actions
  def SelectSpendingByCategory()
      spendingByCategorysec.click
  end



  #Validation
  #The Inflow and outflow are obtained from the Report UI and vaildated against the values saved from the Buget page
  def AssertionValidateTheOutflowAndInflowAreTheSameInReportsPage()
  assert_equal(Helper.getInflowAmount(),Helper.getFloatAmount(self.totalInflow.text), "test is failing because The Inflow Amount is calculated wrong")
  assert_equal(Helper.getOutflowAmount(),Helper.getFloatAmount(self.totalOutFlow.text), "test is failing because The Inflow Amount is calculated wrong")
   Helper.showMessage("Report-AssertionValidateTheOutflowAndInflowAreTheSameInReportsPage()")
  end

  #The sum of the expenses should be the same of the general outflow obtained from the Reports UI
  def AssertionValidateTheCalculationOfTheExpensesIsEqualToTheOutflow()
  assert_equal(Helper.getSumArrayFloatAmount(self.categorysAmount.map {|name| name.text}),Helper.getFloatAmount(self.totalOutFlow.text), "test is failing because The Sum Amount is calculated wrong") 
  Helper.showMessage("Report-AssertionValidateTheCalculationOfTheExpensesIsEqualToTheOutflow()")
  end
    #The Order is ascending because the UI begin the creation from the bottom to the top example [40,30,20,10]
    #so I sorted ascending and the result should be the same which is correct and those result are validating correctly
  def AserstionValidateExpensesOrder()
    amountsExpenses = Helper.getArrayFloatAmount(self.categorysAmount.map {|name| name.text})
    assert_equal(amountsExpenses,amountsExpenses.sort { |a, b| b <=> a },"The order are not displayed correctly")
    Helper.showMessage("Report-AserstionValidateExpensesOrder()")
  end
end