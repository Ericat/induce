class Array

  def induce(start=nil)
    if start.nil?
      head = self.first
      result = head
      tail = self[1..-1]
      tail.each do |element|
        result = yield(result, element)
      end
    else
      result = start
      self.each do |element|
        result = yield(result, element)
      end
    end
    result
  end
end