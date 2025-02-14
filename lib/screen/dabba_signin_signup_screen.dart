import 'package:campus_dabba/utils/auth_service.dart';
import 'package:campus_dabba/widgets/cutom_primary_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:simple_animations/animation_builder/play_animation_builder.dart';
import 'package:simple_animations/movie_tween/movie_tween.dart';

class AppAssets {
  static String kAppLogo = 'assets/dabba/dabba_logo.png';
  static String kGoogle = 'assets/dabba/icons-google.png';
  static String kFacebook = 'assets/dabba/icons-facebook.png';
  static String kTwitter = 'assets/dabba/icons-twitter.png';
}

class AppColors {
  static const Color kPrimary = Color(0xFF84BD93);
  static const Color kSecondary = Color(0xFF3F2D20);
  static const Color kBackground = Color(0xFFFFF5E0);
  static const Color kOrange = Color(0xFFEF8829);
  static const Color kLine = Color(0xFFE6DCCD);
}

class DabbaSignUpScreen extends StatefulWidget {
  final VoidCallback loginNowCallback;
  const DabbaSignUpScreen({
    super.key,
    required this.loginNowCallback,
  });

  @override
  State<DabbaSignUpScreen> createState() => _DabbaSignUpScreenState();
}

class _DabbaSignUpScreenState extends State<DabbaSignUpScreen> {
  final _formKey = GlobalKey<FormState>();
  final _usernameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  bool isEmailCorrect = false;
  bool isNameCorrect = false;

  bool validateName(String value) {
    if (value.isEmpty) {
      return false;
    } else {
      return true;
      // TODO: make a proper validation (currently broken)
      //
      // final nameRegex = RegExp(r'^[a-zA-Z]+$');
      // return nameRegex.hasMatch(value);
    }
  }

