// todo: remove

import 'models.dart';

final Set<AppMessage> tempMessageSet = {
  AppMessage(
    title: 'Message 1',
    body: '5 Mins ago',
    dateTime: DateTime.now().subtract(
      const Duration(minutes: 5),
    ),
  ),
  AppMessage(
    title: 'Message 2',
    body: '10 Mins ago',
    dateTime: DateTime.now().subtract(
      const Duration(minutes: 10),
    ),
  ),
  AppMessage(
    title: 'Message 3',
    body: '15 Mins ago',
    dateTime: DateTime.now().subtract(
      const Duration(minutes: 15),
    ),
  ),
  AppMessage(
    title: 'Message 4',
    body: '1 Day ago',
    beenRead: true,
    dateTime: DateTime.now().subtract(
      const Duration(days: 1),
    ),
  ),
  AppMessage(
    title: 'Message 5',
    body: '5 Days ago',
    beenRead: true,
    dateTime: DateTime.now().subtract(
      const Duration(days: 5),
    ),
  ),
  AppMessage(
    title: 'Message 6',
    body: '1 Week ago',
    beenRead: true,
    dateTime: DateTime.now().subtract(
      const Duration(days: 7),
    ),
  ),
};
