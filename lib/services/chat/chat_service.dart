import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_messnger/model/message.dart';

class ChatService extends ChangeNotifier {
  //get the instance
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  final FirebaseFirestore _firebaseStore = FirebaseFirestore.instance;

  //SEND MESSAGE
  Future<void> sendMessage(String recieverID, String message) async {
    final String currentUserId = _firebaseAuth.currentUser!.uid;
    final String currentUserEmail = _firebaseAuth.currentUser!.email.toString();
    final Timestamp timestamp = Timestamp.now();

    Message newMessage = Message(
      senderId: currentUserId,
      recieverID: recieverID,
      senderEmail: currentUserEmail,
      message: message,
      timestamp: timestamp,
    );

    //construct chat room id with currentUserId and recieverID
    List<String> ids = [currentUserId, recieverID];
    ids.sort();
    String chatRoomId = ids.join('_');

    await _firebaseStore
        .collection('chat_rooms')
        .doc(chatRoomId)
        .collection('messages')
        .add(newMessage.toMap());
  }

  //GET MESSAGE
  Stream<QuerySnapshot> getMessages(String userId, otherUserId) {
    //construct chat room id with currentUserId and recieverID
    List<String> ids = [userId, otherUserId];
    ids.sort();
    String chatRoomId = ids.join('_');

    return _firebaseStore
        .collection('chat_rooms')
        .doc(chatRoomId)
        .collection('messages')
        .orderBy('timestamp', descending: false)
        .snapshots();
  }
}