  bool validateEmail(String value) {
    if (value.isEmpty) {
      return false;
    } else {
      return true;
      // TODO: make a proper validation (currently broken)
      //
      // final emailRegex = RegExp(
      //   r'^[w-]+(.[w-]+)*@([w-]+.)+[a-zA-Z]{2,7}$',
      // );
      // return emailRegex.hasMatch(value);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.kBackground,
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Form(
          key: _formKey,
          child: FadeAnimation(
            delay: 1,
            child: Column(
              children: [
                const SizedBox(height: 80),
                Center(
                  child: Image.asset(
                    AppAssets.kAppLogo,
                    height: 150,
                  ),
                ),
                const SizedBox(height: 30),
                const Text('Register now',
                    style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        color: Colors.black)),
                const SizedBox(height: 54),
                AuthField(
                  controller: _usernameController,
                  hintText: 'Your Username',
                  isFieldValidated: isNameCorrect,
                  keyboardType: TextInputType.name,
                  onChanged: (value) {
                    isNameCorrect = validateName(value);
                    setState(() {});
                  },
                  validator: (value) {
                    if (!validateName(value!)) {
                      return 'Enter a valid name';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 20),
                AuthField(
                  controller: _emailController,
                  hintText: 'Your Email',
                  keyboardType: TextInputType.emailAddress,
                  isFieldValidated: isEmailCorrect,
                  onChanged: (value) {
                    setState(() {});
                    isEmailCorrect = validateEmail(value);
                  },
                  validator: (value) {
                    if (!validateEmail(value!)) {
                      return 'Please enter a valid email address';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 20),
                AuthField(
                  hintText: 'Your Password',
                  controller: _passwordController,
                  keyboardType: TextInputType.visiblePassword,
                  isPasswordField: true,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your email';
                    } else if (value.length < 6) {
                      return 'Password should be at least 6 characters';
                    }
                    // } else if (!RegExp(r'^(?=.*[a-z])(?=.*[A-Z])(?=.*d).+$')
                    //     .hasMatch(value)) {
                    //   return 'Password should contain at least one uppercase letter, one lowercase letter, and one digit';
                    // }
                    return null;
                  },
                ),
                const SizedBox(height: 30),
                CustomPrimaryButton(
                    onTap: () async {
                      if (_formKey.currentState!.validate()) {}
                    },
                    text: 'Sign Up'),
                const SizedBox(height: 30),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text('Already a member?',
                        style: TextStyle(
                          fontSize: 14,
                          color: AppColors.kPrimary,
                        )),
                    CustomTextButton(
                      onPressed: widget.loginNowCallback,
                      text: 'Sign In',
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class DabbaSignInScreen extends StatefulWidget {
  final VoidCallback registerNowCallback;

  const DabbaSignInScreen({
    super.key,
    required this.registerNowCallback,
  });

  @override
  State<DabbaSignInScreen> createState() => _DabbaSignInScreenState();
}

class _DabbaSignInScreenState extends State<DabbaSignInScreen> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  bool isEmailCorrect = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.kBackground,
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Form(
          key: _formKey,
          child: FadeAnimation(
            delay: 1,
            child: Column(
              children: [
                const SizedBox(height: 80),
                Center(
                  child: Image.asset(
                    AppAssets.kAppLogo,
                    height: 150,
                  ),
                ),
                const SizedBox(height: 30),
                const Text('Sign In',
                    style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        color: AppColors.kSecondary)),
                const SizedBox(height: 77),
                AuthField(
                  controller: _emailController,
                  keyboardType: TextInputType.emailAddress,
                  isFieldValidated: isEmailCorrect,
                  onChanged: (value) {
                    setState(() {});
                    isEmailCorrect = validateEmail(value);
                  },
                  hintText: 'Your Email',
                  validator: (value) {
                    if (!validateEmail(value!)) {
                      return 'Please enter a valid email address';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 20),
                AuthField(
                  hintText: 'Your Password',
                  controller: _passwordController,
                  keyboardType: TextInputType.visiblePassword,
                  isForgetButton: true,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your password';
                    } else if (value.length < 6) {
                      return 'Password should be at least 6 characters';
                    }
                    // } else if (!RegExp(r'^(?=.*[a-z])(?=.*[A-Z])(?=.*d).+$')
                    //     .hasMatch(value)) {
                    //   return 'Password should contain at least one uppercase letter, one lowercase letter, and one digit';
                    // }
                    return null;
                  },
                ),
                const SizedBox(height: 30),
                CustomPrimaryButton(
                    onTap: () async {
                    if (_formKey.currentState!.validate()) {
                      await AuthService().signInWithEmailPassword(
                        _emailController.text,
                        _passwordController.text,
                      );
                    }
                  },
                    text: 'Sign In'),
                const SizedBox(height: 60),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text('New User?',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          color: AppColors.kSecondary,
                        )),
                    CustomTextButton(
                      onPressed: widget.registerNowCallback,
                      text: 'Sign Up',
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  bool validateEmail(String value) {
    if (value.isEmpty) {
      return false;
    } else {
      final emailRegex = RegExp(
        r'^[\w-]+(\.[\w-]+)*@([\w-]+\.)+[a-zA-Z]{2,7}$',
      );
      return emailRegex.hasMatch(value);
    }
  }
}

class AuthField extends StatefulWidget {
  final TextEditingController controller;
  final String? Function(String?)? validator;
  final String hintText;
  final bool isFieldValidated;
  final bool isForgetButton;
  final bool isPasswordField;
  final bool isPhone;
  final TextInputType? keyboardType;
  final List<TextInputFormatter>? inputFormatters;
  final void Function(String)? onChanged;
  const AuthField({
    super.key,
    required this.hintText,
    required this.controller,
    this.inputFormatters,
    this.onChanged,
    this.isFieldValidated = false,
    this.validator,
    this.isPhone = false,
    this.isPasswordField = false,
    this.isForgetButton = false,
    this.keyboardType,
  });

  @override
  State<AuthField> createState() => _AuthFieldState();
}

class _AuthFieldState extends State<AuthField> {
  bool isObscure = true;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      obscureText: widget.isPasswordField ? isObscure : false,
      validator: widget.validator,
      onChanged: widget.onChanged,
      inputFormatters: widget.inputFormatters,
      keyboardType: widget.keyboardType,
      decoration: InputDecoration(
          hintText: widget.hintText,
          errorMaxLines: 2,
          filled: false,
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
          enabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: AppColors.kLine),
            borderRadius: BorderRadius.circular(10),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: AppColors.kLine),
            borderRadius: BorderRadius.circular(10),
          ),
          border: OutlineInputBorder(
            borderSide: const BorderSide(color: AppColors.kLine),
            borderRadius: BorderRadius.circular(10),
          ),
          errorBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: AppColors.kLine),
            borderRadius: BorderRadius.circular(10),
          ),
          hintStyle: const TextStyle(
              fontSize: 14, fontWeight: FontWeight.w300, color: Colors.grey),
          suffixIcon: widget.isForgetButton
              ? CustomTextButton(
                  onPressed: () {},
                  text: 'Forgot?',
                  color: AppColors.kPrimary,
                )
              : widget.isPasswordField
                  ? IconButton(
                      onPressed: () {
                        setState(() {
                          isObscure = !isObscure;
                        });
                      },
                      padding: EdgeInsets.zero,
                      constraints: const BoxConstraints(),
                      icon: Icon(
                        isObscure ? Icons.visibility_off : Icons.visibility,
                        color: AppColors.kPrimary,
                      ),
                    )
                  : Icon(widget.isPhone ? Icons.phone_android : Icons.done,
                      size: 20,
                      color: widget.isFieldValidated
                          ? AppColors.kPrimary
                          : AppColors.kLine)),
    );
  }
}

class CustomTextButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String text;
  final Color? color;
  final double? fontSize;
  const CustomTextButton({
    required this.onPressed,
    required this.text,
    this.fontSize,
    this.color,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      style: TextButton.styleFrom(padding: EdgeInsets.zero),
      child: Text(
        text,
        style: TextStyle(color: color ?? AppColors.kPrimary, fontSize: 14),
      ),
    );
  }
}


class FadeAnimation extends StatelessWidget {
  final double delay;
  final Widget child;

  const FadeAnimation({super.key, required this.delay, required this.child});

  @override
  Widget build(BuildContext context) {
    final tween = MovieTween()
      ..tween('opacity', Tween(begin: 0.0, end: 1.0),
          duration: const Duration(milliseconds: 500))
      ..tween('translateY', Tween(begin: -30.0, end: 0.0),
          duration: const Duration(milliseconds: 500), curve: Curves.easeOut);
    return PlayAnimationBuilder(
      delay: Duration(milliseconds: (500 * delay).round()),
      duration: tween.duration,
      tween: tween,
      child: child,
      builder: (context, animation, child) => Opacity(
        opacity: animation.get('opacity'),
        child: Transform.translate(
            offset: Offset(0, animation.get('translateY')), child: child),
      ),
    );
  }
}
