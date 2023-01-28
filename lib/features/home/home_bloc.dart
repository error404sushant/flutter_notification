import 'package:flutter/cupertino.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

class HomeBloc{
  //region Common variable
  late BuildContext context;
  FirebaseMessaging messaging = FirebaseMessaging.instance;
  String? token;

  //endregion

//region Text Editing Controller
//endregion

//region Controller
//endregion
  //region Constructor
  HomeBloc({required context});
  //endregion
//region Init
void init(){
  initMessaging();
  // onListen();
  // onOpenNotification();
  // onTerminateMessage();
}
//endregion


//region Initialization messaging
void initMessaging()async{
  NotificationSettings settings = await messaging.requestPermission(
    alert: true,
    announcement: false,
    badge: true,
    carPlay: false,
    criticalAlert: false,
    provisional: false,
    sound: true,
  );
}
//endregion

  //region Token
void getToken()async{
 token = await messaging.getToken();
 print(token);
}
//endregion


//region On listen
void onListen(){
  FirebaseMessaging.onMessage.listen((RemoteMessage message) {
    print('Got a message whilst in the foreground!');
    print('Message data: ${message.data}');

    if (message.notification != null) {
      print('Message also contained a notification: ${message.notification!.body}');
      print('Message also contained a notification: ${message.notification!.title}');
    }
  });
}
//endregion


//region On Open notification
 void onOpenNotification()async{
   /// on click Notification from background
   FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
   });
   // endregion

   // region on Terminated
   /// on click Notification from terminated state
   var message = await FirebaseMessaging.instance.getInitialMessage();
   print('Message also contained a notification ontap message: ${message!.data}');

   if (message != null) {
     print('Message also contained a notification ontap message: ${message.notification!.body}');
   }
 }
//endregion


//region On Terminate state
  void onTerminateMessage()async{
    /// on click Notification from background
    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
    });
    // endregion

    // region on Terminated
    /// on click Notification from terminated state
    var message = await FirebaseMessaging.instance.getInitialMessage();
    print('Message also contained a notification terminate message: ${message!.data}');
    if (message != null) {
      print('Message also contained a notification terminate message: ${message.notification!.body}');
    }
  }
//endregion




}