class SocialAuthUserDetails {
  String? displayName;
  String? email;
  String? phoneURL;

  // constructor
SocialAuthUserDetails({this.displayName,this.email,this.phoneURL});
  // creating map to parse json
SocialAuthUserDetails.fromJson(Map<String,dynamic>json){
  displayName = json['displayName'];
  email = json['email'];
  phoneURL = json['phoneURL'];
}
Map<String,dynamic> toJson() {
  final Map<String,dynamic> data = Map<String,dynamic>();

  // object =>>> data
  data['displayName'] = this.displayName;
  data['email'] = this.email;
  data['email'] = this.email;
  return data;
}

}