import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_login_facebook/flutter_login_facebook.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:meta/meta.dart';
import 'package:uae_user/data/models/user_models/auth/login_model.dart';
import 'package:uae_user/data/models/user_models/auth/register_model.dart';
import 'package:uae_user/data/models/user_models/auth/resend_code_model.dart';
import 'package:uae_user/data/models/user_models/auth/reset_password_model.dart';
import 'package:uae_user/data/models/user_models/logout/logout_model.dart';
import 'package:uae_user/data/requests/auth/login_request.dart';
import 'package:uae_user/data/requests/auth/register_by_social_token_request.dart';
import 'package:uae_user/data/requests/auth/register_request.dart';
import 'package:uae_user/data/requests/auth/resend_code_request.dart';
import 'package:uae_user/data/requests/auth/reset_password_request.dart';
import 'package:uae_user/data/requests/auth/validate_code_request.dart';
import 'package:uae_user/data/requests/logout/logout_request.dart';

import '../../../constants/constant_methods.dart';
import '../../../constants/shared_preferences_keys.dart';
import '../../../data/data_provider/local/cache_helper.dart';
import '../../../data/models/user_models/auth/validate_code_model.dart';

part 'user_auth_state.dart';

class UserAuthCubit extends Cubit<UserAuthStates> {
  UserAuthCubit() : super(UserAuthInitial());

  static UserAuthCubit get(context) => BlocProvider.of(context);

  //////////////////////////////////// Register ////////////////////////////////////
  RegisterModel? userRegisterModel;

  void userRegister({
    required String name,
    required String phone,
    required String email,
    required String password,
  }) {
    emit(UserRegisterLoadingState());
    RegisterRequest.registerRequest(
      name: name,
      phone: phone,
      email: email,
      password: password,
    ).then((value) {
      userRegisterModel = value;
      if (userRegisterModel!.status.toString() == '200') {
        emit(UserRegisterSuccessState());
      } else {
        emit(UserRegisterErrorState(userRegisterModel!.message));
      }
    }).catchError((error) {
      printResponse('userRegister' + error.toString());
    });
  }

  //////////////////////////////////// Register By Social Token ////////////////////////////////////

  RegisterModel? registerBySocialTokenModel;

  void userRegisterBySocialToken({
    required String socialToken,
    required String email,
    required String name,
    required String phone,
  }) {
    emit(UserRegisterBySocialTokenLoadingState());
    RegisterBySocialTokenRequest.registerBySocialTokenRequest(
            email: email, name: name, phone: phone, socialToken: socialToken)
        .then((value) => (value) {
              registerBySocialTokenModel = value;
              emit(UserRegisterBySocialTokenSuccessState());
            })
        .catchError((error) {
      printResponse('userRegisterBySocialToken' + error.toString());
    });
  }

  //////////////////////////////////// Validate Code ////////////////////////////////////

  ValidateCodeModel? validateCodeModel;

  void userValidateCode({
    required String phone,
    required String code,
  }) {
    emit(UserValidateCodeLoadingState());
    ValidateCodeRequest.validateCodeRequest(phone: phone, code: code)
        .then((value) => (value) {
              validateCodeModel = value;
              if (validateCodeModel!.status.toString() == '200') {
                emit(UserValidateCodeSuccessState(validateCodeModel!.message));
              } else {
                emit(UserValidateCodeErrorState(validateCodeModel!.message));
              }
            })
        .catchError((error) {
      printResponse('userValidateCode' + error.toString());
    });
  }

  //////////////////////////////////// Login ////////////////////////////////////

  LoginModel? userLoginModel;

  void userLogin({
    required String phone,
    required String password,
  }) {
    emit(UserLoginLoadingState());
    LoginRequest.loginRequest(password: password, phone: phone).then((value) {
      userLoginModel = value;
      if (userLoginModel!.status.toString() == '200') {
        CacheHelper.saveDataToSP(
            key: SharedPreferencesKeys.SP_ACCESS_TOKEN_KEY,
            value: userLoginModel!.account!.apiToken);

        CacheHelper.saveDataToSP(
            key: SharedPreferencesKeys.SP_ACCOUNT_TYPE_KEY,
            value: userLoginModel?.account?.type);
        CacheHelper.saveDataToSP(
            key: SharedPreferencesKeys.SP_ACCOUNT_NAME_KEY,
            value: userLoginModel?.account?.name);
        CacheHelper.saveDataToSP(
            key: SharedPreferencesKeys.SP_ACCOUNT_PHONE_KEY,
            value: userLoginModel?.account?.phone);

        emit(UserLoginSuccessState());
      } else {
        emit(UserLoginErrorState(userLoginModel!.message));
      }
    }).catchError((error) {
      printResponse('UserLogin' + error.toString());
    });
  }

