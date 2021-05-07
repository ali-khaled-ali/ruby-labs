class ComplexCalc
    @@addoperation = 0
    @@multiplyoperation = 0
    attr_accessor :realNumber, :imgNumber

    def initialize(realNumber, imgNumber)
      @realNumber = realNumber
      @imgNumber = imgNumber
    end

    def + (comblex2)
      @@addoperation += 1
      realNumber = @realNumber + comblex2.realNumber
      imgNumber  = @imgNumber  + comblex2.imgNumber
      ComplexCalc.new(realNumber, imgNumber)
    end

    def *(other)
      @@multiplyoperation += 1
      realNumber = @realNumber * other.realNumber - @imgNumber * other.imgNumber
      imgNumber  = @realNumber * other.imgNumber + @imgNumber * other.realNumber
      ComplexCalc.new(realNumber, imgNumber)
    end

    def self.bulk_add(listOfComblexs)
      result = listOfComblexs.first
      listOfComblexs.drop(1).each do |listOfComblexs|
        result += listOfComblexs
      end
      result
    end

    def self.bulk_multiply(listOfComblexs)
      result = listOfComblexs.first
      listOfComblexs.drop(1).each do |listOfComblexs|
        result *= listOfComblexs
      end
      result
    end

    
    def to_s
      "(#{self.realNumber} + #{self.imgNumber}i)"
    end

    def self.get_state()
      puts "No. Add Operation: #{@@addoperation}"
      puts "No. Multiply Operation: #{@@multiplyoperation}"
    end
  
  end
  
  complexnumber1 = ComplexCalc.new(1, 2)
  complexnumber2 = ComplexCalc.new(3, 4)
  complexnumber3 = ComplexCalc.new(5, 6)
  complexnumber4 = ComplexCalc.new(7, 8)
  
  puts complexnumber1 + complexnumber2
  puts complexnumber1 * complexnumber2
  
  arr = [complexnumber1, complexnumber2, complexnumber3,complexnumber3]
  
  puts ComplexCalc.bulk_add(arr)
  puts ComplexCalc.bulk_multiply(arr)
  
  ComplexCalc.get_state()