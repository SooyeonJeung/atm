require '../validators.rb'

describe 'index.rb - validate_input' do
    it 'checks if input is valid' do
        expect(Validators.validate_input("1")).to eq(true)
        expect(Validators.validate_input("2")).to eq(true)
        expect(Validators.validate_input("3")).to eq(true)
        expect(Validators.validate_input("4")).to eq(true)
        expect(Validators.validate_input("0")).to eq(false)
        expect(Validators.validate_input("5")).to eq(false)
        expect(Validators.validate_input("hello")).to eq(false)
        expect(Validators.validate_input("500")).to eq(false)
    end
end

describe 'validate withdrawl' do 
    it 'is a positive integer' do
        expect(Validators.validate_withdrawl("100")).to eq(true)
        expect(Validators.validate_withdrawl("00123")).to eq(true)
        expect(Validators.validate_withdrawl("-100")).to eq(false)
        expect(Validators.validate_withdrawl("ereedf35")).to eq(false)
    end
    it 'is <= the current bank balance' do  
        expect(Validators.validate_amount_against_balance('300','500')).to eq(true)
        expect(Validators.validate_amount_against_balance('3000','500')).to eq(false)
        expect(Validators.validate_amount_against_balance('100','0')).to eq(false)
    end
end