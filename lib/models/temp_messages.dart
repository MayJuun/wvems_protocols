class Message {
  Message({
    required this.title,
    this.body =
        'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.',
    this.beenRead = false,
  });

  String title;
  String body;
  DateTime dateTime = DateTime.now();
  bool beenRead;
}

// todo: remove
final Set<Message> tempMessageSet = {
  Message(title: 'new message 1'),
  Message(title: 'new message 2'),
  Message(title: 'new message 3'),
  Message(title: 'new message 4'),
  Message(title: 'new message 5'),
  Message(title: 'new message 6'),
  Message(title: 'message 1', beenRead: true),
  Message(title: 'message 2', beenRead: true),
  Message(title: 'message 3', beenRead: true),
  Message(title: 'message 4', beenRead: true),
  Message(title: 'message 5', beenRead: true),
  Message(title: 'message 6', beenRead: true),
};
