class ProfileModel {
  final String name;
  final String email;
  final String designation;
  final String image;
  final int solvedCases;
  final int accuracy;
  final String rank;

  ProfileModel({
    required this.name,
    required this.email,
    required this.designation,
    required this.image,
    required this.solvedCases,
    required this.accuracy,
    required this.rank,
  });
}