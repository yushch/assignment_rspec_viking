# Your code here
require 'weapons/bow'

describe Bow do
   
   let(:b1){ Bow.new }
   
   describe "#initialize" do
      
      it "initialize default" do
         expect(b1.arrows).to eq(10) 
      end
      
      it "initialize with numbers" do
          b2 = Bow.new(12)
          expect(b2.arrows).to eq(12)
      end
       
   end
   
   
   describe "#out of arrows" do
      
      it "return ture when remain zero arrows" do
          b1.send(:initialize ,0)
          expect(b1.out_of_arrows?).to eq(true)
      end
       
   end
   
    
   describe "use bows" do
      
      it "raise errors when empty" do
          allow(b1).to receive(:out_of_arrows?).and_return(true)
          expect{b1.use}.to raise_error(RuntimeError)
      end
      
      it "reduce arrows" do
          b1.send(:initialize ,15)
          b1.use
          expect(b1.arrows).to eq(14)
      end
       
   end
       
    
end