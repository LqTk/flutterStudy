class Note{
  int _id;
  int _pointId;
  String _image;
  int _contractId;
  int _publicationId;
  double _pointLng;
  double _pointLat;

  Note(this._id, this._pointId, this._image, this._contractId,
      this._publicationId, this._pointLng, this._pointLat);

  Note.map(dynamic obj){
    this._id = obj['id'];
    this._pointId = obj['pointId'];
    this._image = obj['image'];
    this._contractId = obj['ontractId'];
    this._publicationId = obj['publictioniId'];
    this._pointLng = obj['pointLng'];
    this._pointLat = obj['pointLat'];
  }

  int get id=>_id;
  int get pointId => _pointId;
  String get image => _image;
  int get contractId => _contractId;
  int get publicationId => _publicationId;
  double get pointLng => _pointLng;
  double get pointLat => _pointLat;

  Map<String,dynamic> toMap(){
    var map = new Map<String,dynamic>();
    if(_id!=null){
      map['id'] = _id;
    }
    map['pointId'] = _pointId;
    map['image'] = _image;
    map['contractId'] = _contractId;
    map['publicationId'] = _publicationId;
    map['pointLng'] = _pointLng;
    map['pointLat'] = _pointLat;

    return map;
  }

  Note.forMap(Map<String,dynamic> map){
    this._id = map['id'];
    this._pointId = map['pointId'];
    this._image = map['image'];
    this._contractId = map['contractId'];
    this._pointLng = map['pointLng'];
    this._pointLat = map['pointLat'];
  }
}