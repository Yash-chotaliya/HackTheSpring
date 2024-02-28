class EmployerAdvanceModel{
  String employeeId;
  String advanceId;
  int amount;
  String purpose;
  String issuedDate;

  EmployerAdvanceModel({
    required this.employeeId,
    required this.advanceId,
    required this.amount,
    required this.purpose,
    required this.issuedDate
  });

  toMap(){
    return {
      "employeeId": employeeId,
      "advanceId": advanceId,
      "amount": amount,
      "purpose": purpose,
      "issuedDate": issuedDate
    };
  }
}

class EmployerExpenseModel{
  String employeeId;
  String expenseId;
  int amount;
  String purpose;
  String photo;
  String status;
  String time;
  String vehicleNumber;

  EmployerExpenseModel({
    required this.employeeId,
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
      "employeeId": employeeId,
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