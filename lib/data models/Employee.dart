class EmployeeDetails{
  String mobileNumber;
  String name;
  String employeeId;
  String email;
  String lastlogin;
  String photo;

  EmployeeDetails({
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