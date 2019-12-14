import 'dart:async';
import 'dart:io';

import 'package:firebase_messaging/firebase_messaging.dart';

class PushNotificationProvider{

  final FirebaseMessaging _firebaseMessaging = FirebaseMessaging();

  final _messagesStreamController = StreamController<String>.broadcast();
  Stream<String> get messages => _messagesStreamController.stream;

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
        var argument = 'no-data';
        if(Platform.isAndroid){
          argument = data['data']['food'] ?? 'no-data';
        }
        else if(Platform.isIOS){
          argument = data['food'] ?? 'no-data';
        }
        _messagesStreamController.sink.add(argument);
      },
      onLaunch: (data){
        print('==== onLaunch ====');
        print(data);
        
      },
      onResume: (data){
        print('==== onResume ====');
        print(data);   
        var argument = 'no-data';
        if(Platform.isAndroid){
          argument = data['data']['food'] ?? 'no-data';
        }
        else if(Platform.isIOS){
          argument = data['food'] ?? 'no-data';
        }
        _messagesStreamController.sink.add(argument);
      }
    );
  }

  dispose(){
    _messagesStreamController?.close();
  }
}