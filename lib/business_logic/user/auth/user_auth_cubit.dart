import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_login_facebook/flutter_login_facebook.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:meta/meta.dart';
import 'package:uae_user/constants/constants.dart';
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
import '../../../data/requests/auth/login_by_social_token_request.dart';

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

  RegisterModel registerBySocialTokenModel = RegisterModel();

  void userRegisterBySocialToken({
    required String socialToken,
    required String? email,
    required String? name,
    required String phone,
    required String image,
  }) {
    RegisterBySocialTokenRequest()
        .registerBySocialTokenRequest(
            email: email,
            name: name,
            phone: phone,
            socialToken: socialToken,
            image: image)
        .then((value) => (value) {
              printTest('sdasdasdasdasdasdasd');
              registerBySocialTokenModel = value;
              if (value.status == 200) {
                apiToken = registerBySocialTokenModel.account.apiToken;
                CacheHelper.saveDataToSP(
                    key: SharedPreferencesKeys.SP_API_TOKEN_KEY,
                    value: apiToken);
                CacheHelper.saveDataToSP(
                    key: SharedPreferencesKeys.SP_ACCOUNT_TYPE_KEY,
                    value: registerBySocialTokenModel.account.type);
                CacheHelper.saveDataToSP(
                    key: SharedPreferencesKeys.SP_ACCOUNT_NAME_KEY,
                    value: registerBySocialTokenModel.account.name);
                CacheHelper.saveDataToSP(
                    key: SharedPreferencesKeys.SP_ACCOUNT_PHONE_KEY,
                    value: registerBySocialTokenModel.account.phone);
                CacheHelper.saveDataToSP(
                    key: SharedPreferencesKeys.SP_ACCOUNT_E_MAIL,
                    value: registerBySocialTokenModel.account.email);
                emit(UserRegisterBySocialTokenSuccessState());
              } else {
                emit(UserRegisterBySocialTokenErrorState(
                    registerBySocialTokenModel.message));
              }
            })
        .catchError((error) {
      printResponse('userRegisterBySocialToken' + error.toString());
    });
  }

  //////////////////////////////////// Validate Code ////////////////////////////////////

  ValidateCodeModel validateCodeModel = ValidateCodeModel();

  void userValidateCode({
    required String phone,
    required String code,
  }) {
    emit(UserValidateCodeLoadingState());
    ValidateCodeRequest.validateCodeRequest(phone: phone, code: code)
        .then((value) => (value) {
              validateCodeModel = value;
              if (value.status == 200) {
                apiToken = validateCodeModel.account.apiToken;
                CacheHelper.saveDataToSP(
                    key: SharedPreferencesKeys.SP_API_TOKEN_KEY,
                    value: apiToken);
                CacheHelper.saveDataToSP(
                    key: SharedPreferencesKeys.SP_ACCOUNT_TYPE_KEY,
                    value: validateCodeModel.account.type);
                CacheHelper.saveDataToSP(
                    key: SharedPreferencesKeys.SP_ACCOUNT_NAME_KEY,
                    value: validateCodeModel.account.name);
                CacheHelper.saveDataToSP(
                    key: SharedPreferencesKeys.SP_ACCOUNT_PHONE_KEY,
                    value: validateCodeModel.account.phone);
                CacheHelper.saveDataToSP(
                    key: SharedPreferencesKeys.SP_ACCOUNT_E_MAIL,
                    value: validateCodeModel.account.email);
                emit(UserValidateCodeSuccessState(validateCodeModel.message));
              } else {
                emit(UserValidateCodeErrorState(validateCodeModel.message));
              }
            })
        .catchError((error) {
      printResponse('userValidateCode' + error.toString());
    });
  }

  //////////////////////////////////// Login ////////////////////////////////////

  LoginModel userLoginModel = LoginModel();

  void userLogin({
    required String phone,
    required String password,
  }) {
    emit(UserLoginLoadingState());
    LoginRequest.loginRequest(password: password, phone: phone).then((value) {
      userLoginModel = value;
      if (value.status == 200) {
        apiToken =value.account.apiToken;
        CacheHelper.saveDataToSP(
            key: SharedPreferencesKeys.SP_API_TOKEN_KEY, value: apiToken);

        CacheHelper.saveDataToSP(
            key: SharedPreferencesKeys.SP_ACCOUNT_TYPE_KEY,
            value: userLoginModel.account?.type);
        CacheHelper.saveDataToSP(
            key: SharedPreferencesKeys.SP_ACCOUNT_NAME_KEY,
            value: userLoginModel.account?.name);
        CacheHelper.saveDataToSP(
            key: SharedPreferencesKeys.SP_ACCOUNT_PHONE_KEY,
            value: userLoginModel.account?.phone);
        CacheHelper.saveDataToSP(
            key: SharedPreferencesKeys.SP_ACCOUNT_E_MAIL,
            value: userLoginModel.account?.email);

        emit(UserLoginSuccessState(userLoginModel.message.toString()));
      } else {
        emit(UserLoginErrorState(userLoginModel.message.toString()));
      }
    }).catchError((error) {
      printResponse('UserLogin' + error.toString());
    });
  }

  //////////////////////////////////// SocialLogin ////////////////////////////////////

  LoginModel userSocialLoginModel = LoginModel();

  void userSocialLogin({
    required String? name,
    required String phone,
    required String? image,
    required String? email,
    required String socialToken,
  }) {
    emit(UserSocialLoginLoadingState());
    LoginBySocialTokenRequest()
        .loginBySocialTokenRequest(
            name: name,
            phone: phone,
            image: image,
            email: email,
            socialToken: socialToken)
        .then((value) {
      userSocialLoginModel = value;
      printTest('value'+ value.status.toString());

      if (value.status == 200) {
        apiToken = userSocialLoginModel.account?.apiToken;
        CacheHelper.saveDataToSP(
            key: SharedPreferencesKeys.SP_API_TOKEN_KEY, value: apiToken);
        printTest(userSocialLoginModel.account!.apiToken.toString());

        CacheHelper.saveDataToSP(
            key: SharedPreferencesKeys.SP_ACCOUNT_TYPE_KEY,
            value: userSocialLoginModel.account?.type);
        CacheHelper.saveDataToSP(
            key: SharedPreferencesKeys.SP_ACCOUNT_NAME_KEY,
            value: userSocialLoginModel.account?.name);
        CacheHelper.saveDataToSP(
            key: SharedPreferencesKeys.SP_ACCOUNT_PHONE_KEY,
            value: userSocialLoginModel.account?.phone);
        CacheHelper.saveDataToSP(
            key: SharedPreferencesKeys.SP_ACCOUNT_E_MAIL,
            value: userSocialLoginModel.account?.email);

        emit(UserSocialLoginSuccessState());
      } else {
        emit(
            UserSocialLoginErrorState(userSocialLoginModel.message.toString()));
      }
    }).catchError((error) {
      printResponse('userSocialLogin' + error.toString());
    });
  }

  //////////////////////////////////// Logout ////////////////////////////////////

  LogoutModel? userLogoutModel;

  userLogout() {
    emit(UserLogoutLoadingState());
    LogoutRequest.logoutRequest()
        .then((value) => (value) {
              userLogoutModel = value;
              if (userLogoutModel?.status.toString() == '200') {
                CacheHelper.sharedPreferences.clear();
                emit(UserLogoutSuccessState());
              } else {
                CacheHelper.sharedPreferences.clear();
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

  signInWithFacebook(String phone) async {
    emit(UserSocialAuthLoadingState());
    final fb = FacebookLogin();
    final res = await fb.logIn(permissions: [
      FacebookPermission.publicProfile,
      FacebookPermission.email,
    ]);

    switch (res.status) {
      case FacebookLoginStatus.success:
        // Send access token to server for validation and auth

        final FacebookAccessToken? accessToken = res.accessToken;
        // final AuthCredential authCredential = FacebookAuth.credential(accessToken.token);
        final AuthCredential authCredential =
            FacebookAuthProvider.credential(accessToken!.token.toString());
        final result =
            await FirebaseAuth.instance.signInWithCredential(authCredential);
        // Get profile data from facebook for use in the app
        final profile = await fb.getUserProfile();

        printTest('Hello, ${profile!.name}! You ID: ${profile.userId}');
        // Get user profile image url
        final imageUrl = await fb.getProfileImageUrl(width: 100);
        printTest('Your profile image: $imageUrl');
        // fetch user email
        final email = await fb.getUserEmail();
        // But user can decline permission
        await CacheHelper.saveDataToSP(
            key: SharedPreferencesKeys.SP_FACEBOOK_ACCESS_TOKEN_KEY,
            value: accessToken.token);
        printTest('And your email is $email');
        emit(UserSocialAuthSuccessState(
            socialToken: accessToken.token,
            name: profile.name,
            email: email,
            urlImage: imageUrl,phone: phone));
        break;
      case FacebookLoginStatus.cancel:
        // In case the user cancels the login process
        break;
      case FacebookLoginStatus.error:
        // Login procedure failed
        emit(UserSocialAuthErrorState());
        printTest('Error while log in: ${res.error}');
        break;
    }
  }

  Future<UserCredential> signInWithGoogle(String phone) async {
    emit(UserSocialAuthLoadingState());
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
      emit(UserSocialAuthSuccessState(
          socialToken: credential.accessToken!,
          email: googleUser.email,
          name: googleUser.displayName,
          urlImage: googleUser.photoUrl,phone: phone));
    } else {
      emit(UserSocialAuthErrorState());
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
