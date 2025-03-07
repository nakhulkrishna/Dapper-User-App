class AppValidations {
  //* Username validation
  static String? validateUsername(String username) {
    RegExp regExp =
        RegExp(r'^[a-zA-Z0-9](?!.*__)[a-zA-Z0-9_]{1,13}[a-zA-Z0-9]$');

    if (username.isEmpty) {
      return 'Username cannot be empty';
    } else if (!regExp.hasMatch(username)) {
      return 'Username must be 3-15 characters, no special symbols at start or end, and no consecutive underscores';
    }
    return null;
  }

  //* Password validation
  static String? validatePassword(String password) {
    //* Regular expression to check the password requirements
    RegExp regExp =
        RegExp(r'^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[!@#\$&*~]).{8,}$');

    if (password.isEmpty) {
      return 'Password cannot be empty';
    } else if (!regExp.hasMatch(password)) {
      return 'Password must be at least 8 characters, include an uppercase letter, lowercase letter, number, and special character';
    }
    return null;
  }

  //* Email validation
  static String? validateEmail(String email) {
    //* Regular expression for a valid email address
    RegExp regExp = RegExp(r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$');

    if (email.isEmpty) {
      return 'Email cannot be empty';
    } else if (!regExp.hasMatch(email)) {
      return 'Enter a valid email address';
    }
    return null;
  }
}
