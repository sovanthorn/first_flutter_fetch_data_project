class Data {
  final int id;
  final int userId;
  final String title;
  final String body;

  Data({
    required this.id,
    required this.userId,
    required this.title,
    required this.body,
  });

  factory Data.fromJson(Map<String, dynamic> json) {
    return Data(
      id: json['id'],
      userId: json['userId'],
      title: json['title'],
      body: json['body'],
    );
  }
}
