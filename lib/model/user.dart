import 'dart:convert';

class User {
  final String Id;
  final String Name;
  final String Email;
  final String Password;
  final String Address;
  final String Token;
  final String Type;

  User(
      {required this.Id,
      required this.Name,
      required this.Email,
      required this.Password,
      required this.Address,
      required this.Token,
      required this.Type});

   Map<String,dynamic> toMap() {
       return {
         'id': Id,
         'name': Name,
         'email': Email,
         'password': Password,
         'address': Address,
         'token': Token,
         'type': Type
       };
   }

   factory User.fromMap(Map<String, dynamic>map) {
     return User(
         Id: map['_id'] ?? '',
         Name: map['name'] ?? '',
         Email: map['email'] ?? '',
         Password: map['password'] ?? '',
         Address: map['address'] ?? '',
         Token: map['token'] ?? '',
         Type: map['type'] ?? '');
   }

   String toJson() => json.encode(toMap());

   factory User.fromJson(String source) => User.fromMap(json.decode(source));
}
