class ItemsController < ApplicationController
  def get_items
    items_object = ItemsService.new
    items = items_object.generate_random_items
    render :json => {:payload => items, :meta => { :count => items.count }}, :status => 200
  end
end
