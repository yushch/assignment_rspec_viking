require 'warmup'

describe Warmup do
   
   let(:warm){ Warmup.new }
   
   describe "#gets_shout" do
   
       it "check gets shout" do
           
            allow(warm).to receive(:gets).and_return("WhatistHIS?")
            expect(warm.gets_shout).to eq("WHATISTHIS?")
          
       end
   end
   
   let(:fake_array) do
            double("Array", size:3)
         end
   
   describe "#triple_size" do
      it "double pass check" do
         
         expect(warm.triple_size(fake_array)).to eq(9)
          
      end
       
   end
   

   
   describe "#calls_some_methods" do
      let(:str) do
         "I'm related"
      end
      #str = "string"
       
      it "string pass check uppercase" do

         expect(str).to receive(:upcase!).and_return("I'M RELATED")
         warm.calls_some_methods(str)
         
      end
      
      it "string pass check reverse" do
          
          expect(str).to receive(:reverse!).and_return("ABCDE")
          warm.calls_some_methods(str)

      end
      
      it "unrelated ouput" do
          expect(warm.calls_some_methods(str)).to eq("I am unrelated")
      end
       
   end
    
end