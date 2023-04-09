import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:tiktok_clone/features/authentication/repos/authentication_repo.dart';
import 'package:tiktok_clone/features/videos/view_models/playback_config_vm.dart';

class SettingsScreen extends ConsumerWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Settings",
        ),
      ),
      body: ListView(
        children: [
          SwitchListTile.adaptive(
            value: ref.watch(playbackConfigProvider).muted,
            onChanged: (value) =>
                ref.read(playbackConfigProvider.notifier).setMuted(value),
            title: const Text(
              "Mute video",
            ),
            subtitle: const Text(
              "Video will be muted by default.",
            ),
          ),
          SwitchListTile.adaptive(
            value: ref.watch(playbackConfigProvider).autoplay,
            onChanged: (value) =>
                ref.read(playbackConfigProvider.notifier).setAutoplay(value),
            title: const Text(
              "Autoplay video",
            ),
            subtitle: const Text(
              "Video will be played automatically.",
            ),
          ),
          SwitchListTile.adaptive(
            value: false,
            onChanged: (value) {},
            title: const Text(
              "Enable notifications",
            ),
            subtitle: const Text(
              "They will be cute.",
            ),
          ),
          CheckboxListTile(
            value: false,
            onChanged: (value) {},
            title: const Text(
              "Marketing emails",
            ),
            subtitle: const Text(
              "We won't spam you.",
            ),
          ),
          ListTile(
              title: const Text("Log out(iOS)"),
              textColor: Colors.red,
              onTap: () {
                showCupertinoDialog(
                    context: context,
                    builder: (context) => CupertinoAlertDialog(
                          title: const Text("are you sure?"),
                          content: const Text("You will be logged out"),
                          actions: [
                            CupertinoDialogAction(
                              onPressed: () => Navigator.of(context).pop(),
                              child: const Text(
                                "No",
                              ),
                            ),
                            CupertinoDialogAction(
                              onPressed: () {
                                ref.read(authRepo).signOut();
                                context.go("/");
                              },
                              isDestructiveAction: true,
                              child: const Text(
                                "Yes",
                              ),
                            ),
                          ],
                        ));
              })
        ],
      ),
    );
  }
}
