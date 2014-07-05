require './scanner.rb'
require "spec_helper"

describe "Scanner" do

  describe "#sort_check_out_items" do
    it 'returns a hash with the correct number of check out products' do
      scanner = Scanner.new("ABCA")
      scanner.sort_check_out_items
      expect(scanner.sorted_items).to eq({"A" => 2, "B" => 1, "C" => 1})
    end
  end

  describe "#scan_items" do
    it 'returns the total price of each item and takes into account the discount' do
      scanner = Scanner.new("AAAABBBCCCCCCDDDD")
      scanner.sort_check_out_items
      scanner.scan_items
      expect(scanner.sorted_items).to eq({"A" => 7, "B" => 36 , "C" => 6, "D" => 0.6 })
    end
  end

  describe "#check_out_total" do
    it 'returns the total price' do
      scanner = Scanner.new("AAAABBBCCCCCCDDDD")
      scanner.sort_check_out_items
      scanner.scan_items
      expect(scanner.add_total_price).to eq(49.6)
    end
  end


end
