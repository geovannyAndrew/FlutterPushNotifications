import 'package:firebase_messaging/firebase_messaging.dart';

class PushNotificationProvider{

  final FirebaseMessaging _firebaseMessaging = FirebaseMessaging();

  initNotifications(){
    _firebaseMessaging.requestNotificationPermissions();
    _firebaseMessaging.getToken().then((token){// this could be and await if we want
      print('======== FCM =========');
      print(token);
      //e79W7tiA_OI:APA91bGaDMobmSP4MdpQDRA-npMZ5b1nuDqWYmfLP8OtLNfTAgQ8wQztSgZkPqG9IrW25S4SCknPB3jr_xeO8SUvnkr9v-3FVly-xb62GKdsCPPVX1vmSn2JT_A6WN-OoSmGh-dVR4Tu
    });

    _firebaseMessaging.configure(
      onMessage: (data){
        print('==== onMessage ====');
        print(data);
      },
      onLaunch: (data){
        print('==== onLaunch ====');
        print(data);
        
      },
      onResume: (data){
        print('==== onResume ====');
        print(data);   
        //final notification = data['data']['food'];
        //print(notification);
      }
    );
  }
}