# Your code here
require 'viking'

describe "viking class" do
   let(:viki){Viking.new("username")}
   let(:victim){Viking.new("victim")}
   let(:dying){Viking.new(name = "dyingman", health = 1)}
   
   it "check default setting" do
      #.send(:initialize, "username")
      expect(viki.name).to eq("username")#name setting check
      expect(viki.health).to eq(100)#default health check
      #health can not be overwritten
      expect(viki.weapon).to eq(nil)#default weapon check
       
   end
   
   it "can not be overwritten" do
        
        expect{viki.health = 150}.to raise_error(NoMethodError) 
       
   end
    
    it "check weapon pick" do
        
        #viki.send(:initialize, "username")
        viki.pick_up_weapon(Axe.new)
        expect(viki.weapon.name).to eq("Axe")
        #a weapon pick
        expect{viki.pick_up_weapon("not a weapon")}.to raise_error("Can't pick up that thing")
        #non weapon pick cause error
        viki.pick_up_weapon(Bow.new(2))
        #repick a new weapon
        expect(viki.weapon.name).to eq("Bow")
        viki.drop_weapon
        #drop weapon test
        expect(viki.weapon).to eq(nil)
        
    end
    
    it "damage check" do
        
       viki.receive_attack(5)#damage check
       expect(viki.health).to eq(95)
    end
    
    it "receive method calls take_damage" do
       expect(viki).to receive(:take_damage).and_return(true)
       viki.receive_attack(5) 
    end
    
    it "attack cause receive_attack" do
       expect(victim).to receive(:receive_attack).and_return(true)
       viki.attack(victim) 
    end
    
    it "attack cause take_damage" do
       expect(victim).to receive(:take_damage).and_return(true)
       viki.attack(victim) 
    end
    
    it "attack cause victim damage" do
        life_before = victim.health
        viki.attack(victim)
        life_after = victim.health
        expect(life_before-life_after >=0 ).to eq(true)
    end
    
    it "attack without weapon" do
       expect(viki).to receive(:damage_with_fists).and_return(2.5)
       viki.attack(victim)
    end
    
    it "attack with a weapon" do
        viki.pick_up_weapon(Axe.new)
        expect(viki).to receive(:damage_with_weapon).and_return(10)
        viki.attack(victim)
    end
    
    it "attack equivalent verify" do
        viki.pick_up_weapon(Axe.new)
        expect(viki.send(:damage_dealt)).to eq(10)
    end
    
    it "attack with no bows" do
       viki.pick_up_weapon(Bow.new(0))
       expect(viki).to receive(:damage_with_fists).and_return(2.5)
       viki.attack(victim)
    end
    
    it "die cause error test" do
        expect{viki.attack(dying)}.to raise_error
    end
    
end