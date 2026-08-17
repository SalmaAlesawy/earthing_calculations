class Validators {
 static String? validateName(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Project name is required';
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

 static String? validateTestDate(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Test date is required';
    }
    return null;
  }
static String? validateNumber(String? value, String fieldName) {
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
}
