import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ptf/presentation/blocs/authentication/authentication_bloc.dart';
import 'package:ptf/presentation/blocs/authentication/authentication_provider.dart';

class LoginFormWidget extends StatelessWidget {
  const LoginFormWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController _emailController = TextEditingController();
    final TextEditingController _passwordController = TextEditingController();
    final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
    return BlocListener<AuthenticationBloc, AuthenticationState>(
  listener: (context, state) {
    state.maybeMap(
        orElse: (){},
        success: (_) => Navigator.pop(context),
    );
  },
  child: Container(
      padding: const EdgeInsets.all(16),
      child: Form(
        key: _formKey,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextFormField(
              controller: _emailController,
              decoration: InputDecoration(
                labelText: 'Email',
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter your email';
                }
                return null;
              },
            ),
            TextFormField(
              controller: _passwordController,
              decoration: InputDecoration(
                labelText: 'Password',
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter your password';
                }
                return null;
              },
            ),
            BlocBuilder<AuthenticationBloc, AuthenticationState>(
  builder: (context, state) {
    return state.maybeMap(
        loading: (_) => const CircularProgressIndicator(),
        orElse: ()=> Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TextButton(onPressed: (){Navigator.pop(context);}, child: Text("Cancel")),
                ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      EmailPassword user = EmailPassword(email: _emailController.text, password: _passwordController.text);
                      context.read<AuthenticationBloc>().add(AuthenticationEvent.newLoginEvent(AuthenticationProvider.email, credentials: user));
                    }
                },
                  child: Text('Login'),
                ),
              ],
            ));
  },
),
          ],
        ),
      ),
    ),
);

    }
  }