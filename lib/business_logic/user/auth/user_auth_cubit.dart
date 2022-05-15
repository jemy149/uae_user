import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
import '../../../constants/constants.dart';
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
            key: SharedPreferencesKeys.SP_ACCESS_TOKEN_KEY, value: accessToken);
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
    ).then((value) => (value) {
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
}
