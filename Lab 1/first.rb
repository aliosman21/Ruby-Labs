
class CMP
    @@stats = Hash["add" => 0, "multiply" => 0];
   def initialize(r,img)
      @real, @imaginary = r, img
   end

#    attr_accessor :real,:imaginary
   def getReal
      @real
   end
   def getImg
      @imaginary
   end

   

    def self.get_stats
        puts "This complex number was added #{@@stats["add"]} Times and Multiplied #{@@stats["multiply"]}"
    end



   def setReal=(value)
      @real = value
   end
   def setImg=(value)
      @imaginary = value
   end

    def printNum
      if @imaginary > 0
            puts "The number is #{@real}+#{@imaginary}i"
      else
        puts "The number is #{@real}#{@imaginary}i"
      end
    end


   def +(cmp)
      temp = self
      temp.setReal = @real + cmp.getReal() 
      temp.setImg = @imaginary + cmp.getImg() 
      @@stats["add"] += 1
      temp.printNum()
      return temp
   end

   def *(cmp)
      temp = self
      temp.setReal =  @real * cmp.getReal() - @imaginary * cmp.getImg() 
      temp.setImg = @real * cmp.getImg() + @imaginary * cmp.getReal()
      @@stats["multiply"] += 1
      temp.printNum()
      return temp
   end


   def multiplyBulk someCmps
    temp = self
    (someCmps).each do |i|
        temp*i
    end
    return temp
   end

   def addBulk someCmps
    temp = self
    (someCmps).each do |i|
       temp+i
    end
    return temp
   end

end



c1 = CMP.new(3,2)
c2 = CMP.new(1,7)
c3 = CMP.new(4,5)
nums = Array.new()
nums << c2
nums << c3




c6 = c1.addBulk(nums);
# c7 = c1.multiplyBulk = nums;

c4 = CMP.new(1,1)
c5 = CMP.new(1,1)

c5 = c4+c5
# c4.printNum()
# c5.printNum()
print "HERE\n"
c6.printNum()
CMP.get_stats()









