class Header < SitePrism::Page
  require 'test/unit/assertions'
  include Test::Unit::Assertions

  element :budget, "a[href='/budget']"
  element :reports, "a[href='/reports']"
  element :star, :xpath, ".//span[contains(text(),'Star')]/.."
  element :forks, :xpath, ".//span[contains(text(),'Fork')]/.."

  element :budgetIsSelected, :xpath, ".//a[contains(@class,'style-selected')][.='Budget']"
  element :reportsIsSelected, :xpath, ".//a[contains(@class,'style-selected')][.='Reports']"
 
    # Actions 
    def selectBudget()
    budget.click
    end

    def selectReport()
    reports.click
    end

    def selectStar()
    star.click
    end

    def selectFork()
    forks.click
    end
   
    ##Assertions
     def assertionValidateBudgetIsSelected()
    assert_equal(self.budgetIsSelected.text,"Budget", "test is failing because The Sum Amount is calculated wrong")
    Helper.showMessage("Header-assertionValidateBudgetIsSelected()")
     end

    def assertionValidateReportIsSelected()
    assert_equal(self.reportsIsSelected.text,"Reports", "test is failing because The Sum Amount is calculated wrong")
    Helper.showMessage("Header-assertionValidateReportIsSelected()")
    end
end
