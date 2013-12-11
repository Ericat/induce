jclass Array

  def induce(head=self.first)
    result = head
    # This should only happen if the first argument is not given
    # If it is, we need to iterate over all elements
    tail = self[1..-1]
    tail.each do |element|
      #I update the result by passing it as
      #the new value in the block, as inject
      #requires:
      result = yield(result, element)
    end
    result
  end
end

  #Trial and error::

  # (1) The below is passing the first element of the array
  #at every iteration (2 total iterations):

  #2 + 3, 2 + 4

  #We need to update the result.
  # def induce(head=self.first)
  #   tail = self[1..-1]
  #   tail.each do |value|
  #     @result = yield(head, value) if block_given?
  #   end
  #   @result
  # end

  # (2) The below works, but the choice of name is poor.
  # It's best to store the results in a variable called
  # 'result' then update it as you go along.

  #Notice how below we don't need an instance variable
  #because is defined in the 'initial' that is passed to the variable.

    # def induce(initial=self.first)
    #   rest = self[1..-1]
    #   rest.each do |element|
    #     initial = yield(initial, element) if block_given?
    #   end
    #   initial
    # end

  # (3) The below does not work as I was still passing the initial
  #element of the array (now called 'head') at each iteration.

  #   def induce(head=self.first)
  #   result = head
  #   tail = self[1..-1]
  #   tail.each do |element|
  #     result = yield(head, element)
  #   end
  #   result
  # end
