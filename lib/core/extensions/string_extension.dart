extension StringExtensions on String {
  String get capitalizeFirst {
    if (isEmpty) return this;
    return '${this[0].toUpperCase()}${substring(1)}';
  }

  (bool, String) get isUserName {
    final regex = RegExp(r'^[a-zA-Z0-9._@]{3,20}$');

    if (!regex.hasMatch(this)) {
      return (false, "User name required ");
    }

    if (!contains(RegExp(r'[!@#$%^&*(),.?":{}|<>]'))) {
      return (false, 'Username must contain at least one special character.');
    }

    if (startsWith(RegExp(r'[!@#$%^&*(),.?":{}|<>]_')) ||
        startsWith('_') ||
        endsWith('.') ||
        endsWith('_')) {
      return (
        false,
        'Username must not start or end with any special charecter'
      );
    }

    return (true, "Username valid");
  }

  (bool, String) get isPassword {
    if (!contains(RegExp(r'[A-Z]'))) {
      return (false, 'Password must contain at least one uppercase letter.');
    }

    if (!contains(RegExp(r'[!@#$%^&*(),.?":{}|<>]'))) {
      return (false, 'Password must contain at least one special character.');
    }

    if (!contains(RegExp(r'\d'))) {
      return (false, 'Password must contain at least one number.');
    }

    if (length < 6 || length > 20) {
      return (false, 'Password length must be between 6 and 20 characters.');
    }

    return (true, 'Password is valid.');
  }
}
