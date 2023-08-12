String? validateEmail(String? value) {
  if (value == null || value.isEmpty) {
    return 'This field is required';
  } else if (value.length > 50) {
    return "This field is too long (${value.length}/50)";
  } else if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w]{2,4}').hasMatch(value)) {
    return 'Please enter a valid email';
  }
  return null;
}

String? validatePhoneNumber(String? value) {
  if (value == null || value.isEmpty) {
    return 'This field is required';
  } else if (value.length > 25) {
    return "This field is too long (${value.length}/25)";
  } else if (!RegExp(r'^\+*[\d-\s]{10,25}').hasMatch(value)) {
    return 'Please enter a valid phone number';
  }
  return null;
}

String? validatePassword(String? value) {
  if (value != null && value.length > 6) {
    if (!RegExp(r'(?=.*[A-Z])(?=.*[a-z])(?=.*\d)(?=.*[_@$!%*?&])[A-Za-z\d_@$!%*?&]+$').hasMatch(value)) {
      return "Password must contain one from each A-Z, a-z, (@_\$!%*?&)";
    }
  } else {
    return 'Password must be at least 6 characters';
  }
  return null;
}

String? validateRequireField(String? value) {
  if (value == null || value.isEmpty) {
    return "This field is required";
  }
  return null;
}
