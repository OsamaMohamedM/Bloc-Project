import 'dart:convert';

class Character {
  late int _id;
  late String _name;
  late String _status;
  late String _species;
  late String _type;
  late String _gender;
  late String _image;
  late String _originName;

  String get location => _location;

  set location(String value) {
    _location = value;
  }

  late String _location;

  String get originName => _originName;

  set originName(String value) {
    _originName = value;
  }

  List<dynamic>_episodeAppearance ;

  Character(this._id, this._name, this._status, this._species, this._type,
      this._gender ,this._image,this._episodeAppearance);

  List<dynamic> get episodeAppearance => _episodeAppearance;

  set episodeAppearance(List<dynamic> value) {
    _episodeAppearance = value;
  }

  String get image => _image;

  set image(String value) {
    _image = value;
  }

  String get gender => _gender;

  set gender(String value) {
    _gender = value;
  }

  String get type => _type;

  set type(String value) {
    _type = value;
  }

  String get species => _species;

  set species(String value) {
    _species = value;
  }

  String get status => _status;

  set status(String value) {
    _status = value;
  }

  String get name => _name;

  set name(String value) {
    _name = value;
  }

  int get id => _id;

  set id(int value) {
    _id = value;
  }
  Character.fromJson(Map<String, dynamic> json)
      : _id = json['id'],
        _name = json['name'],
        _status = json['status'],
        _species = json['species'],
        _type = json['type'],
        _gender = json['gender'],
        _image = json['image'],
        _episodeAppearance = json['episode'],
        _originName = json['origin']['name'],
        _location = json['location']['name'];

}
