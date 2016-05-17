module SubscribeButtonHelper
  def subscribe_button_for event
    if user_signed_in? && event.creator != current_user
      unless event.subscribers.include? current_user
        link_to "Subscribe", subscribe_path(event), class: "btn btn-primary btn-lg", method: :post
      end
    end
  end

  def follow_button_for user
    if user_signed_in? && user != current_user
      unless user.subscribers.include? current_user
        link_to "Subscribe", follow_path(user), class: "btn btn-primary btn-lg", method: :post
      end
    end
  end
end