  //////////////////////////////////// Logout ////////////////////////////////////

  LogoutModel? userLogoutModel;

  void userLogout() {
    emit(UserLogoutLoadingState());
    LogoutRequest.logoutRequest()
        .then((value) => (value) {
              userLoginModel = value;
              if (userLogoutModel != null &&
                  userLogoutModel?.status.toString() == '200') {
                emit(UserLogoutSuccessState());
              } else {
                emit(UserLogoutErrorState());
              }
            })
        .catchError((error) {
      printResponse('userLogout' + error.toString());
    });
  }

//////////////////////////////////// Correcting Password ////////////////////////////////////

  ResetPasswordModel? resetPasswordModel;

  void userResettingPassword({
    required String newPassword,
  }) {
    emit(UserResetPasswordLoadingState());
    ResetPasswordRequest.resetPasswordRequest(newPassword: newPassword)
        .then((value) => (value) {
              resetPasswordModel = value;
              if (userLogoutModel!.status.toString() == '200') {
                emit(UserResetPasswordSuccessState());
              } else {
                emit(UserResetPasswordErrorState());
              }
            })
        .catchError((error) {
      printResponse('userResettingPassword' + error);
    });
  }

//////////////////////////////////// Resend Code ////////////////////////////////////

  ResendCodeModel? resendCodeModel;

  void userResendCode({
    required String phone,
  }) {
    emit(UserResendCodeLoadingState());
    ResendCodeRequest.resendCodeRequest(
      phone: phone,
    )
        .then((value) => (value) {
              resendCodeModel = value;
              if (resendCodeModel!.status.toString() == '200') {
                emit(UserResendCodeSuccessState());
              } else {
                emit(UserResendCodeErrorState());
              }
            })
        .catchError((error) {
      printResponse('userResendCode' + error.toString());
    });
  }

//////////////////////////////////// Auth With Facebook and Google ////////////////////////////////////
  signInWithFacebook() async {
    emit(UserFacebookAuthLoadingState());
    final fb = FacebookLogin();
    final res = await fb.logIn(permissions: [
      FacebookPermission.publicProfile,
      FacebookPermission.email,
    ]);

    switch (res.status) {
      case FacebookLoginStatus.success:
        // The user is suceessfully logged in
        // Send access token to server for validation and auth

        final FacebookAccessToken? accessToken = res.accessToken;
        // final AuthCredential authCredential = FacebookAuth.credential(accessToken.token);
        final AuthCredential authCredential =
            FacebookAuthProvider.credential(accessToken!.token);
        final result =
            await FirebaseAuth.instance.signInWithCredential(authCredential);
        // Get profile data from facebook for use in the app
        final profile = await fb.getUserProfile();

        print('Hello, ${profile!.name}! You ID: ${profile!.userId}');
        // Get user profile image url
        final imageUrl = await fb.getProfileImageUrl(width: 100);
        print('Your profile image: $imageUrl');
        // fetch user email
        final email = await fb.getUserEmail();
        // But user can decline permission
        CacheHelper.saveDataToSP(
            key: SharedPreferencesKeys.SP_FACEBOOK_ACCESS_TOKEN_KEY,
            value: accessToken.token);
        emit(UserFacebookAuthSuccessState());
        if (email != null) print('And your email is $email');
        break;
      case FacebookLoginStatus.cancel:
        // In case the user cancels the login process
        break;
      case FacebookLoginStatus.error:
        // Login procedure failed
        emit(UserFacebookAuthErrorState());
        print('Error while log in: ${res.error}');
        break;
    }
  }

  Future<UserCredential> signInWithGoogle() async {
    emit(UserGoogleAuthLoadingState());
    // Initiate the auth procedure
    final GoogleSignInAccount? googleUser =
        await GoogleSignIn(scopes: <String>["email"]).signIn();
    // fetch the auth details from the request made earlier
    final GoogleSignInAuthentication googleAuth =
        await googleUser!.authentication;
    // Create a new credential for signing in with google
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );

    if (credential.accessToken != null) {
      CacheHelper.saveDataToSP(
          key: SharedPreferencesKeys.SP_GOOGLE_ACCESS_TOKEN_KEY,
          value: credential.accessToken);
      emit(UserFacebookAuthSuccessState());
    } else {
      emit(UserFacebookAuthErrorState());
    }
    // Once signed in, return the UserCredential
    return await FirebaseAuth.instance.signInWithCredential(credential);
  }

//////////////////////////////////// Logout From Facebook and Google ////////////////////////////////////

  signOut() async {
    final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

    final GoogleSignIn googleUser =
        await GoogleSignIn(scopes: <String>["email"]);

    await _firebaseAuth.signOut();

    googleUser.signOut();
  }
}
