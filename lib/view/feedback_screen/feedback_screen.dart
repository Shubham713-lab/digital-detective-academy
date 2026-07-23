import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../res/colors/app_colors.dart';
import '../../res/widgets/custom_app_bar.dart';
import '../../view_model/feedback/feedback_state.dart';
import '../../view_model/feedback/feedback_viewmodel.dart';

class FeedbackScreen extends ConsumerStatefulWidget {
  const FeedbackScreen({super.key});

  @override
  ConsumerState<FeedbackScreen> createState() =>
      _FeedbackScreenState();
}

class _FeedbackScreenState
    extends ConsumerState<FeedbackScreen> {
  final _formKey = GlobalKey<FormState>();

  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _subjectController = TextEditingController();
  final _feedbackController = TextEditingController();

  @override
  void initState() {
    super.initState();

    Future.microtask(() {
      ref.listenManual<FeedbackState>(
        feedbackProvider,
            (previous, next) {
          if (!mounted) return;

          // Show Error
          if (next.errorMessage != null) {
            _showMessage(
              next.errorMessage!,
              isError: true,
            );

            ref
                .read(feedbackProvider.notifier)
                .clearError();
          }

          // Show Success
          if (next.successMessage != null) {
            _showMessage(
              next.successMessage!,
              isError: false,
            );

            // Clear form after successful submission
            _formKey.currentState?.reset();

            _nameController.clear();
            _emailController.clear();
            _subjectController.clear();
            _feedbackController.clear();

            // Reset rating
            ref
                .read(feedbackProvider.notifier)
                .resetRating();

            // Clear success message
            ref
                .read(feedbackProvider.notifier)
                .clearSuccess();
          }
        },
      );
    });
  }

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _subjectController.dispose();
    _feedbackController.dispose();

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
        ),
      );
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(feedbackProvider);

    return Scaffold(
      backgroundColor: AppColors.background,

      appBar:  AppBar(
        backgroundColor: AppColors.background,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios_new,
            color: AppColors.primary,
          ),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),

        child: Form(
          key: _formKey,

          child: Column(
            crossAxisAlignment:
            CrossAxisAlignment.start,

            children: [

              // Heading
              const Text(
                "Help us improve",
                style: TextStyle(
                  color: AppColors.primary,
                  fontSize: 26,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 10),

              const Text(
                "Share your experience with Digital Detective Academy.",
                style: TextStyle(
                  color: AppColors.secondary,
                ),
              ),

              const SizedBox(height: 30),

              // Name
              _buildField(
                label: "Name",
                controller: _nameController,
                icon: Icons.person,
                validator: (value) {
                  if (value == null ||
                      value.trim().isEmpty) {
                    return "Name is required";
                  }

                  return null;
                },
              ),

              const SizedBox(height: 18),

              // Email
              _buildField(
                label: "Email",
                controller: _emailController,
                icon: Icons.email_outlined,
                keyboardType:
                TextInputType.emailAddress,
                validator: (value) {
                  if (value == null ||
                      value.trim().isEmpty) {
                    return "Email is required";
                  }

                  final regex = RegExp(
                    r'^[\w\.-]+@([\w-]+\.)+[a-zA-Z]{2,}$',
                  );

                  if (!regex.hasMatch(
                    value.trim(),
                  )) {
                    return "Enter a valid email";
                  }

                  return null;
                },
              ),

              const SizedBox(height: 18),

              // Subject
              _buildField(
                label: "Subject",
                controller: _subjectController,
                icon: Icons.subject,
                validator: (value) {
                  if (value == null ||
                      value.trim().isEmpty) {
                    return "Subject is required";
                  }

                  return null;
                },
              ),

              const SizedBox(height: 18),

              // Feedback
              _buildField(
                label: "Feedback",
                controller: _feedbackController,
                icon: Icons.feedback_outlined,
                maxLines: 5,
                validator: (value) {
                  if (value == null ||
                      value.trim().isEmpty) {
                    return "Feedback is required";
                  }

                  if (value.trim().length < 20) {
                    return "Feedback must be at least 20 characters";
                  }

                  return null;
                },
              ),

              const SizedBox(height: 30),

              // Rating Title
              const Text(
                "Rate Your Experience",
                style: TextStyle(
                  color: AppColors.text,
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),

              const SizedBox(height: 12),

              // Rating Stars
              Center(
                child: Row(
                  mainAxisAlignment:
                  MainAxisAlignment.center,

                  children: List.generate(
                    5,

                        (index) => IconButton(
                      onPressed: () {
                        ref
                            .read(
                          feedbackProvider
                              .notifier,
                        )
                            .updateRating(
                          index + 1,
                        );
                      },

                      icon: Icon(
                        index < state.rating
                            ? Icons.star
                            : Icons.star_border,

                        color: Colors.amber,
                        size: 34,
                      ),
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 35),

              // Submit Button / Loading
              state.isLoading
                  ? const Center(
                child:
                CircularProgressIndicator(
                  color: AppColors.primary,
                ),
              )
                  : SizedBox(
                width: double.infinity,
                height: 52,

                child: ElevatedButton(
                  style:
                  ElevatedButton.styleFrom(
                    backgroundColor:
                    AppColors.primary,

                    foregroundColor:
                    AppColors.background,

                    shape:
                    RoundedRectangleBorder(
                      borderRadius:
                      BorderRadius.circular(
                        14,
                      ),
                    ),
                  ),

                  onPressed: () async {
                    FocusScope.of(context)
                        .unfocus();

                    // Validate fields
                    if (!_formKey.currentState!
                        .validate()) {
                      return;
                    }

                    // Validate rating
                    if (state.rating == 0) {
                      _showMessage(
                        "Please select a rating.",
                      );

                      return;
                    }

                    // Submit feedback
                    await ref
                        .read(
                      feedbackProvider
                          .notifier,
                    )
                        .submitFeedback(
                      name:
                      _nameController.text
                          .trim(),

                      email:
                      _emailController.text
                          .trim(),

                      subject:
                      _subjectController.text
                          .trim(),

                      feedback:
                      _feedbackController.text
                          .trim(),

                      rating: state.rating,
                    );
                  },

                  child: const Text(
                    "SUBMIT FEEDBACK",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight:
                      FontWeight.bold,
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 30),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildField({
    required String label,
    required TextEditingController controller,
    required IconData icon,
    required String? Function(String?) validator,
    int maxLines = 1,
    TextInputType keyboardType =
        TextInputType.text,
  }) {
    return TextFormField(
      controller: controller,

      validator: validator,

      keyboardType: keyboardType,

      maxLines: maxLines,

      style: const TextStyle(
        color: AppColors.white,
      ),

      decoration: InputDecoration(
        labelText: label,

        labelStyle: const TextStyle(
          color: AppColors.secondary,
        ),

        prefixIcon: Icon(
          icon,
          color: AppColors.primary,
        ),

        filled: true,

        fillColor:
        AppColors.fieldBackground,

        border: OutlineInputBorder(
          borderRadius:
          BorderRadius.circular(12),

          borderSide:
          BorderSide.none,
        ),

        focusedBorder:
        OutlineInputBorder(
          borderRadius:
          BorderRadius.circular(12),

          borderSide:
          const BorderSide(
            color: AppColors.primary,
            width: 2,
          ),
        ),
      ),
    );
  }
}