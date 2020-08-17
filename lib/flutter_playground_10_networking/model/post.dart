// Section 21 - Connecting to the World - Networking in Flutter

class PostList {
  final List<Post> posts;

  PostList({this.posts});

  factory PostList.fromJson(List<dynamic> parsedJson) {
    List<Post> posts = new List<Post>();

    // map: a method in List
    posts = parsedJson.map((i) => Post.fromJson(i)).toList();

    return new PostList(posts: posts); // Post[0].userId
  }
}

// PODO - Plain Old Dart Object
class Post {
  int userId, id;
  String title, body;

  // Named parameters: enclosed in {}
  Post({this.userId, this.id, this.title, this.body});

  // keyword: factory => we don't want to constantly create
  // new instances of Post.
  factory Post.fromJson(Map<String, dynamic> json) {
    return Post(
        userId: json["userID"],
        id: json["id"],
        title: json["title"],
        body: json["body"]);
  }
}
