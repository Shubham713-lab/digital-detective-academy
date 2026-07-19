import '../model/activity_model.dart';

class DashboardViewModel {

  final int xp = 0;

  final int badges = 0;

  final int cases = 1;

  final activities = [

    ActivityModel(
      title: "Level 1",
      subtitle: "Initial Reconnaissance",
      status: "Completed",
    ),

    ActivityModel(
      title: "Level 2",
      subtitle: "Digital Footprint",
      status: "In Progress",
    ),

    ActivityModel(
      title: "Level 3",
      subtitle: "Encrypted Vault Access",
      status: "Locked",
    ),
  ];
}