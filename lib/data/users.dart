class User {
  final String email;
  final String password;

  const User({required this.email, required this.password});
  @override
  String toString() {
    return 'User(email: $email, password: $password)';
  }
}

List<User> listOfUsers() {
  return [
    const User(email: 'user1@example.com', password: 'password123'),
    const User(email: 'user2@example.com', password: 'secret'),
    const User(email: 'admin@example.com', password: 'admin'),
    const User(email: 'john.doe@example.com', password: 'pass'),
    const User(email: 'jane.smith@example.com', password: '12345'),
  ];
}
