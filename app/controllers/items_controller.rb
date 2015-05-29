class ItemsController < SessionsController
  def get_items
    items_object = ItemsService.new
    items = items_object.generate_random_items
    render :json => {:payload => items, :meta => { :count => items.count }}, :status => 200
  end

  def like_item
    if params[:item_id].blank?
      render :json => {:message => "item_id parameter missing!"}, :status => 400
      return
    end
    items_object = ItemsService.new(params, @user_id)
    begin
      items_object.item_liked
    rescue => e
      render :json => e.message, :status => 400
      return
    end
    render :json => { :message => "Success!!" }, :status => 200
  end
end
