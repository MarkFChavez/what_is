require "spec_helper"

describe WhatIs do
  context "initially" do
    it "has no definition" do
      result = WhatIs::Define.new("sample")
      expect(result).not_to have_definition
    end
  end

  context "defining a word" do
    it "returns the meaning" do
      result = WhatIs::Define.new("house")
      expect(result.define!).to eq "sample"
    end
  end
end
