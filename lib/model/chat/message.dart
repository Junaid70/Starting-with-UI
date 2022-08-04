class MessengerModel {
  String Image;
  String name;
  String disc;
  String day;

  MessengerModel(
      {required this.Image,
      required this.name,
      required this.disc,
      required this.day});
}

List<MessengerModel> messengerList = [
  MessengerModel(
      Image: "assets/images/1.png",
      name: "Klara Jay Rosaline",
      disc: "Heyyy! Please to meet tou",
      day: "Now"),
  MessengerModel(
      Image: "assets/images/2.png",
      name: "Tiffany Kontoyiannis",
      disc:
          "Heyyy! it was so wonderful meeting you the \nother night! i cant wait to work togather",
      day: "3:01Am"),
  MessengerModel(
      Image: "assets/images/3.png",
      name: "Michael Thunder",
      disc: "Haha yes! You're right, thank you",
      day: "Fri"),
  MessengerModel(
      Image: "assets/images/4.png",
      name: "Athony Thomas",
      disc:
          "Anthony Thomas Oh my god, you’re so right! I feel like at times \nend up doing what we always wanted within five",
      day: "Thu"),
  MessengerModel(
      Image: "assets/images/5.png",
      name: "Kirsten Lunkerman",
      disc: "Thank you so much!",
      day: "Wed"),
  MessengerModel(
      Image: "assets/images/6.png",
      name: "Tom Youll",
      disc: "I hope you like them! They are really good agents!",
      day: "Sat"),
  MessengerModel(
      Image: "assets/images/profilepic.png",
      name: "George Tinkle",
      disc: "For sure, I look forward to it :)",
      day: "Sun"),
];
