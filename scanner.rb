class Scanner
  attr_reader :check_out_items
  attr_accessor :sorted_items

  PRICES = {
              "A" => { original_price: 2, discount_number: 4, discount_price: 7 },
              "B" => { original_price: 12 },
              "C" => { original_price: 1.25, discount_number: 6, discount_price: 6},
              "D" => { original_price: 0.15 }
            }

  def initialize check_out_items
    @check_out_items = check_out_items
    @sorted_items = Hash.new(0)
  end

  def sort_check_out_items
    check_out_items.split("").each do |item|
      sorted_items[item] += 1
    end
  end

  def scan_items
    sorted_items.each do |item, total|
      if PRICES[item][:discount_number] && total >= PRICES[item][:discount_number]
        total_item_price = apply_discount(item, total) 
      else
        total_item_price = apply_full_price(item, total)           
      end
      sorted_items[item] = total_item_price
    end
  end

  def add_total_price
    total = 0
    sorted_items.each do |item, total_price|
      total += total_price
    end 
    total
  end

  def check_out
    sort_check_out_items
    scan_items
    add_total_price
  end

  private

  def apply_discount(item, total)
    ((total / PRICES[item][:discount_number]) * PRICES[item][:discount_price]) + ((total % PRICES[item][:discount_number]) *PRICES[item][:original_price])
  end

  def apply_full_price(item, total)
    total * (PRICES[item][:original_price]) 
  end

end
