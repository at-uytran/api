module Api
  module V1
    class NotificationsController < ApplicationController
      def index
        render json: {
          notifications: Notification.latest.as_json,
          total_count: Notification.count,
          unread: Notification.unread.count
        }
      end

      def create
        Notification.create(notification_params)
      end

      private
      def notification_params
        params.require(:notification).permit(:content)
      end
    end
  end
end
