require "spec_helper"

describe WhatIs do
  context "defining a word" do
    it "returns the meaning" do
      definition = double("definition", body: "sample")
      result = WhatIs::Define.new("house", :thesaurus)

      Net::HTTP.stub(:get_response).and_return(definition)
      expect(result.define!).to eq "sample"
    end
  end
end
