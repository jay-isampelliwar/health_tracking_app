import 'package:hive/hive.dart';

class Helper {
  static final localDatabase = Hive.box("localData");
  static final goal = Hive.box("goals");
  static String getGreeting() {
    int hour = DateTime.now().hour;

    if (hour >= 5 && hour < 12) {
      return 'Good morning';
    } else if (hour >= 12 && hour < 18) {
      return 'Good afternoon';
    } else {
      return 'Good evening';
    }
  }

  static String? emailValidator(String? val) {
    if (val!.isEmpty) return "Required";
    RegExp emailRegex = RegExp(
        r"^[a-zA-Z0-9.!#$%&\'*+/=?^_`{|}~-]+@[a-zA-Z0-9-]+(?:\.[a-zA-Z0-9-]+)*$");

    return emailRegex.hasMatch(val) ? null : "Invalid Email!";
  }

  static String? passwordValidator(String? password) {
    if (password!.isEmpty) return "Required";
    if (password.length < 8) {
      return "Required 8 or more than 8 letter password";
    }

    // Check if password contains at least one uppercase letter
    if (password.toUpperCase() == password) {
      return "At least one lower case character required";
    }

    // Check if password contains at least one lowercase letter
    if (password.toLowerCase() == password) {
      return "At least one upper case character required";
    }

    // Check if password contains at least one digit
    if (!password.contains(RegExp(r'\d'))) {
      return "At least one digit required";
    }

    // Check if password contains at least one special character
    if (!password.contains(RegExp(r'[!@#\$%\^&\*()_\+\-\={}<>\?,\.\/~`|\\]'))) {
      return "At least one special character required";
    }

    return null;
  }

  static String? numberValidator(String? val) {
    if (val!.isEmpty) return "Required";
    RegExp phoneRegex = RegExp(r'^[6-9]\d{9}$');

    return phoneRegex.hasMatch(val) ? null : "Please enter valid number";
  }

  static String? nameValidator(String? name) {
    if (name!.isEmpty) return "Required";
    if (name.split(" ").length == 1) return "Enter Name and Surname";
    RegExp nameRegex = RegExp(r'^[a-zA-Z\s]+$');

    return nameRegex.hasMatch(name) ? null : "Invalid Name";
  }

  static String? otpValidator(String? val) {
    if (val!.isEmpty) return "Required";
    if (val.length != 6) {
      return "OTP Must be 6 Digit number";
    }

    final regex = RegExp(r'^[0-9]+$');
    if (!regex.hasMatch(val)) {
      return "Please Enter valid OTP";
    }
    return null;
  }

  static double calcCaloriesBurned(double steps) {
    double caloriesPerStep =
        0.05 * double.parse(localDatabase.get("weight")) / 2000;
    double caloriesBurned = steps * caloriesPerStep;
    return caloriesBurned;
  }

  static String getWaterLiter(int water) {
    double calculate = water * 0.25;
    return calculate.toStringAsFixed(2);
  }

  static double getWaterValue() {
    int liters = int.parse(goal.get("water") ?? 0);
    double val = 0.99 / (liters / 0.25);
    int numberOfGlasses = localDatabase.get("glassWater") ?? 0;
    return numberOfGlasses * val;
  }

  static double getWaterValueOnStats(int numberOfGlasses) {
    int liters = int.parse(goal.get("water") ?? 0);
    double val = 0.99 / (liters / 0.25);

    return numberOfGlasses * val;
  }

  static String getBMIValue(String height, String weight) {
    double inMeter = double.parse(height) / 100;
    double bmi = double.parse(weight) / (inMeter * inMeter);
    return bmi.toStringAsFixed(2);
  }

  static getSteps(double d) {
    return d.toStringAsFixed(0);
  }

  static double getDistance(double steps) {
    double stepLength = 0.762;
    double distance = steps * stepLength / 1000;
    return distance;
  }

  static double calculatePoints(double steps, double caloriesBurned) {
    int stepPoints = (steps / 500).floor();
    int caloriePoints = (caloriesBurned / 10).floor();
    int totalPoints = stepPoints + caloriePoints;
    return totalPoints + 0.0;
  }

  static String getMonth(int num) {
    switch (num) {
      case 1:
        return 'Jan';
      case 2:
        return 'Feb';
      case 3:
        return 'Mar';
      case 4:
        return 'Apr';
      case 5:
        return 'May';
      case 6:
        return 'Jun';
      case 7:
        return 'Jul';
      case 8:
        return 'Aug';
      case 9:
        return 'Sep';
      case 10:
        return 'Oct';
      case 11:
        return 'Nov';
      case 12:
        return 'Dec';
      default:
        return 'Invalid month number. Please enter a number between 1 and 12.';
    }
  }
}
