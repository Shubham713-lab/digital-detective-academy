import '../model/profile_model.dart';

class ProfileViewModel {
  final profile = ProfileModel(
    name: "Agent Smith",
    designation: "Senior Investigator",
    image: "assets/images/profile.jpg",
    solvedCases: 12,
    accuracy: 94,
    rank: "Gold Sleuth",
  );
}