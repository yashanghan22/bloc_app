abstract class SignInevent {}

class SignInTextChangedEvent extends SignInevent {
  final String emailValue;
  final String PasswordValue;
  SignInTextChangedEvent(this.emailValue, this.PasswordValue);
}

class SignIntextSubmittedEvent extends SignInevent {
  final String email;
  final String Password;
  SignIntextSubmittedEvent(this.email, this.Password);
}
