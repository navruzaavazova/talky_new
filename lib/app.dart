import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:talky_new/profile_page.dart/profile_page.dart';
import 'package:talky_new/providers/firebase_provider.dart';
import 'package:talky_new/providers/image_picker_provider.dart';
import 'package:talky_new/providers/loading_indicator_provider.dart';
import 'package:talky_new/providers/otp_form_provider.dart';
import 'package:talky_new/utils/app_colors.dart';
import 'package:talky_new/utils/app_router.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => LoadingProvider(),
        ),
        ChangeNotifierProvider(
          create: (_) => FirebaseProvider(),
        ),
        ChangeNotifierProvider(
          create: (_) => OtpFormProvider(),
        ),
        ChangeNotifierProvider(
          create: (_) => ImagePickerProvider(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primaryColor: AppColors.primaryBlue,
        ),
        onGenerateRoute: AppRouter.generateRoute,
        home: ProfilePage(),
      ),
    );
  }
}
