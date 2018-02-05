require 'log4r'
include Log4r

class Helper 
  $product_Category = ""
  $product_Description = ""
  $product_Amount = ""
  $Inflow = 0
  $Outflow = 0
  
  # Static Methods
  def self.saveProduct(category,description,amount)
    $product_Category = category
    $product_Description = description
    $product_Amount = amount
  end

  def self.saveInOutFlow(inflow,outflow)
    $Inflow = inflow
    $Outflow = outflow
  end

  def self.getCategory()
    return $product_Category
  end
  def self.getDescription()
    return $product_Description
  end
  def self.getAmount()
    return $product_Amount
  end
  def self.getInflowAmount()
    return $Inflow
  end
  def self.getOutflowAmount()
    return $Outflow
  end  

  def self.showMessage(message)
    logger = Logger.new($stdout)
    logger.level = Logger::DEBUG
    logger.datetime_format = "%Y-%m-%d %H:%M:%S"
    logger.info(message)

  end

  def self.getArrayFloatAmount(amountArray)
    amountArray.each do |s|
       s.gsub!('$', '')
    end
    amountArray.each do |s|
       s.gsub!(',', '')
    end
    b = amountArray.map(&:to_f)
    return b
  end

  def self.getStringAmountClean(amountArrayText)
    amountArrayText.each do |s|
       s.gsub!(',', '')
    end
    return amountArrayText
  end

  def self.getFloatAmount(amount)
    amount.gsub!('$', '')
    amount.gsub!(',', '')
    return amount.to_f
  end

  def self.getSumAmount(amountArray)
    sum = 0
    amountArray.each { |a| sum+=a }
    return sum.round(2)
  end

  def self.getSumArrayFloatAmount(amountArray)
    amountArray.each do |s|
       s.gsub!('$', '')
    end
    amountArray.each do |s|
       s.gsub!(',', '')
    end
    b = amountArray.map(&:to_f)
    sum = 0
    b.each { |a| sum+=a }
    return sum.round(2)
  end
end

