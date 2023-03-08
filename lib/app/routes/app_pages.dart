import 'package:get/get.dart';

import '../modules/account_connexion/bindings/account_connexion_binding.dart';
import '../modules/account_connexion/bindings/account_connexion_binding.dart';
import '../modules/account_connexion/views/account_connexion_view.dart';
import '../modules/account_connexion/views/account_connexion_view.dart';
import '../modules/answer/bindings/answer_binding.dart';
import '../modules/answer/views/answer_view.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/identification/bindings/identification_binding.dart';
import '../modules/identification/views/identification_view.dart';
import '../modules/login/bindings/login_binding.dart';
import '../modules/login/views/login_view.dart';
import '../modules/scaning/bindings/scaning_binding.dart';
import '../modules/scaning/views/scaning_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.LOGIN;

  static final routes = [
    GetPage(
      name: _Paths.LOGIN,
      page: () =>  LoginView(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: _Paths.HOME,
      page: () => const HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.IDENTIFICATION,
      page: () => const IdentificationView(),
      binding: IdentificationBinding(),
    ),
    GetPage(
      name: _Paths.ACCOUNT_CONNEXION,
      page: () => const AccountConnexionView(),
      binding: AccountConnexionBinding(),
      children: [
        GetPage(
          name: _Paths.ACCOUNT_CONNEXION,
          page: () => const AccountConnexionView(),
          binding: AccountConnexionBinding(),
        ),
      ],
    ),
    GetPage(
      name: _Paths.ANSWER,
      page: () => const AnswerView(),
      binding: AnswerBinding(),
    ),
    GetPage(
      name: _Paths.SCANING,
      page: () => const ScaningView(),
      binding: ScaningBinding(),
    ),
  ];
}
