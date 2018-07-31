class LineItem < ApplicationRecord
  belongs_to :item
  belongs_to :order
  
    validate :ensure_unique_item_per_order

    def ensure_unique_item_per_order

        errors.add(:item_id, "duplicated item exists in order") if @duplicate_item_ids.present? and @duplicate_item_ids.include?(item_id)

     end


end
