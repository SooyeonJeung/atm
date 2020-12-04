require '../index'

describe 'index.rb' do
    it 'says hello' do
        expect(hello()).to eq("hello world")
    end

    xit 'does stuff else' do
    end

end