import 'package:firebase_messaging/firebase_messaging.dart';

class FirebaseAPI {
  //first create a new instance of firebase messaging:
  final _firebaseMessaging = FirebaseMessaging.instance;

  //create a method to init the messagingserices:
  Future<void> initNotifications() async {
    //request permission to send notifications:
    NotificationSettings settings = await _firebaseMessaging.requestPermission(
      alert: true,
      announcement: true,
      badge: true,
      carPlay: true,
      criticalAlert: true,
      provisional: false,
      sound: true,
    );

    //check if the user has granted permission:
    if (settings.authorizationStatus == AuthorizationStatus.authorized) {
      print('User granted permission');
    } else {
      print('User declined or has not accepted permission');
    }

    //get the token:
    String? token = await _firebaseMessaging.getToken();
    print('Token: $token');
  }
}
