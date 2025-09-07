enum SocialAuthType {
  google,
  facebook,
  signupWithEmailAndPassword,
  loginWithEmailAndPassword,
  resetPassword,
}

class AuthModal {
  const AuthModal({
    required this.type,
    this.email,
    this.password,
  });
  final SocialAuthType type;
  final String? email;
  final String? password;
}
