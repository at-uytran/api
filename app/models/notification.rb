class Notification < ApplicationRecord
  after_create :broadcast_to_channel
  scope :latest, -> {order created_at: :desc}
  enum seen: {unread: 0, read: 1}

  private
  def broadcast_to_channel
    total = Notification.count
    unread = Notification.unread.count
    NotificationBroadcastJob.perform_now(self, total, unread)
  end
end
