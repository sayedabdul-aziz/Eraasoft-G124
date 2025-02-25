class ChatModel {
  String? name;
  String? lastMsg;
  String? time;
  String? imageUrl;
  bool? isOnline;

  ChatModel({this.name, this.lastMsg, this.time, this.imageUrl, this.isOnline});
}

List<ChatModel> chats = [
  ChatModel(
    name: "Ahmed Sayed Zizo",
    lastMsg: "Hello, Ahmed",
    time: "12:00 AM",
    imageUrl: 'https://sites.duke.edu/wcwp/files/2020/02/Picture1.png',
  ),
  ChatModel(
    name: "Atef Ahmed",
    lastMsg: "Hello, Ahmed",
    time: "12:00 AM",
    imageUrl: 'https://sites.duke.edu/wcwp/files/2020/02/Picture1.png',
  ),
  ChatModel(
    name: "Mohamed Salah",
    lastMsg: "Hello, Ahmed",
    time: "12:00 AM",
    imageUrl: 'https://sites.duke.edu/wcwp/files/2020/02/Picture1.png',
  ),
  ChatModel(
    name: "Shikabala",
    lastMsg: "Hello, Ahmed",
    time: "12:00 AM",
    imageUrl: 'https://sites.duke.edu/wcwp/files/2020/02/Picture1.png',
  ),
  ChatModel(
    name: "Elshenawy",
    lastMsg: "Hello, Ahmed",
    time: "12:00 AM",
    imageUrl: 'https://sites.duke.edu/wcwp/files/2020/02/Picture1.png',
  ),
  ChatModel(
    name: "Elsisi",
    lastMsg: "Hello, Ahmed",
    time: "12:00 AM",
    imageUrl: 'https://sites.duke.edu/wcwp/files/2020/02/Picture1.png',
  ),
];
