class GeneralValidation{
    static String? emptyValidation(String? value, String errormessage) {
    if (value!.isEmpty) {
      return errormessage;
    }
    return null;
  }
}