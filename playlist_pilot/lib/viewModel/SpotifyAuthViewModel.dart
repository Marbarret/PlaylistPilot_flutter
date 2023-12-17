import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class SpotifyAuthViewModel with ChangeNotifier {
  bool _isAuthenticating = false;
  String? _accessToken;

  bool get isAuthenticating => _isAuthenticating;
  String? get accessToken => _accessToken;

  Future<void> authenticateWithSpotify() async {
    const authURL =
        'https://accounts.spotify.com/authorize?client_id=6b9af07257ab49ef94a3eab3162b1112&response_type=code&redirect_uri=spotify-ios-quick-start://spotify-login-callback&scope=user-read-private';

    _isAuthenticating = true;
    notifyListeners();

    // ignore: deprecated_member_use
    if (await canLaunch(authURL)) {
      // ignore: deprecated_member_use
      await launch(authURL);
    } else {
      _isAuthenticating = false;
      notifyListeners();
    }
  }
}
