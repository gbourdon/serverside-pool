class Array
    def to_i
        output = []
        self.each {|item| output.push item.to_i} 
        output
    end
end

test = "[1,2,3]"
arr = test.split ""
arr.delete("[")
arr.delete("]")
arr.delete(",")

p arr.to_i