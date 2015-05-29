class ItemsService
  def initialize(params = nil, user_id = nil)
    @params = params
    @user_id = user_id
  end   

  def generate_random_items
    collections = Collection.order('RANDOM()').limit(ENV['TOTAL_DISTINCT_COLLECTIONS'])
    items = collections.map do |col|
              col.items.order('RANDOM()').limit(ENV['ITEMS_PER_COLLECTION']).map do |item|
                item.to_item_hash
              end
            end
    return items.flatten!
  end

  def item_liked
    begin
      item = Item.find(params[:item_id].to_i)
    rescue
      raise StandardError.new('Item not found against the item_id')
    end
    choice = UserChoice.where(:user_id => user_id).first
    choice.item_ids = choice.item_ids.to_s + "," + params[:item_id].to_s
    tags_unsorted = choice.tags.to_s + "," + item.tags.pluck(:name).map {|str| "#{str}"}.join(',')
    choice.tags = tags_unsorted.split(",").sort.map {|str| "#{str}"}.join(',')
    choice.save
  end

  private
  attr_reader :params, :user_id
end