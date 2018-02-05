class ReportsSPB < SitePrism::Page

require 'test/unit/assertions'
include Test::Unit::Assertions

#WebObejcts
  attr_reader :header
  def initialize
    @header = Header.new
  end

  #Web Elements
  element :inflowOuflowSec, :xpath, ".//a[.='Inflow vs Outflow']"

  #array of Web Elements
  elements :categorysAmount, :xpath, ".//span[contains(@class,'styles-value')]"

  
  	#Actions
   def SelectInFlowOutflow()
     inflowOuflowSec.click
  end

    #The Order is ascending because the UI begin the creation from the Top to the Bottom example [40,30,20,10]
    #so I sorted ascending and the result should be the same which is correct and those result are validating correctly
  def AssertionValidateExpensesOrder()
    amountsExpenses = Helper.getArrayFloatAmount(self.categorysAmount.map {|name| name.text})
    assert_equal(amountsExpenses,amountsExpenses.sort { |a, b| b <=> a },"The order are not displayed correctly")
    Helper.showMessage("Report-AserstionValidateExpensesOrder()")
  end	
end