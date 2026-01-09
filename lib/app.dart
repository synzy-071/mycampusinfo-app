import 'package:flutter/material.dart';
import 'package:mycampusinfo_app/common/utils/no_internet_view.dart';
import 'package:mycampusinfo_app/core/common/connectivity_provider.dart';
import 'package:mycampusinfo_app/core/common/theme_provider.dart';
import 'package:mycampusinfo_app/core/navigation/router.dart';
import 'package:mycampusinfo_app/core/services/service_locator.dart';
import 'package:mycampusinfo_app/core/utils/toast.dart';
import 'package:provider/provider.dart';


final router = AppRouter().router;
class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(value: getIt<ConnectivityProvider>()),
        ChangeNotifierProvider(create: (_) => ThemeProvider()),
      ],
      child: Consumer<ConnectivityProvider>(
        builder: (vmContext, connectivityProvider, child) {
          final colors = vmContext.watch<ThemeProvider>().colors;

          return MaterialApp.router(
            debugShowCheckedModeBanner: false,
            routerDelegate: router.routerDelegate,
            routeInformationProvider: router.routeInformationProvider,
            routeInformationParser: router.routeInformationParser,
            theme: ThemeData(scaffoldBackgroundColor: colors.backgroundColor),
            builder: (context, child) {
              if (connectivityProvider.status == NetworkStatus.onlineSlow) {
                Toasts.showInfoToast(
                  context,
                  message:
                      'Slow internet connection detected. It can affect app\'s behaviour',
                );
              }
              if (connectivityProvider.status == NetworkStatus.offline) {
                return const NoInternetView();
              }

              return child!;
            },
          );
        },
      ),
    );

  }
}
