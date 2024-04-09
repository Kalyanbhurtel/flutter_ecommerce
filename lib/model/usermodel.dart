class UserModel {
  final String id;
  final String username;
  final String email;
  // Add more properties as needed
  
  UserModel({
    required this.id,
    required this.username,
    required this.email,
    // Add more named parameters for additional properties
  });

  // Factory constructor to create a UserModel instance from a JSON object
  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['id'],
      username: json['username'],
      email: json['email'],
      // Map other properties from JSON as needed
    );
  }

  // Method to convert UserModel instance to a JSON object
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'username': username,
      'email': email,
      // Add other properties to be converted to JSON as needed
    };
  }
}
