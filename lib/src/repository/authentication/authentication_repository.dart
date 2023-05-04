import 'package:coolstuff_market/src/features/Home/screens/dashboard.dart';
import 'package:coolstuff_market/src/productos_main/dashb.dart';
import 'package:coolstuff_market/src/repository/authentication/exceptiones/signup_email_password_failure.dart';
import 'package:coolstuff_market/src/utils/toast.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

import '../../features/authentication/screens/welcome/welcome_screen.dart';

class AuthenticationRepository extends GetxController {
  static AuthenticationRepository get instance => Get.find();

  //Variables
  final _auth = FirebaseAuth.instance;
  late final Rx<User?> firebaseUser;
  var verificationId =''.obs;

  @override
  void onReady() {
    firebaseUser = Rx<User?>(_auth.currentUser);
    firebaseUser.bindStream(_auth.userChanges());

    ever(firebaseUser, _setInitialScreen);
  }


  _setInitialScreen(User? user) {
    user == null ? Get.offAll(() => WelcomeScreen()) : Get.offAll(() => const dashb());
  }

  //Func
  Future<void> phoneAuthentication(String phoneNo) async {
    await _auth.verifyPhoneNumber(
      phoneNumber: phoneNo,
        verificationCompleted: (credentials) async{
        await _auth.signInWithCredential(credentials);
        },
        verificationFailed: (e){
        if(e.code=='invalid-phone-number'){
          Get.snackbar('Error', 'El número de telefono diligenciado no es valido.');
        }else{
          Get.snackbar('Error', 'Algo malo sucedio, por favor intente de nuevo.');
        }
        },
        codeSent: (verificationId, resendToken){
        this.verificationId.value =verificationId;
        },
        codeAutoRetrievalTimeout: (verificationId){
          this.verificationId.value =verificationId;
        }
    );
  }

  Future<bool> verifyOTP(String otp) async{
    var credentials = await _auth.signInWithCredential(PhoneAuthProvider.credential(verificationId: verificationId.value, smsCode: otp));
    return credentials.user != null? true:false;
  }

  Future<void> createUserWithEmailAndPassword(String email,String password) async {
    try {
      await _auth.createUserWithEmailAndPassword(email: email, password: password);
      firebaseUser.value == null ?  Get.offAll(() => WelcomeScreen()):Get.offAll(() => const dashb());
    } on FirebaseAuthException catch (e) {
      final ex = SignUpWithEmailAndPasswordFailure.code(e.code);
      print('FIREBASE AUTH EXCEPTION:  ${ex.message}');
      flutterToast('FIREBASE AUTH EXCEPTION:  ${ex.message}','error');
      throw ex ;
    } catch (_) {
      const ex = SignUpWithEmailAndPasswordFailure();
      print('EXCEPTION: ${ex.message}');
      flutterToast('EXCEPTION: ${ex.message}','error');
      throw ex ;
    }


  }
  Future<void> signInWithEmailAndPassword(String email,
      String password) async {
    try {
      await _auth.signInWithEmailAndPassword(
          email: email, password: password);
    } on FirebaseAuthException catch (e) {

    } catch (_) {}
  }

  Future<void> logout() async => await _auth.signOut();
}
