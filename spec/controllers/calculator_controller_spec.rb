require 'spec_helper'
require 'savon'

describe CalculatorController do
  before do
    @client = Savon.client(wsdl: "http://localhost:3000/calculator/wsdl")
  end

  it "should responde with 4 operations" do
    expect(@client.operations).to match_array([:sum, :substract, :multiply, :divide])
  end

  describe "#sum" do
    it "returns the sum of the two params" do
      VCR.use_cassette('sum') do
        result = @client.call(:sum, message: { :a => 2, :b => 2 })
        expect(result.to_hash[:sum_response][:value].to_i).to eq 4
      end
    end
  end

  describe "#substract" do
    it "returns the subtraction of the two params" do
      VCR.use_cassette('substract') do
        result = @client.call(:substract, message: { :a => 2, :b => 2 })
        expect(result.to_hash[:substract_response][:value].to_i).to eq 0
      end
    end
  end

  describe "#multiply" do
    it "returns the multiplication of the two params" do
      VCR.use_cassette('multiply') do
        result = @client.call(:multiply, message: { :a => 3, :b => 3 })
        expect(result.to_hash[:multiply_response][:value].to_i).to eq 9
      end
    end
  end

  describe "#divide" do
    it "returns the division of the two params" do
      VCR.use_cassette('divide') do
        result = @client.call(:divide, message: { :a => 12, :b => 4 })
        expect(result.to_hash[:divide_response][:value].to_i).to eq 3
      end
    end
  end
end
