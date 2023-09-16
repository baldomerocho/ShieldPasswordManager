import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ptf/domain/entities/entities.dart';
import 'package:ptf/local.dart';
import 'package:ptf/presentation/blocs/blocs.dart';
import 'package:ptf/presentation/widgets/get_all_passwords.dart';
import 'package:ptf/presentation/widgets/password_item_button/password_item_button.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<void> savePassVulnerable(String pass) async {
  final prefs = await SharedPreferences.getInstance();
  await prefs.setStringList("vulnerable", [pass]);
}

Future<List<String>> getPassVulnerable() async {
  final prefs = await SharedPreferences.getInstance();
  return prefs.getStringList("vulnerable") ?? [];
}

class NotificationsWidget extends StatefulWidget {
  const NotificationsWidget({super.key});

  @override
  State<NotificationsWidget> createState() => _NotificationsWidgetState();
}

class _NotificationsWidgetState extends State<NotificationsWidget> {

  @override
  void initState() {
    _listener();
    super.initState();
  }

  _listener() async {
    if (!mounted) return;
    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      if(message.data["pid"] != null){
        Map<String, dynamic> data = message.data;
        print(data["pid"]);
        context.read<SetPassVulnerableBloc>().add(
            SetPassVulnerableEvent.setPassVulnerable(
                id: data["pid"], value: false));
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final labels = AppLocalizations.of(context)!;
    return BlocListener<SetPassVulnerableBloc, SetPassVulnerableState>(
      listener: (context, state) {
        state.mapOrNull(
          loaded: (_) => context.read<CountPassVulnerableBloc>().add(
                CountPassVulnerableEvent.count())
        );
      },
      child: BlocBuilder<CountPassVulnerableBloc, CountPassVulnerableState>(
          builder: (context, state) {
            return state.maybeWhen(
                orElse: () => Text("0"),
                initial: () {
                  context.read<CountPassVulnerableBloc>().add(CountPassVulnerableEvent.count());
                  return Text("...");
                },
                loading: () => Center(child: const CircularProgressIndicator()),
                loaded: (count) => count>0 ? CupertinoButton(
                  color: Colors.red,
                    child: Text("$count ${labels.passwordVulnerable}"), onPressed: (){

                  Navigator.pushNamed(context, "/vulnerables");
                }) : SizedBox.shrink(),
                error: () => Text("Error")
            );
          },
        ),
    );
  }
}


class VulnerablePassPage extends StatelessWidget {
  const VulnerablePassPage({super.key});
  static const routeName = "/vulnerables";

  @override
  Widget build(BuildContext context) {
    final labels = AppLocalizations.of(context)!;
    return Scaffold(
      appBar: AppBar(),
      body: BlocBuilder<WatchPassVulnerableBloc, WatchPassVulnerableState>(
        builder: (context, state) {
          return state.maybeWhen(
            orElse: () => const Center(child: Text("0")),
            initial: () {
              context.read<WatchPassVulnerableBloc>().add(const WatchPassVulnerableEvent.watch());
              return const Center(child: CircularProgressIndicator());
            },
            loading: () => const Center(child: CircularProgressIndicator()),
            streamLoaded: (stream) => StreamBuilder<List<PasswordEntity>>(
                stream: stream,
                builder: (context, snapshot) {
                  final data = snapshot.data;
                  return CupertinoListSection.insetGrouped(
                      header: Text(labels.passwordVulnerable, style: Theme.of(context).textTheme.titleLarge!.copyWith(
                          fontWeight: FontWeight.bold
                      )),
                      children: data?.map((e) => PasswordItemButton(pass:e)).toList()
                  );
                }
            ),
            error: () => const Center(child: Text("Error")),
          );
        },
      ),
    );
  }
}