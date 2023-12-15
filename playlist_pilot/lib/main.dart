import 'package:flutter/material.dart';
import 'package:playlist_pilot/viewModel/SpotifyAuthViewModel.dart';

void main() {
  runApp(ContentView());
}

class ContentView extends StatelessWidget {
  final SpotifyAuthViewModel viewModel = SpotifyAuthViewModel();

  ContentView({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if (viewModel.accessToken != null)
                Text('Access Token: ${viewModel.accessToken}')
              else
                ElevatedButton(
                  onPressed: () {
                    viewModel.authenticateWithSpotify();
                  },
                  style: ElevatedButton.styleFrom(
                    // ignore: deprecated_member_use
                    primary:
                        viewModel.isAuthenticating ? Colors.grey : Colors.blue,
                  ),
                  child: const Text('Login with Spotify'),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
