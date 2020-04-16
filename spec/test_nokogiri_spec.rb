require_relative '../lib/test_nokogiri.rb'

describe "pour créer un hash" do
    it "j'ai bien des valeurs dans mon tableau" do
        expect(create_bitcoin_array.length).to eq(200)
    end
    it  "j'ai créé un tableau" do
        expect(create_bitcoin_array.class).to eq(Array)
    end
end