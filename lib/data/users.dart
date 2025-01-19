class User {
  final String email;
  final String fullName;
  final String password;
  String get getEmail {
    return email;
  }

  String get getPassword {
    return password;
  }

  const User(
      {required this.email, required this.fullName, required this.password});
}

class UserData {
  final String email;
  final String pwd;
  UserData(this.email, this.pwd);
}

List<User> listOfUsers() {
  return [
    const User(
        email: 'john.doe@example.com',
        fullName: 'John Doe',
        password: 'Password123@'),
    const User(
        email: 'jane.smith@example.com',
        fullName: 'Jane Smith',
        password: 'secret'),
    const User(
        email: 'david.lee@example.com',
        fullName: 'David Lee',
        password: 'pass456'),
  ];
}
