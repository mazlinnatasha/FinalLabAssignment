class User{
  String? id;
  String? name;
  String? email;
  String? password;

  User(
    {
      this.id,
      this.name,
      this.email,
      this.password,
    });
  User.fromJson(Map<String, dynamic> json){
    id = json["id"];
    name = json["name"];
    email = json["email"];
    password = json["password"];
  }

  get phone => null;

  get datereg => null;
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['email'] = this.email;
    data['password'] = this.password;
    return data;
  }  
}
