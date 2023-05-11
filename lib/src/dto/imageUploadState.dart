class ImageUploadState {
  bool _state;
  String _path;

  ImageUploadState(this._state,this._path);
  void setState( bool _state) {
    this._state = _state;
  }
  void setPath( String _path) {
    this._path = _path;
  }

  bool state() => _state;
  String path() => _path;

}


