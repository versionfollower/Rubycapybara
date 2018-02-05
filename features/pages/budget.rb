class Budget < SitePrism::Page
  require 'test/unit/assertions'
  require 'logger'
  include Test::Unit::Assertions
  set_url "http://localhost:3000/budget"
  
  #WebObejcts
  attr_reader :header
  def initialize
    @header = Header.new
  end
  

  #Web Elements
  element :category, "select[name='categoryId']"
  element :description, "input[placeholder='Description']"
  element :value, "input[type='number']"
  element :add, "button[type='submit']"
  element :workingBalance, :xpath, ".//div[contains(text(),'Balance')]/preceding-sibling::*[1]"
  element :totalInflow, :xpath, ".//div[contains(text(),'Inflow')]/preceding-sibling::*[1]"
  element :totalOutFlow, :xpath, ".//div[contains(text(),'Outflow')]/preceding-sibling::*[1]"


  #array of Web Elements
  elements :categorys, :xpath, ".//div[contains(text(),'Category')][contains(@class,'cellLabel')]/following-sibling::*"
  elements :descriptions, :xpath, ".//div[contains(text(),'Description')][contains(@class,'cellLabel')]/following-sibling::*"
  elements :amounts, :xpath, ".//div[contains(text(),'Amount')][contains(@class,'cellLabel')]/following-sibling::*"

  # Actions 
   def createProduct(category,description,value)
    Helper.saveProduct(category,description,value)
    self.value.set value
    self.category.select category
    self.description.set description    
    add.click
    Helper.showMessage("createProduct()")
  end
  #Assertions
   def assertionValidateProductCreated()
    arrayCat = self.categorys.map {|name| name.text}
    assert(arrayCat.include?(Helper.getCategory()), "test is failing because Category is not in the application")
    arrayDes = self.descriptions.map {|name| name.text}
    assert(arrayDes.include?(Helper.getDescription()), "test is failing because Description is not in the application")
    arrayAmo = self.amounts.map {|name| name.text}
    assert(Helper.getStringAmountClean(arrayAmo).any? {|s| s.include?(Helper.getAmount())}, "test is failing because Amount is not in the application")
    Helper.showMessage("assertionvalidateProductCreated()")
   end
    #This validation get the values from the grid and the total inflow, outflow and balance and make validation
   def assertionValidateWorkingBalanceWithTheGrid()
    amountsProductGrid = Helper.getArrayFloatAmount(self.amounts.map {|name| name.text})
    workingbalance = Helper.getFloatAmount(self.workingBalance.text)
    totalInflow = Helper.getFloatAmount(self.totalInflow.text)
    totalOutflow = Helper.getFloatAmount(self.totalOutFlow.text)
    Helper.saveInOutFlow(totalInflow,totalOutflow)
    assert_equal(Helper.getSumAmount(amountsProductGrid),workingbalance, "test is failing because The Sum Amount is calculated wrong")
    assert_equal((totalInflow - totalOutflow).round(2),workingbalance, "test is failing because The Sum Amount is calculated wrong")
    Helper.showMessage("assertionValidateWorkingBalanceWithTheGrid()" + "-" + workingbalance.to_s)

   end
  
end