class AuthFormValidations {
  static String? formValidator(value) {
    if (value == null || value.isEmpty) {
      return 'Campo não pode ser vazio';
    }
    return null;
  }
}
