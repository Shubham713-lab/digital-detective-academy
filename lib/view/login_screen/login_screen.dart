import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../navigation/navigation_screen.dart';
import '../../res/colors/app_colors.dart';
import '../../view_model/login/login_state.dart';
import '../../view_model/login/login_viewmodel.dart';
import '../signUp_screen/signUp_screen.dart';

class LoginScreen extends ConsumerStatefulWidget {
  const LoginScreen({super.key});

  @override
  ConsumerState<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends ConsumerState<LoginScreen> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController _emailController =
  TextEditingController();

  final TextEditingController _passwordController =
  TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void _showMessage(
      String message, {
        bool isError = true,
      }) {
    ScaffoldMessenger.of(context)
      ..clearSnackBars()
      ..showSnackBar(
        SnackBar(
          content: Text(message),
          backgroundColor:
          isError ? Colors.red : Colors.green,
          behavior: SnackBarBehavior.floating,
          margin: const EdgeInsets.only(
            left: 16,
            right: 16,
            top: 20,
          ),
        ),
      );
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(loginProvider);

    ref.listen<LoginState>(
      loginProvider,
          (previous, next) {
        if (next.errorMessage != null) {
          _showMessage(next.errorMessage!);

          ref.read(loginProvider.notifier).clearError();
        }

        if (next.successMessage != null) {
          _showMessage(
            next.successMessage!,
            isError: false,
          );

          ref.read(loginProvider.notifier).clearSuccess();

          Navigator.pushReplacement(
            context,
            PageRouteBuilder(
              pageBuilder: (_, __, ___) =>
               NavigationScreen(),
              transitionDuration: Duration.zero,
              reverseTransitionDuration: Duration.zero,
            ),
          );
        }
      },
    );

    return Scaffold(
        floatingActionButton: FloatingActionButton(
        backgroundColor: AppColors.primary,
        foregroundColor: AppColors.background,
        child: const FittedBox(
        child: Text(
        "Skip",
        style: TextStyle(
        color: AppColors.white,
        fontWeight: FontWeight.bold,
    ),
    ),
    ),
    onPressed: () {
    Navigator.pushReplacement(
    context,
    PageRouteBuilder(
    pageBuilder: (_, __, ___) =>
    NavigationScreen(),
    transitionDuration: Duration.zero,
    reverseTransitionDuration: Duration.zero,
    ),
    );
    },
    ),
    backgroundColor: AppColors.background,
    body: SafeArea(
    child: SingleChildScrollView(
    padding:
    const EdgeInsets.symmetric(horizontal: 24),
    child: Form(
    key: _formKey,
    child: Column(
    crossAxisAlignment:
    CrossAxisAlignment.center,
    children: [
    const SizedBox(height: 60),

    Center(
    child: Image.asset(
    "assets/images/logo.png",
    height: 150,
    width: 150,
    ),
    ),

    const SizedBox(height: 16),

    const Text(
    "Digital Detective Academy",
    style: TextStyle(
    color: AppColors.primary,
    fontSize: 22,
    fontWeight: FontWeight.bold,
    fontStyle: FontStyle.italic,
    ),
    ),

    const SizedBox(height: 32),

    const Text(
    "Login",
    style: TextStyle(
    color: AppColors.white,
    fontSize: 28,
    fontWeight: FontWeight.bold,
    ),
    ),

    const SizedBox(height: 40),
      _buildTextField(
        label: "EMAIL",
        hint: "agent@detectiveacademy.edu",
        controller: _emailController,
        icon: Icons.alternate_email,
        validator: (value) {
          if (value == null || value.trim().isEmpty) {
            return "Email cannot be empty";
          }

          final emailRegex = RegExp(
            r'^[\w\.-]+@([\w-]+\.)+[a-zA-Z]{2,}$',
          );

          if (!emailRegex.hasMatch(value.trim())) {
            return "Enter a valid email";
          }

          return null;
        },
      ),

      const SizedBox(height: 20),

      _buildTextField(
        label: "PASSWORD",
        hint: "********",
        controller: _passwordController,
        icon: state.obscurePassword
            ? Icons.visibility_off
            : Icons.visibility,
        isPassword: true,
        obscureText: state.obscurePassword,
        onIconPressed: () {
          ref
              .read(loginProvider.notifier)
              .togglePasswordVisibility();
        },
        validator: (value) {
          if (value == null || value.isEmpty) {
            return "Password cannot be empty";
          }

          if (value.length < 6) {
            return "Password must be at least 6 characters";
          }

          return null;
        },
      ),

      const SizedBox(height: 60),

      state.isLoading
          ? const CircularProgressIndicator(
        color: AppColors.primary,
      )
          : SizedBox(
        width: double.infinity,
        height: 50,
        child: OutlinedButton(
          style: OutlinedButton.styleFrom(
            side: const BorderSide(
              color: AppColors.primary,
              width: 2,
            ),
            shape: RoundedRectangleBorder(
              borderRadius:
              BorderRadius.circular(25),
            ),
          ),
          onPressed: () async {
            FocusScope.of(context).unfocus();

            if (!_formKey.currentState!
                .validate()) {
              return;
            }

            await ref
                .read(loginProvider.notifier)
                .login(
              email: _emailController.text,
              password:
              _passwordController.text,
            );
          },
          child: const Text(
            "LOGIN",
            style: TextStyle(
              color: AppColors.primary,
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
        ),
      ),

      const SizedBox(height: 32),

      GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            PageRouteBuilder(
              pageBuilder: (_, __, ___) =>
              const SignUpScreen(),
              transitionDuration: Duration.zero,
              reverseTransitionDuration:
              Duration.zero,
            ),
          );
        },
        child: RichText(
          text: const TextSpan(
            style: TextStyle(
              color: AppColors.secondary,
              fontSize: 18,
            ),
            children: [
              TextSpan(
                text: "Click here to ",
              ),
              TextSpan(
                text: "Sign Up",
                style: TextStyle(
                  color: AppColors.primary,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ),

      const SizedBox(height: 20),
    ],
    ),
    ),
    ),
    ),
    );
  }
  Widget _buildTextField({
    required String label,
    required String hint,
    required TextEditingController controller,
    required IconData icon,
    required String? Function(String?) validator,
    bool isPassword = false,
    bool obscureText = false,
    VoidCallback? onIconPressed,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(
            color: AppColors.white,
            fontSize: 12,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 8),
        TextFormField(
          controller: controller,
          validator: validator,
          obscureText: obscureText,
          keyboardType: isPassword
              ? TextInputType.visiblePassword
              : TextInputType.emailAddress,
          style: const TextStyle(
            color: AppColors.white,
          ),
          decoration: InputDecoration(
            hintText: hint,
            hintStyle: const TextStyle(
              color: AppColors.secondary,
            ),
            filled: true,
            fillColor: AppColors.fieldBackground,
            errorStyle: const TextStyle(
              color: Colors.redAccent,
            ),
            suffixIcon: isPassword
                ? IconButton(
              icon: Icon(
                icon,
                color: AppColors.secondary,
              ),
              onPressed: onIconPressed,
            )
                : Icon(
              icon,
              color: AppColors.secondary,
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide.none,
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide.none,
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: const BorderSide(
                color: AppColors.primary,
                width: 2,
              ),
            ),
            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: const BorderSide(
                color: Colors.red,
              ),
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: const BorderSide(
                color: Colors.red,
                width: 2,
              ),
            ),
            contentPadding: const EdgeInsets.symmetric(
              horizontal: 16,
              vertical: 16,
            ),
          ),
        ),
      ],
    );
  }
}