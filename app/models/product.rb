class Product < ApplicationRecord
  after_create :create_notification
  scope :latest, -> {order created_at: :desc}
  enum seen: {unread: 0, read: 1}

  private
  def create_notification
    Notification.create(content: "You created new product", seen: false)
  end
end
