module SubscribeButtonHelper
  def subscribe_button item
    if user_signed_in?
      unless item.subscribers.include? current_user
        link_to "Subscribe", subscribe_path(item), class: "btn btn-primary", method: :post
      end
    end
  end
end