import 'package:flutter/material.dart';
import 'package:flutter_app/feature/presentation/pages/login/register_bloc.dart';
import 'package:flutter_app/feature/presentation/pages/login/register_screen.dart';
import 'package:flutter_app/injector_container.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'feature/presentation/bloc/authentication/authentication_bloc.dart';
import 'feature/presentation/bloc/authentication/authentication_event.dart';
import 'injector_container.dart' as di;

void main() async {

  WidgetsFlutterBinding.ensureInitialized();
  await di.init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider<AuthenticationBloc>(
      create: (context) => AuthenticationBloc()..add(AppStarted()),
      child: MaterialApp(
        title: "MCA Care",
        debugShowCheckedModeBanner: false,
        routes: {
          RegistrationScreenDemo.routeName: (context) =>
              BlocProvider<RegisterBloc>(
                create: (context) => sl<RegisterBloc>(),
                child: RegistrationScreenDemo(),
              ),
        },
        initialRoute: RegistrationScreenDemo.routeName,
      ),
    );
  }
}
