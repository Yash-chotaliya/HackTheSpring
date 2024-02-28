class EmployeeDetailsModel{
  String mobileNumber;
  String name;
  String employeeId;
  String email;
  String lastlogin;
  String photo;
  String password;

  EmployeeDetailsModel({
    required this.employeeId,
    required this.email,
    required this.lastlogin,
    required this.mobileNumber,
    required this.name,
    required this.photo,
    required this.password
  });

  toMap(){
    return {
      "employeeId":employeeId,
      "name":name,
      "email":email,
      "mobileNumber":mobileNumber,
      "lastlogin":lastlogin,
      "photo":photo,
      "password":password
    };
  }
}

class EmployeeSalaryModel{
  String salaryId;
  int allowance;
  int basicSalary;
  int bonus;
  int ctc;
  int deduction;
  int inHand;
  int daysLeft;
  String month;
  int year;
  String status;
  int expense;

  EmployeeSalaryModel({
    required this.salaryId,
    required this.allowance,
    required this.basicSalary,
    required this.bonus,
    required this.ctc,
    required this.deduction,
    required this.inHand,
    required this.daysLeft,
    required this.month,
    required this.year,
    required this.status,
    required this.expense,
  });

  toMap(){
    return {
      "salaryId": salaryId,
      "allowance": allowance,
      "basicSalary": basicSalary,
      "bonus": bonus,
      "ctc": ctc,
      "deduction":deduction,
      "inHand": inHand,
      "month": month,
      "year": year,
      "daysLeft": daysLeft,
      "status": status,
      "expense": expense,
    };
  }
}

class EmployeeExpenseModel{
  String expenseId;
  int amount;
  String purpose;
  String photo;
  String status;
  String time;
  String vehicleNumber;

  EmployeeExpenseModel({
    required this.expenseId,
    required this.amount,
    required this.purpose,
    required this.photo,
    required this.status,
    required this.time,
    required this.vehicleNumber
  });

  toMap(){
    return {
      "expenseId": expenseId,
      "amount":amount,
      "purpose":purpose,
      "photo":photo,
      "status":status,
      "time":time,
      "vehicleNumber":vehicleNumber
    };
  }
}

class EmployeeAdvanceModel{
  final String advanceId;
  final int amount;
  final String purpose;
  final String issuedDate;

  EmployeeAdvanceModel({
    required this.advanceId,
    required this.amount,
    required this.purpose,
    required this.issuedDate
  });

  toMap(){
    return {
      "advanceId": advanceId,
      "amount": amount,
      "purpose": purpose,
      "issuedDate": issuedDate
    };
  }
}

class EmployeeRecentActivityModel{
  final String activityId;
  final String time;
  final String feature;
  final String status;

  EmployeeRecentActivityModel({
    required this.activityId,
    required this.time,
    required this.feature,
    required this.status
  });

  toMap(){
    return {
      "activityId": activityId,
      "time": time,
      "feature": feature,
      "status": status
    };
  }
}