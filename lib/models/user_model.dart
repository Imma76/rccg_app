class UserModel{


  String? email;
  String? firstName;
  String? lastName;


  DateTime? createdAt;
  String? userId;

  UserModel({this.email,this.lastName,this.userId,this.firstName,this.createdAt,});

  UserModel.fromJson(Map<dynamic,dynamic> data){

    email=data['email'];
    firstName=data['firstName'];
    lastName=data['lastName'];
    createdAt=data['createdAt'].toDate();
    userId=data['userId'];
  }

  toJson(){
    Map<String,dynamic> data=<String, dynamic>{};

    data['email']=email;
    data['firstName']=firstName;
    data['lastName']=lastName;

    data['userId']=userId;
    data['createdAt']=createdAt;
    return data;
  }
}