import 'package:go_router/go_router.dart';
import '../../Features/Page_view/Prsesnation/Views/PageBody.dart';
import '../../Features/Students/Chat/Prsesnation/Views/widgets/Ad_chatST.dart';
import '../../Features/Students/Chat/Prsesnation/Views/widgets/chat.dart';
import '../../Features/Students/HomeStudent/Presentation/Views/HomeStudentPage.dart';
import '../../Features/Students/LoginStudent/Presentation/Views/Widgets/Splash_Dialog.dart';
import '../../Features/Students/LoginStudent/Presentation/Views/loginPageStudent.dart';
import '../../Features/Splash/Presentation/Views/SplashPage.dart';
import '../../Features/Students/Service_student/Prsesnation/Views/widgets/examprog.dart';
import '../../Features/Students/Service_student/Prsesnation/Views/widgets/inschool.dart';
import '../../Features/Students/Service_student/Prsesnation/Views/widgets/marks.dart';
import '../../Features/Students/Service_student/Prsesnation/Views/widgets/my_lesson.dart';
import '../../Features/Students/Service_student/Prsesnation/Views/widgets/note.dart';
import '../../Features/Students/Service_student/Prsesnation/Views/widgets/weekprog.dart';
import '../../Features/Students/StudentAccount/Presentation/Views/StudenAccountPage.dart';
import '../../Features/Students/StudentAccount/Presentation/Views/Widgets/Email_change.dart';
import '../../Features/Students/StudentAccount/Presentation/Views/Widgets/Security.dart';
import '../../Features/Students/StudentAccount/Presentation/Views/Widgets/add_person.dart';
import '../../Features/Students/StudentAccount/Presentation/Views/Widgets/info.dart';
import '../../Features/Students/StudentAccount/Presentation/Views/Widgets/langauge.dart';
import '../../Features/Students/StudentAccount/Presentation/Views/Widgets/pass_change.dart';
import '../../Features/Students/forget_Password/Prsesnation/Views/forget_passwordPage.dart';
import '../../Features/Students/forget_Password/Prsesnation/Views/widgets/Code_Page.dart';

abstract class AppRouter {
  static const KSplashPage = '/SplashView';
  static const KStudentLoginPage = '/StudentloginView';
  static const KHomeStudentPage = '/Homeview';
  static const KStudentAccount = '/StudentAccountView';
  static const KsplashDialog = '/SplashDialog';
  static const kForgetPassword = '/Forget_passwordView';
  static const KCodeForgetPass = '/Code_page';
  static const KchatParents = '/ChatParents';
  static const KAdchat = '/AdChat';
  static const kWeekprog = '/weekprg';
  static const KSecurityview = '/Security_View';
  static const KemailChange = '/EmailChange';
  static const KchangeCode = '/Code_page_change';
  static const Kpasschnage = '/PassChange';
  static const KinfoStu = '/Info_student';
  static const Kaddstudent = '/add';
  static const Klanguage = '/LanguageView';
  static const Kpageview = '/Page_View';
  static const knote = '/note';
  static const kinschool = '/inschool';
  static const kmarkess = '/markess';
  static const klesson = '/lesson';
  static const kexamprog = '/examprog';
  static const weekprg = '/weekprg';

  static final router = GoRouter(routes: [
    GoRoute(path: '/', builder: (context, state) => const Page_View()),
    GoRoute(path: KSplashPage, builder: (context, state) => const SplashView()),
    GoRoute(
        path: KStudentLoginPage,
        builder: (context, state) => const StudentloginView()),
    GoRoute(
        path: KHomeStudentPage,
        builder: (context, state) => const HomeStudentview()),
    GoRoute(
        path: KStudentAccount,
        builder: (context, state) => const StudentAccountView()),
    GoRoute(
      path: KsplashDialog,
      builder: (context, state) => const SplashDialog(),
    ),
    GoRoute(
      path: kForgetPassword,
      builder: (context, state) => Forget_passwordView(),
    ),
    GoRoute(
      path: KCodeForgetPass,
      builder: (context, state) => const Code_page(),
    ),
    GoRoute(
      path: KchatParents,
      builder: (context, state) => const ChatParents(),
    ),
    GoRoute(
      path: KAdchat,
      builder: (context, state) => const AdChat(),
    ),
    GoRoute(
      path: kWeekprog,
      builder: (context, state) => const Weekprog(),
    ),
    GoRoute(
      path: KSecurityview,
      builder: (context, state) => const Security_View(),
    ),
    GoRoute(
      path: KemailChange,
      builder: (context, state) => EmailChange(),
    ),
    GoRoute(
      path: KchangeCode,
      builder: (context, state) => const Code_page_change(),
    ),
    GoRoute(
      path: Kpasschnage,
      builder: (context, state) => const PassChange(),
    ),
    GoRoute(
      path: KinfoStu,
      builder: (context, state) => const Info_student(),
    ),
    GoRoute(
      path: Kaddstudent,
      builder: (context, state) => const add(),
    ),
    GoRoute(
      path: Klanguage,
      builder: (context, state) => const LanguageView(),
    ),
    GoRoute(
      path: Kpageview,
      builder: (context, state) => const Page_View(),
    ),
    GoRoute(
      path: knote,
      builder: (context, state) => const Note(),
    ),
    GoRoute(
      path: kinschool,
      builder: (context, state) => const Inschool(),
    ),
    GoRoute(
      path: kmarkess,
      builder: (context, state) => const markss(),
    ),
    GoRoute(
      path: klesson,
      builder: (context, state) => const Lesson(),
    ),
    GoRoute(
      path: kexamprog,
      builder: (context, state) => const Examprog(),
    ),
    GoRoute(
      path: kWeekprog,
      builder: (context, state) => const Weekprog(),
    ),
  ]);
}
