import 'package:flutter/material.dart';
import 'package:flutter_shopee/features/auth/presenter/pages/login_screen.dart';
import 'package:flutter_shopee/features/auth/presenter/pages/signup_screen.dart';
import 'package:flutter_shopee/theme/dimensions.dart';

class LandingScreen extends StatefulWidget {
  const LandingScreen({super.key});

  @override
  State<LandingScreen> createState() => _LandingScreenState();
}

class _LandingScreenState extends State<LandingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: kPaddingLarge, vertical: kPaddingXLarge),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(
                child: _buildBrandingContent(),
              ),
              _buildSignupButton(context),
              SizedBox(height: kPaddingMedium),
              _buildLoginButton(context),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildBrandingContent() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        _buildLogo(),
        SizedBox(height: kPaddingLarge),
        _buildBrandName(),
        SizedBox(height: kPaddingMedium),
        _buildBrandMessage(),
      ],
    );
  }

  Widget _buildLogo() {
    final containerSize = MediaQuery.of(context).size.width * 0.3;

    return Card(
      elevation: 5,
      shape: CircleBorder(),
      child: Container(
        height: containerSize,
        width: containerSize,
        padding: EdgeInsets.all(kPaddingLarge),
        child: Image.asset('assets/images/logo.png', fit: BoxFit.contain),
      ),
    );
  }

  Widget _buildBrandName() {
    return Text(
      'Shoppe',
      style: Theme.of(context).textTheme.displayMedium?.copyWith(
        fontWeight: FontWeight.w500,
      ),
    );
  }

  Widget _buildBrandMessage() {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.7,
      child: Text(
        'Beautiful eCommerce UI Kit for your online store',
        textAlign: TextAlign.center,
        style: Theme.of(context).textTheme.titleLarge?.copyWith(
          fontWeight: FontWeight.w300,
        ),
      ),
    );
  }

  Widget _buildLoginButton(BuildContext context) {
    return TextButton.icon(
      style: TextButton.styleFrom(
        textStyle: Theme.of(
          context,
        ).textTheme.titleMedium!.copyWith(fontWeight: FontWeight.w300),
        overlayColor: Colors.transparent
      ),
      onPressed: _onLoginButtonPressed,
      icon: Icon(
        Icons.arrow_circle_right,
        size: 24,
      ),
      iconAlignment: IconAlignment.end,
      label: Text("I already have an account"),
    );
  }

  Widget _buildSignupButton(BuildContext context) {
    return ElevatedButton(
      onPressed: _onSignupButtonPressed, 
      style: ElevatedButton.styleFrom(
        textStyle: Theme.of(
          context,
        ).textTheme.titleMedium!.copyWith(fontWeight: FontWeight.w300),
      ),
      child: Text("Let's Get Started")
    );
  }

  void _onSignupButtonPressed() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => SignupScreen()),
    );
  }

  void _onLoginButtonPressed() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => LoginScreen()),
    );
  }
}