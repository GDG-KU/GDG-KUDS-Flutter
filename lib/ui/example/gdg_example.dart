import 'package:flutter/material.dart';
import 'package:gdgku_design/ui/component/gdg_button.dart';
import 'package:gdgku_design/ui/component/gdg_input.dart';
import 'package:gdgku_design/ui/theme/gdg_theme.dart';

class GdgExample extends StatelessWidget {
  const GdgExample({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = GdgTheme.of(context).textTheme;

    return Padding(
      padding: const EdgeInsets.all(17.0),
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 350),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                "Create an account",
                style: textTheme.h3,
              ),
              Text(
                "Enter your email below to create your account",
                style: textTheme.caption,
              ),
              const SizedBox(height: 20),
              Row(
                children: [
                  Expanded(
                    child: GdgButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.local_activity,
                        size: 20,
                      ),
                      child: const Text('Google'),
                    ),
                  ),
                  const SizedBox(width: 20),
                  Expanded(
                    child: GdgButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.apple,
                        size: 20,
                      ),
                      child: const Text('Apple'),
                    ),
                  )
                ],
              ),
              Row(
                children: [
                  const Expanded(child: Divider(height: 50)),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 12,
                    ),
                    child: Text(
                      "OR CONTINUE WITH",
                      style: textTheme.caption,
                    ),
                  ),
                  const Expanded(child: Divider(height: 50)),
                ],
              ),
              const GdgInput.medium(
                label: "Email",
                keyboardType: TextInputType.emailAddress,
              ),
              const SizedBox(height: 4),
              const GdgInput.medium(
                label: 'Password',
                obscureText: true,
              ),
              const SizedBox(height: 25),
              GdgButton.large(
                child: const Text('Submit'),
                onPressed: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}
