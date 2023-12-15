import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class SpotifyAuthViewModel with ChangeNotifier {
  bool _isAuthenticating = false;
  String? _accessToken;

  bool get isAuthenticating => _isAuthenticating;
  String? get accessToken => _accessToken;

  Future<void> authenticateWithSpotify() async {
    const authURL =
        'https://accounts.spotify.com/authorize?client_id=YOUR_CLIENT_ID&response_type=code&redirect_uri=YOUR_REDIRECT_URI&scope=user-read-private';

    _isAuthenticating = true;
    notifyListeners();

    // ignore: deprecated_member_use
    if (await canLaunch(authURL)) {
      // ignore: deprecated_member_use
      await launch(authURL);
    } else {
      print('Failed to open URL');
      _isAuthenticating = false;
      notifyListeners();
    }
  }
}
