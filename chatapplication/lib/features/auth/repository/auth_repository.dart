import 'dart:io';

import 'package:chatapplication/common/repositories/common_firebase_storage_repository.dart';
import 'package:chatapplication/common/utils/utils.dart';
import 'package:chatapplication/features/auth/screens/otp_screen.dart';
import 'package:chatapplication/features/auth/screens/user_information_screen.dart';
import 'package:chatapplication/models/user_model.dart';
import 'package:chatapplication/screens/mobile_layout_screen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final authRepositoryProvider = Provider(
  (ref) => AuthRepository(
    auth: FirebaseAuth.instance,
    firestore: FirebaseFirestore.instance,
  ),
);

class AuthRepository {
  final FirebaseAuth auth;
  final FirebaseFirestore firestore;
  AuthRepository({
    required this.auth,
    required this.firestore,
  });

  Future<UserModel?> getCurrentUserData() async {
    var userData =
        await firestore.collection('users').doc(auth.currentUser?.uid).get();

    UserModel? user;
    if (userData.data() != null) {
      user = UserModel.fromMap(userData.data()!);
    }
    return user;
  }

//   void signInWithPhone(BuildContext context, String phoneNumber) async {
//   try { 
//     await auth.verifyPhoneNumber(
//       phoneNumber: phoneNumber,
//       timeout: const Duration(seconds: 60), // Thêm dòng này để tăng thời gian chờ
//       verificationCompleted: (PhoneAuthCredential credential) async {
//         await auth.signInWithCredential(credential);
//       },
//       verificationFailed: (e) {
//         throw Exception(e.message);
//       },
//       codeSent: ((String verificationId, int? resendToken) async {
//         Navigator.pushNamed(
//           context,
//           OTPScreen.routeName,
//           arguments: verificationId,
//         );
//       }),
//       codeAutoRetrievalTimeout: (String verificationId) {},
//     );
//   } on FirebaseAuthException catch (e) {
//     showSnackBar(context: context, content: e.message!);
//   }
// }
void signInWithPhone(BuildContext context, String phoneNumber) async {
  try { 
    await auth.verifyPhoneNumber(
      phoneNumber: phoneNumber,
      timeout: const Duration(seconds: 60),
      verificationCompleted: (PhoneAuthCredential credential) async {
        // Do nothing here to avoid automatic sign in
      },
      verificationFailed: (e) {
        throw Exception(e.message);
      },
      codeSent: ((String verificationId, int? resendToken) async {
        Navigator.pushNamed(
          context,
          OTPScreen.routeName,
          arguments: verificationId,
        );
      }),
      codeAutoRetrievalTimeout: (String verificationId) {},
    );
  } on FirebaseAuthException catch (e) {
    showSnackBar(context: context, content: e.message!);
  }
}


  void verifyOTP({
    required BuildContext context,
    required String verificationId,
    required String userOTP,
  }) async {
    try {
      PhoneAuthCredential credential = PhoneAuthProvider.credential(
        verificationId: verificationId,
        smsCode: userOTP,
      );
      await auth.signInWithCredential(credential);
      Navigator.pushNamedAndRemoveUntil(
        context,
        UserInformationScreen.routeName,
        (route) => false,
      );
    } on FirebaseAuthException catch (e) {
      showSnackBar(context: context, content: e.message!);
    }
  }

  void saveUserDataToFirebase({
    required String name,
    required File? profilePic,
    required ProviderRef ref,
    required BuildContext context,
  }) async {
    try {
      String uid = auth.currentUser!.uid;
      String photoUrl =
          'https://www.google.com/url?sa=i&url=https%3A%2F%2Fwww.freepik.com%2Ficon%2Fuser_3177440&psig=AOvVaw1vN2_H2G5WZNK2d_kk9LW4&ust=1698849766075000&source=images&cd=vfe&opi=89978449&ved=0CBIQjRxqFwoTCPDovd3CoIIDFQAAAAAdAAAAABAD';

      if (profilePic != null) {
        photoUrl = await ref
            .read(commonFirebaseStorageRepositoryProvider)
            .storeFileToFirebase(
              'profilePic/$uid',
              profilePic,
            );
      }

      var user = UserModel(
        name: name,
        uid: uid,
        profilePic: photoUrl,
        isOnline: true,
        phoneNumber: auth.currentUser!.phoneNumber!,
        groupId: [],
      );

      await firestore.collection('users').doc(uid).set(user.toMap());

      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(
          builder: (context) => const MobileLayoutScreen(),
        ),
        (route) => false,
      );
    } catch (e) {
      showSnackBar(context: context, content: e.toString());
    }
  }
}