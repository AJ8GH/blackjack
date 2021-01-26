describe String do
  context '#dollarfy' do
    it 'adds $$$ to each end of string' do
      expect(''.dollarfy).to eq '$$$  $$$'
    end
  end
end
