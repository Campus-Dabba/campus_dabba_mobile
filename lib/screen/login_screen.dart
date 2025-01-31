import 'package:campus_dabba/utils/auth_service.dart';
import 'package:campus_dabba/widgets/custom_button.dart';
import 'package:campus_dabba/widgets/custom_textfield.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  // Text Field controllers
  final TextEditingController _phoneNumberController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final VoidCallback registerNowCallback;

  LoginScreen({super.key, required this.registerNowCallback});

  void loginFunction(BuildContext context) async {
    // TODO: make the alert dialog system better... Its scapy rn
    //
    // auth service
    final authService = AuthService();

    // try login
    try {
      await authService.signInWithEmailPassword(
        _phoneNumberController.text,
        _passwordController.text,
      );
    }
    // cath error
    catch (e) {
      if (!context.mounted) return;
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text("Something went wrong!"),
          content: Text(e.toString()),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // logo
            Icon(
              Icons.fastfood_outlined,
              size: 60,
              color: Theme.of(context).colorScheme.primary,
            ),
            const SizedBox(height: 50),

            // Welcome message
            Text(
              "Welcome! Lets login in",
              style: TextStyle(
                color: Theme.of(context).colorScheme.primary,
                fontSize: 20,
              ),
            ),
            const SizedBox(height: 25),
            // email
            CustomTextfield(
              hintText: "Phone Number",
              controller: _phoneNumberController,
            ),
            const SizedBox(height: 10),
            // password
            CustomTextfield(
              hintText: "Password",
              isPassword: true,
              controller: _passwordController,
            ),
            const SizedBox(height: 25),
            // login
            CustomButton(
              text: "Login",
              onTap: () {
                loginFunction(context);
              },
            ),
            const SizedBox(height: 25),
            // register
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Don't have an account? ",
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.primary,
                  ),
                ),
                GestureDetector(
                  onTap: registerNowCallback,
                  child: Text(
                    "Register now!",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context).colorScheme.primary,
                    ),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
