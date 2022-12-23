validInput(String val, int min, int max, String str) {
  if (val.isEmpty) {
    return "Can't be empty";
  }
  RegExp emailReg = RegExp(
      r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
  RegExp phoneReg = RegExp(r"[05][69][23456789][0-9]{6}$");
  switch (str) {
    case "email":
      {
        if (!emailReg.hasMatch(val)) {
          return "Invalid Email, please check it again";
        }
      }
      break;
    case "name":
      {
        if (val.length < min) {
          return "$min letters at least";
        }
        if (val.length > max) {
          return "more than $max letters";
        }
      }
      break;

    case "phone":
      {
        if (val.length > 10) {
          return "Invalid phone number, please check that have 9 digits";
        }
        if (!phoneReg.hasMatch(val)) {
          return "Invalid phone number,please check that number start with 059[2:9],056[2:9] and have only digits";
        }
      }
      break;
    case "password":
      {
        if (val.length < min) {
          return "Should be $min letters at least";
        }
        if (val.length > max) {
          return "Should be less than $max letters";
        }
      }
      break;
  }
}
