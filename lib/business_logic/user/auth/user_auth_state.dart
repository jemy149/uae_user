part of 'user_auth_cubit.dart';

@immutable
abstract class UserAuthStates {}

class UserAuthInitial extends UserAuthStates {}

class UserLoginLoadingState extends UserAuthStates {}

class UserLoginSuccessState extends UserAuthStates {}

class UserLoginErrorState extends UserAuthStates {
  final String? message;
  UserLoginErrorState(this.message);
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

class UserResetPasswordLoadingState extends UserAuthStates{}

class UserResetPasswordSuccessState extends UserAuthStates{}

class UserResetPasswordErrorState extends UserAuthStates{

}

class UserResendCodeLoadingState extends UserAuthStates{}

class UserResendCodeSuccessState extends UserAuthStates{}

class UserResendCodeErrorState extends UserAuthStates{

}


class UserSocialAuthLoadingState extends UserAuthStates{}

class UserSocialAuthSuccessState extends UserAuthStates{}

class UserSocialAuthErrorState extends UserAuthStates{

}