part of 'core.dart';

class UiString {
  /// Common strings & regular expressions
  static final emailCharSet = RegExp(r"[a-zA-Z0-9.@!#$%&'*+/=?^_`{|}~-]");
  static final emailRegEx = RegExp(
    r"^((([a-z]|\d|[!#\$%&'\*\+\-\/=\?\^_`{\|}~]|"
    r"[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])+"
    r"(\.([a-z]|\d|[!#\$%&'\*\+\-\/=\?\^_`{\|}~]|"
    r"[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])+)*)|"
    r"((\x22)((((\x20|\x09)*(\x0d\x0a))?(\x20|\x09)+)?"
    r"(([\x01-\x08\x0b\x0c\x0e-\x1f\x7f]|\x21|[\x23-\x5b]"
    r"|[\x5d-\x7e]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])"
    r"|(\\([\x01-\x09\x0b\x0c\x0d-\x7f]|"
    r"[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF]))))*"
    r"(((\x20|\x09)*(\x0d\x0a))?(\x20|\x09)+)?(\x22)))"
    r"@((([a-z]|\d|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|"
    r"(([a-z]|\d|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])"
    r"([a-z]|\d|-|\.|_|~|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])*"
    r"([a-z]|\d|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])))\.)"
    r"+(([a-z]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(([a-z]"
    r"|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])([a-z]|\d|-|\.|_|~|"
    r"[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])*([a-z]|"
    r"[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])))$",
  );
  static final nameRegEx = RegExp('[a-z A-Z]');
  static final numberRegEx = RegExp('[0-9]');
  static final normalizationRegEx = RegExp('-|_');
  static const space = ' ';
  static const error = 'Something went wrong !';
  static const nothingFound = 'No data found !';
  static const noJobsYet = 'No Jobs Yet !';
  static const noInternet = 'No internet !';
  static const pageNotFound = 'Page not found';
  static const charSet =
      '0123456789ABCDEFGHIJKLMNOPQRSTUVXYZabcdefghijklmnopqrstuvwxyz-._';

  /// Splash view
  static const appMotto = 'Find help near you';

  /// Onboarding flow
  static const skipBtn = 'Skip';
  static const googleBtn = 'Sign in with Google';
  static const facebookBtn = 'Sign in with Facebook';
  static const appleBtn = 'Sign in with Apple';
  static const emailChoice = 'Or continue with Email';
  static const getStartedText = 'Get Started';
  static const signInText = 'Sign in';
  static const forgotPasswordText = 'Forgot Password?';
  static const signInCaptionText = 'Create a New Account? ';
  static const signUpText = 'Sign up';
  static const signUpCaptionText = 'Already have an Account? ';
  static const emailBtn = 'Sign in with Email';
  static const emailText = 'Email Address';
  static const firstNameText = 'First Name';
  static const lastNameText = 'Last Name';
  static const addressText = 'Address';
  static const addressHintText = 'Your address';
  static const passwordText = 'Password';
  static const passwordHintText = 'Your password';
  static const confirmPasswordText = 'Confirm Password';
  static const confirmPasswordHintText = 'Confirm password';
  static const confirmText = 'Confirm';
  static const documentVerifyText = 'We need to verify your ID';
  static const documentVerifyActionDescription =
      'Select the type of document you wish to attach';
  static const selectDocument = 'Select Document';
  static const selectFile = 'Select File';
  static const selectBackImage = 'Select Back Image';
  static const selectFrontImage = 'Select Front Image';
  static const verifyText = 'Verify';
  static const emailRequired = 'Email is required !';
  static const validEmailRequired = 'Valid Email is required !';
  static const firstNameRequired = 'First Name is required !';
  static const lastNameRequired = 'Last Name is required !';
  static const addressRequired = 'Address is required !';
  static const phoneRequired = 'Phone is required !';
  static const validPhoneNumberRequired = 'Valid phone number required !';
  static const passwordRequired = 'Password is required !';
  static const confirmationRequired = 'Confirmation is required !';
  static const passwordMismatch = 'Password mismatch !';
  static const restartApp = 'Please restart the app !';
  static const userExistsOnMail =
      'User already exists.\nPlease sign in using Email !';
  static const authenticationError =
      'Could not authenticate the user.\nPlease contact support !';
  static const weakPasswordError = 'The password provided is too short.';
  static const accountInUseError = 'The account already exists for that email.';
  static const noUserFound = 'No User for this email ! Please sign up !';
  static const signInCancelled = 'Sign in was cancelled';
  static const appleLoginError = 'Apple Login is not available';
}
