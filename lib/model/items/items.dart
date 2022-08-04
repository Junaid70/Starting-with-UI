class Events {
  String name;
  List<String> images;

  Events({
    required this.name,
    required this.images,
  });
}

List<Events> eventlist = [
  Events(
    name: 'Event',
    images: [
      'assets/images/ic_event1.png',
      'assets/images/ic_event2.png',
      'assets/images/ic_event3.png',
    ],
  ),
  Events(
    name: 'BTS',
    images: [
      'assets/images/ic_bts1.png',
      'assets/images/ic_bts2.png',
      'assets/images/ic_bts3.png',
    ],
  ),
  Events(
    name: 'Press',
    images: [
      'assets/images/ic_press1.png',
      'assets/images/ic_press2.png',
      'assets/images/ic_press3.png',
    ],
  ),
];
