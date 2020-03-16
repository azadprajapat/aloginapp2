class Details {
  int _mobile;
  String _username;
  String _email;
  String _password;

  Details(this._mobile, this._username, this._email, this._password);
  Details.withId(this._mobile, this._username, this._email, this._password);

  int get mobile => _mobile;
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
    if ( _username != null ) {
      map['username'] = _username;
    }
    map['mobile'] = _mobile;
    map['email'] = _email;
    map['password'] = _password;
    return map;
  }

  // Extract a Note Object from a Map Object
  Details.fromMapObject( Map<String, dynamic> map ) {
    this._username = map['username'];
    this._mobile = map['mobile'];
    this._email = map["email"];
    this._password = map['password'];
  }

}