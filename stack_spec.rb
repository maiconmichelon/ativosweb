describe Stack do
  
  describe "#push" do
    it "puts an element at the top of the stack" do
      stack = Stack.new

      stack.push 1
      stack.push 2

      expect(stack.top).to_eq(2)

    end
  end

end