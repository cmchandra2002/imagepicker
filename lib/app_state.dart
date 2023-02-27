import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'flutter_flow/lat_lng.dart';

class FFAppState extends ChangeNotifier {
  static final FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal() {
    initializePersistedState();
  }

  Future initializePersistedState() async {
    prefs = await SharedPreferences.getInstance();
    _imageurl = prefs.getString('ff_imageurl') ?? _imageurl;
    _location = _latLngFromString(prefs.getString('ff_location')) ?? _location;
  }

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  late SharedPreferences prefs;

  String _image = '';
  String get image => _image;
  set image(String _value) {
    _image = _value;
  }

  String _imageurl = '';
  String get imageurl => _imageurl;
  set imageurl(String _value) {
    _imageurl = _value;
    prefs.setString('ff_imageurl', _value);
  }

  LatLng? _location = LatLng(18.7747161, 84.40938760000002);
  LatLng? get location => _location;
  set location(LatLng? _value) {
    _location = _value;
    _value != null
        ? prefs.setString('ff_location', _value.serialize())
        : prefs.remove('ff_location');
  }
}

LatLng? _latLngFromString(String? val) {
  if (val == null) {
    return null;
  }
  final split = val.split(',');
  final lat = double.parse(split.first);
  final lng = double.parse(split.last);
  return LatLng(lat, lng);
}
