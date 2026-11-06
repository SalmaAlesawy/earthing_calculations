class Validators {
  static String? validateName(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'name is required';
    }
    if (value.trim().length < 3) {
      return 'Name must be at least 3 characters';
    }
    return null;
  }

  static String? validateTestBy(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Test by is required';
    }
    if (value.trim().length < 3) {
      return 'Please enter a valid name';
    }
    return null;
  }

  static String? validateLocation(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Location is required';
    }
    return null;
  }

  static String? validator(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'This Field is required';
    }
    return null;
  }

  static String? generalValidate(String? value, String fieldName) {
    if (value == null || value.trim().isEmpty) {
      return '$fieldName is required';
    }

    final number = double.tryParse(value);

    if (number == null) {
      return 'Enter a valid number';
    }

    if (number <= 0) {
      return '$fieldName must be greater than 0';
    }

    return null;
  }

  static String? validateEmail(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Please enter your email';
    }

    final emailRegex = RegExp(r'^[\w.+-]+@[\w-]+(\.[\w-]+)+$');

    if (!emailRegex.hasMatch(value.trim())) {
      return 'Please enter a valid email';
    }

    return null;
  }

  static String? validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your password';
    }

    if (value.length < 8) {
      return 'Password must be at least 8 characters';
    }

    return null;
  }

  static String? validateConfirmPassword(String? value, String password) {
    if (value == null || value.isEmpty) {
      return 'Please confirm your password';
    }

    if (value != password) {
      return 'Passwords do not match';
    }

    return null;
  }
}
