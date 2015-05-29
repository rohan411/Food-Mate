class ItemsService
  def generate_random_items
    collections = Collection.order('RANDOM()').limit(ENV['TOTAL_DISTINCT_COLLECTIONS'])
    items = collections.map do |col|
              col.items.order('RANDOM()').limit(ENV['ITEMS_PER_COLLECTION']).map do |item|
                item.to_item_hash
              end
            end
    return items.flatten!
  end
end