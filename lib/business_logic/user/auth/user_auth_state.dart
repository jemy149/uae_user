part of 'user_auth_cubit.dart';

@immutable
abstract class UserAuthStates {}

class UserAuthInitial extends UserAuthStates {}

class UserLoginLoadingState extends UserAuthStates {}

class UserLoginSuccessState extends UserAuthStates {
  final String? message;

  UserLoginSuccessState(this.message);
}

class UserLoginErrorState extends UserAuthStates {
  final String? message;

  UserLoginErrorState(this.message);
}

class UserSocialLoginLoadingState extends UserAuthStates {}

class UserSocialLoginSuccessState extends UserAuthStates {}

class UserSocialLoginErrorState extends UserAuthStates {
  final String? message;

  UserSocialLoginErrorState(this.message);
}

class UserRegisterLoadingState extends UserAuthStates {}

class UserRegisterSuccessState extends UserAuthStates {}

class UserRegisterErrorState extends UserAuthStates {
  final String? message;

  UserRegisterErrorState(this.message);
}

class UserRegisterBySocialTokenLoadingState extends UserAuthStates {}

class UserRegisterBySocialTokenSuccessState extends UserAuthStates {}

class UserRegisterBySocialTokenErrorState extends UserAuthStates {
  final String? message;

  UserRegisterBySocialTokenErrorState(this.message);
}

class UserValidateCodeLoadingState extends UserAuthStates {}

class UserValidateCodeSuccessState extends UserAuthStates {
  final String? message;

  UserValidateCodeSuccessState(this.message);
}

class UserValidateCodeErrorState extends UserAuthStates {
  final String? message;

  UserValidateCodeErrorState(this.message);
}

class UserRegisterResendConfirmationCodeLoadingState extends UserAuthStates {}

class UserRegisterResendConfirmationCodeSuccessState extends UserAuthStates {}

class UserRegisterResendConfirmationCodeErrorState extends UserAuthStates {
  final String? message;

  UserRegisterResendConfirmationCodeErrorState(this.message);
}

class UserLogoutLoadingState extends UserAuthStates {}

class UserLogoutSuccessState extends UserAuthStates {}

class UserLogoutErrorState extends UserAuthStates {
  UserLogoutErrorState();
}

class UserResetPasswordLoadingState extends UserAuthStates {}

class UserResetPasswordSuccessState extends UserAuthStates {}

class UserResetPasswordErrorState extends UserAuthStates {}

class UserResendCodeLoadingState extends UserAuthStates {}

class UserResendCodeSuccessState extends UserAuthStates {}

class UserResendCodeErrorState extends UserAuthStates {}

class UserSocialAuthLoadingState extends UserAuthStates {}

class UserSocialAuthSuccessState extends UserAuthStates {
  final String socialToken;
  final String? name;
  final String? email;
  final String? urlImage;
  final String phone;

  UserSocialAuthSuccessState( {
    required this.socialToken,
    required this.name,
    required this.email,
    required this.urlImage,
    required this.phone,
  });
}

class UserSocialAuthErrorState extends UserAuthStates {}
