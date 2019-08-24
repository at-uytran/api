class NotificationBroadcastJob < ApplicationJob
  queue_as :default

  def perform notification, count, unread
    ActionCable.server.broadcast "notification_channel",
      notification: notification.as_json, count: count, unread: unread
  end
end
