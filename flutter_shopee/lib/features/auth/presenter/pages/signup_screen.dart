import 'package:flutter/material.dart';
import 'package:flutter_shopee/main_navigation_screen.dart';
import 'package:flutter_shopee/theme/dimensions.dart';
import 'package:flutter_shopee/widgets/phone_number_field.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _isPasswordVisible = false;

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final screenHeight = MediaQuery.of(context).size.height;
    final halfHeight = screenSize.height / 2;

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            _buildTitleAndProfileImage(halfHeight, screenHeight),
            _buildFormAndButtons(context)
          ],
        )
      )
    );
  }

  Widget _buildTitleAndProfileImage(double halfHeight, double screenHeight) {
    return Container(
      constraints: BoxConstraints(minHeight: halfHeight),
      child: Stack(
        children: [
          SizedBox(
            width: double.infinity,
            height: screenHeight * 0.4,
            child: Image.asset(
              'assets/images/bubble_1.png',
              fit: BoxFit.cover,
            ),
          ),
          Positioned(
            bottom: kPaddingSmall,
            left: kPaddingXLarge,
            right: kPaddingXLarge,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildTitle(),
                const SizedBox(height: 54),
                _buildUploadProfile(),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTitle() {
    return Text(
      'Create \nAccount',
      style: Theme.of(context).textTheme.displayMedium!.copyWith(
        fontWeight: FontWeight.w600,
      ),
    );
  }

  Widget _buildUploadProfile() {
    return IconButton(
      onPressed: _onUploadProfile,
      icon: Image.asset(
        'assets/images/upload_photo.png',
        width: 90,
        height: 90,
      ),
      style: IconButton.styleFrom(
        overlayColor: Colors.transparent,
      ),
    );
  }

  Widget _buildFormAndButtons(BuildContext context) {
    return Column(
      children: [
          Form(
            key: _formKey,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            child: Padding(
              padding: const EdgeInsets.all(kPaddingXLarge),
              child: Column(
                children: [
                  _buildEmailField(context),
                  const SizedBox(height: kPaddingSmall),
                  _buildPasswordField(context),
                  const SizedBox(height: kPaddingSmall),
                  _buildPhoneNumberField(context),
                  const SizedBox(height: kPaddingXLarge),
                  _buildSignupButton(),
                  const SizedBox(height: kPaddingSmall),
                  _buildCancelButton(context)
                ],
              ),
          ),
        )
      ],
    );
  }

  Widget _buildEmailField(BuildContext context) {
    return TextFormField(
      controller: _emailController,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Email is required';
        }
        return null;
      },
      decoration: InputDecoration(
        hintText: 'Email',
        hintStyle: Theme.of(context).textTheme.bodyMedium!.copyWith(
          color: Theme.of(context).colorScheme.outline,
        ),
        contentPadding: EdgeInsets.all(kPaddingMedium),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(200),
          borderSide: BorderSide(
            color: Colors.transparent,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(200),
          borderSide: BorderSide(
            color: Colors.transparent,
          ),
        ),
      ),
      keyboardType: TextInputType.emailAddress,
    );
  }

  Widget _buildPasswordField(BuildContext context) {
    return TextFormField(
      controller: _passwordController,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Password is required';
        }
        return null;
      },
      obscureText: !_isPasswordVisible,
      decoration: InputDecoration(
        hintText: 'Password',
        hintStyle: Theme.of(context).textTheme.bodyMedium!.copyWith(
          color: Theme.of(context).colorScheme.outline,
        ),
        suffixIcon: IconButton(
          onPressed: () {
            setState(() {
              _isPasswordVisible = !_isPasswordVisible;
            });
          },
          icon: Icon(
            _isPasswordVisible ? Icons.visibility : Icons.visibility_off,
            color: Theme.of(context).colorScheme.outline,
          ),
        ),
        contentPadding: EdgeInsets.all(kPaddingMedium),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(200),
          borderSide: BorderSide(
            color: Colors.transparent,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(200),
          borderSide: BorderSide(
            color: Colors.transparent,
          ),
        ),
      ),
    );
  }

  Widget _buildPhoneNumberField(BuildContext context) {
    return PhoneNumberField();
  }

  Widget _buildSignupButton() {
    return ElevatedButton(
      onPressed: _onSignup,
      child: const Text('Done'),
    );
  }

  Widget _buildCancelButton(BuildContext context) {
    return TextButton(
      onPressed: _onCancel,
      child: Text(
        'Cancel',
        style: Theme.of(context).textTheme.bodyMedium!.copyWith(
          color: Theme.of(context).colorScheme.outline,
        ),
      ),
    );
  }

  void _onUploadProfile() {
    debugPrint('upload profile');
  }

  void _onSignup() {
    if (_formKey.currentState!.validate()) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const MainNavigationScreen()),
      );
    }
  }

  void _onCancel() {
    Navigator.pop(context);
  }
}