

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ApplyCompleted extends StatelessWidget {
  const ApplyCompleted({super.key});

  @override
  Widget build(BuildContext context) {
    return  WillPopScope(
      onWillPop: () async {
        // Handle back button press
        // Disable browser navigation
        SystemChannels.navigation.invokeMethod<void>('popRoute');

        // Return false to prevent popping the route
        return false;
      },
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Center(child: SizedBox(
                height: 200,
                width: 200,
                child: Image.asset('assets/logo.jpg')),),
            SizedBox(height: 30,),
            Center(child: Text('You have successfully applied for Flutter training.\nWe will inform you shortly.',textAlign: TextAlign.center,))
          ],
        ),
      ),
    );
  }
}
