class Details {
  int _id;
  String _mobile;
  String _username;
  String _email;
  String _password;

  Details(this._mobile, this._username, this._email, this._password);
  Details.withId(this._id,this._mobile, this._username, this._email, this._password);
  int get id=> _id;
  String get mobile => _mobile;
  String get username => _username;
  String get email => _email;
   String get password=> _password;
  set username(newusername) {

      this._username = newusername;
  }
  set email(newemail) {
      this._email = newemail;
  }
  set mobile(newmobile) {
    this._mobile = newmobile;
  }
  set password(newPassword) {
    this._password = newPassword;
  }

  // Convert a Note Object to Map Object
  Map<String, dynamic> toMap() {
    var map = Map<String, dynamic> ();
    map['id']=_id;
      map['username'] = _username;
    map['mobile'] = _mobile;
    map['email'] = _email;
    map['password'] = _password;
    return map;
  }

  Details.fromMapObject( Map<String, dynamic> map ) {
    this._id=map['id'];
    this._username = map['username'];
    this._mobile = map['mobile'];
    this._email = map["email"];
    this._password = map['password'];
  }

}