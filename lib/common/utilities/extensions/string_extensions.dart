extension InputValidation on String {
  /// Adds space every three digits for numbers.
  String spaceSeparateNumbers() {
    return replaceAllMapped(RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'), (match) => '${match[1]} ');
  }

  /// Validates if the string is a correct phone number.
  String? isCorrectPhoneNumber({required String errorMessage}) {
    if (isEmpty) return null;
    if (!RegExp(r"^[+]*[(]?[0-9]{1,4}[)]?[-\s/0-9]*$").hasMatch(this)) {
      return errorMessage;
    }
    return null;
  }

  /// Validates if the string is a correct email address.
  String? isCorrectEmailAddress({required String errorMessage}) {
    if (isEmpty) return null;
    if (!RegExp(r'^[^@]+@[^@]+\.[^@]+$').hasMatch(this)) {
      return errorMessage;
    }
    return null;
  }

  /// Ensures the string is not empty.
  String? cannotBeEmpty({required String errorMessage}) {
    if (isEmpty) {
      return errorMessage;
    }
    return null;
  }

  /// Validates if the string is a valid price.
  String? isValidPrice() {
    if (isEmpty) return null;
    try {
      double.parse(this);
      return null;
    } catch (e) {
      return "Please enter a valid price.";
    }
  }

  /// Validates if the string contains only alphabets.
  String? isAlphabetic({required String errorMessage}) {
    if (!RegExp(r"^[a-zA-Z\s]+$").hasMatch(this)) {
      return errorMessage;
    }
    return null;
  }

  /// Validates if the string contains only alphanumeric characters.
  String? isAlphanumeric({required String errorMessage}) {
    if (!RegExp(r"^[a-zA-Z0-9\s]+$").hasMatch(this)) {
      return errorMessage;
    }
    return null;
  }

  /// Validates if the string is a valid password.
  /// Password must be at least 8 characters long and contain a mix of letters, numbers, and special characters.
  String? isValidPassword({required String errorMessage}) {
    if (!RegExp(r"^(?=.*[A-Za-z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{8,}$").hasMatch(this)) {
      return errorMessage;
    }
    return null;
  }

  /// Validates if the string is a valid URL.
  String? isCorrectURL() {
    if (isEmpty) return null;
    if (!Uri.parse(this).isAbsolute) {
      return "Enter a valid URL.";
    }
    return null;
  }

  /// Validates if the string is a valid ZIP code.
  String? isCorrectZip({required String errorMessage}) {
    if (!RegExp(r"^\d{5}(-\d{4})?$").hasMatch(this)) {
      return errorMessage;
    }
    return null;
  }

  /// Validates if the string is a valid date (YYYY-MM-DD format).
  String? isValidDate({required String errorMessage}) {
    if (!RegExp(r"^\d{4}-\d{2}-\d{2}$").hasMatch(this)) {
      return errorMessage;
    }
    return null;
  }

  /// Validates if the string is a positive integer.
  String? isPositiveInteger({required String errorMessage}) {
    if (!RegExp(r"^\d+$").hasMatch(this)) {
      return errorMessage;
    }
    return null;
  }

  /// Validates if the string is a decimal number.
  String? isDecimal({required String errorMessage}) {
    if (!RegExp(r"^\d+(\.\d+)?$").hasMatch(this)) {
      return errorMessage;
    }
    return null;
  }

  /// Capitalizes the first letter of the string.
  String capitalizeFirstLetter() {
    if (isEmpty) return this;
    return this[0].toUpperCase() + substring(1);
  }
}
