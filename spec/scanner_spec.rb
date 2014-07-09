require './scanner.rb'
require "spec_helper"

describe "Scanner" do

  let(:scanner) { Scanner.new("AAAABBBCCCCCCDDDD")}

  describe "#sort_check_out_items" do
    it 'returns a hash with the correct number of check out products' do
      scanner.sort_check_out_items
      expect(scanner.sorted_items).to eq({"A" => 4, "B" => 3, "C" => 6, "D" => 4})
    end
  end

  describe "#scan_items" do
    it 'returns the total price of each item and takes into account the discount' do
      scanner.sort_check_out_items
      scanner.scan_items
      expect(scanner.sorted_items).to eq({"A" => 7, "B" => 36 , "C" => 6, "D" => 0.6 })
    end
  end

  describe "#check_out_total" do
    it 'returns the total price' do
      scanner.sort_check_out_items
      scanner.scan_items
      expect(scanner.add_total_price).to eq(49.6)
    end
  end

  describe "#check_out_total" do
    it 'sorts the items, scans the items, and adds the total price' do
      expect(scanner.check_out).to eq(49.6)
    end
  end

end
