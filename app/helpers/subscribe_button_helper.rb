module SubscribeButtonHelper
  def subscribe_button_for item
    if user_signed_in? && item.creator != current_user
      unless item.subscribers.include? current_user
        link_to "Subscribe", subscribe_path(item), class: "btn btn-primary btn-lg", method: :post
      end
    end
  end
end