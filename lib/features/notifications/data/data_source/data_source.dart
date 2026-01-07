import 'package:mycampusinfo_app/core/network/index.dart' show ResultFuture, ResultVoid;
import 'package:mycampusinfo_app/features/notifications/data/index.dart' show Notification;

abstract class NotificationDataSource {
  /// Get all notifications for a user
  ResultFuture<List<Notification>> getNotifications({required int page});

  /// Mark single notification as read
  ResultFuture<Notification?> markNotificationAsRead({
    required String notificationId,
  });

  /// Mark all notifications as read for a user
  ResultVoid markAllNotificationsAsRead();
}
