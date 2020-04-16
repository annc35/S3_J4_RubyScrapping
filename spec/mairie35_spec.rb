require_relative '../lib/mairie35.rb'

describe "pour établir la liste des emails" do
    it "j'ai bien un 1er email dans mon tableau" do
        expect(create_emails_array).to eq(["mairie.avernes@orange.fr"])
    end
end