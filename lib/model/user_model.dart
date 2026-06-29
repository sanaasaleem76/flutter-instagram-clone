class UserModel {
  String? uid;
  String? name;
  String? username;
  String? bio;
  String? addLink;
  String? profileImage;
  String? email;
  int? post;
  int? followers;
  int? following;

  UserModel(
      {this.uid,
        this.name,
        this.email,
        this.username,
        this.bio,
        this.addLink,
        this.profileImage,
        this.post,
        this.followers,
        this.following});

  UserModel.fromJson(Map<String, dynamic> json) {
    uid = json['uid'];
    name = json['name'];
    email = json['email'];
    username = json['username'];
    bio = json['bio'];
    addLink = json['add_link'];
    profileImage = json['profile_image'];
    post = json['post'];
    followers = json['followers'];
    following = json['following'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['uid'] = this.uid;
    data['name'] = this.name;
    data['email'] = this.email;
    data['username'] = this.username;
    data['bio'] = this.bio;
    data['add_link'] = this.addLink;
    data['profile_image'] = this.profileImage;
    data['post'] = this.post;
    data['followers'] = this.followers;
    data['following'] = this.following;
    return data;
  }
}
