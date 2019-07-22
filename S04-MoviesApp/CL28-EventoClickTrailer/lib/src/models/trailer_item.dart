class TrailerItem {
  int _id;
  List<Results> _results;

  TrailerItem({int id, List<Results> results}) {
    this._id = id;
    this._results = results;
  }

  int get id => _id;
  set id(int id) => _id = id;
  List<Results> get results => _results;
  set results(List<Results> results) => _results = results;

  TrailerItem.fromJson(Map<String, dynamic> json) {
    _id = json['id'];
    if (json['results'] != null) {
      _results = new List<Results>();
      json['results'].forEach((v) {
        _results.add(new Results.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this._id;
    if (this._results != null) {
      data['results'] = this._results.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Results {
  String _id;
  String _iso6391;
  String _iso31661;
  String _key;
  String _name;
  String _site;
  int _size;
  String _type;

  Results(
      {String id,
        String iso6391,
        String iso31661,
        String key,
        String name,
        String site,
        int size,
        String type}) {
    this._id = id;
    this._iso6391 = iso6391;
    this._iso31661 = iso31661;
    this._key = key;
    this._name = name;
    this._site = site;
    this._size = size;
    this._type = type;
  }

  String get id => _id;
  set id(String id) => _id = id;
  String get iso6391 => _iso6391;
  set iso6391(String iso6391) => _iso6391 = iso6391;
  String get iso31661 => _iso31661;
  set iso31661(String iso31661) => _iso31661 = iso31661;
  String get key => _key;
  set key(String key) => _key = key;
  String get name => _name;
  set name(String name) => _name = name;
  String get site => _site;
  set site(String site) => _site = site;
  int get size => _size;
  set size(int size) => _size = size;
  String get type => _type;
  set type(String type) => _type = type;

  Results.fromJson(Map<String, dynamic> json) {
    _id = json['id'];
    _iso6391 = json['iso_639_1'];
    _iso31661 = json['iso_3166_1'];
    _key = json['key'];
    _name = json['name'];
    _site = json['site'];
    _size = json['size'];
    _type = json['type'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this._id;
    data['iso_639_1'] = this._iso6391;
    data['iso_3166_1'] = this._iso31661;
    data['key'] = this._key;
    data['name'] = this._name;
    data['site'] = this._site;
    data['size'] = this._size;
    data['type'] = this._type;
    return data;
  }
}