import 'package:detective_academy/view/login_screen/login_screen.dart';
import 'package:flutter/material.dart';
import '../colors/app_colors.dart';

class CustomAppBar extends StatelessWidget
    implements PreferredSizeWidget {
  final String title;
  final VoidCallback? onMenuPressed;
  final VoidCallback? onLogoPressed;
  final bool showMenu;

  const CustomAppBar({
    super.key,
    required this.title,
    this.onMenuPressed,
    this.onLogoPressed,
    this.showMenu = true,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0,
      scrolledUnderElevation: 0,
      backgroundColor: const Color(0xFF1D170D),

      leadingWidth: 70,

      leading: Padding(
        padding: const EdgeInsets.only(left: 16),
          child: Image.asset("assets/images/logo.png"),
       ),

      title: Text(
        title,
        style: const TextStyle(
          color: AppColors.primary,
          fontSize: 28,
          fontWeight: FontWeight.bold,
        ),
      ),

      actions: showMenu
          ? [
        IconButton(
          onPressed: (){
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (_) => LoginScreen(),
              ),
            );
          },
          icon: const Icon(
            Icons.person_2_outlined,
            color: AppColors.primary,
            size: 32,
          ),
        ),
        const SizedBox(width: 8),
      ]
          : [],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}