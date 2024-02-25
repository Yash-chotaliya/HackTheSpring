class EmployeeDetailsModel{
  String mobileNumber;
  String name;
  String employeeId;
  String email;
  String lastlogin;
  String photo;

  EmployeeDetailsModel({
    required this.employeeId,
    required this.email,
    required this.lastlogin,
    required this.mobileNumber,
    required this.name,
    required this.photo
  });

  toMap(){
    return {
      "employeeId":employeeId,
      "name":name,
      "email":email,
      "mobileNumber":mobileNumber,
      "lastlogin":lastlogin,
      "photo":photo
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