import 'package:auto_route/auto_route.dart';

import 'router.gr.dart';

const rSplash = '/';
const rLogin = '/login';
const rRegister = '/register';
const rHome = '/home';
const rCategoryList = '/categoryList';
const rSetting = '/setting';
const rChangeName = '/changeName';
const rChangePassword = '/changePassword';
const rDeactivateAccount = '/deactivateAccount';
const rPrivacyPolicy = '/privacyPolicy';
const rOnBoarding = '/onBoarding';
const rItemDetailPage = '/itemdetail';
const rJobListPage = '/jobListPage';
const rHotelListPage = '/hotelListPage';
const rEventListPage = '/eventListPage';
const rDestinationListPage = '/destinationListPage';
const rOraganizationListPage = '/organizationListPage';

@AutoRouterConfig(replaceInRouteName: 'Page,Route')
class AppRouter extends $AppRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(path: rSplash, page: SplashRoute.page, initial: true),
        AutoRoute(path: rLogin, page: SignInRoute.page),
        AutoRoute(path: rRegister, page: SignUpRoute.page),
        //todo: use pushNamed
        AutoRoute(path: rCategoryList, page: CategoryListRoute.page),
        //todo: use pushNamed
        AutoRoute(path: rItemDetailPage, page: ItemDetailRoute.page),

        AutoRoute(path: rSetting, page: MainSettingRoute.page),
        AutoRoute(path: rChangeName, page: ChangeNameRoute.page),
        AutoRoute(path: rChangePassword, page: ChangePasswordRoute.page),
        AutoRoute(path: rDeactivateAccount, page: DeactivateAccountRoute.page),
        AutoRoute(path: rPrivacyPolicy, page: PrivacPolicyRoute.page),
        AutoRoute(path: rOnBoarding, page: OnBoardingRoute.page),
        AutoRoute(path: rHome, page: HomeRoute.page),
        AutoRoute(path: rJobListPage, page: JobListRoute.page),
        AutoRoute(path: rHotelListPage, page: HotelListRoute.page),
        AutoRoute(path: rEventListPage, page: EventListRoute.page),
        AutoRoute(path: rDestinationListPage, page: DestinationListRoute.page),
        AutoRoute(
            path: rOraganizationListPage, page: OraganizationListRoute.page),
        AutoRoute(page: EventDetailRoute.page),
        AutoRoute(page: JobsDetailRoute.page),
        AutoRoute(page: DestinationDetailRoute.page),
        AutoRoute(page: OrganizationDetailRoute.page),
        AutoRoute(page: HotelDetailRoute.page),
      ];
}  

//flutter packages pub run build_runner watch --delete-conflicting-outputs
//flutter packages pub run build_runner build --delete-conflicting-outputs

// // get the scoped router by calling
// AutoRouter.of(context)
// // or using the extension
// context.router
//
// // adds a new entry to the pages stack
// router.push(const BooksListRoute())
// // or by using using paths
// router.pushNamed('/books')
//
// // removes last entry in stack and pushs provided route
// // if last entry == provided route page will just be updated
// router.replace(const BooksListRoute())
// // or by using using paths
// router.replaceNamed('/books')
//
// // pops until provided route, if it already exists in stack
// // else adds it to the stack (good for web Apps).
// router.navigate(const BooksListRoute())
// // or by using using paths
// router.navigateNamed('/books')
//
// // on Web it calls window.history.back();
// // on Native it navigates you back
// // to the previous location
// router.navigateBack();
//
// // adds a list of routes to the pages stack at once
// router.pushAll([
// BooksListRoute(),
// BookDetailsRoute(id:1),
// ]);

// // This's like providing a completely new stack as it rebuilds the stack
// // with the list of passed routes
// // entires might just update if alright exist
// router.replaceAll([
// LoginRoute()
// ]);
// // pops the last page unless stack has 1 entry
// context.router.pop();
// // keeps poping routes until predicate is satisfied
// context.router.popUntil((route) => route.name == 'HomeRoute');
// // a simplifed version of the above line
// context.router.popUntilRouteWithName('HomeRoute');
// // pops all routes down to the root
// context.router.popUntilRoot();
//
// // removes the top most page in stack even if it's the last
// // remove != pop, it doesn't respect WillPopScopes it just
// // removes the entry.
// context.router.removeLast();
//
// // removes any route in stack that satisfis the predicate
// // this works exactly like removing items from a regualar List
// // <PageRouteInfo>[...].removeWhere((r)=>)
// context.router.removeWhere((route) => );
//
// // you can also use the common helper methods from context extension to navigate
// context.pushRoute(const BooksListRoute());
// context.replaceRoute(const BooksListRoute());
// context.navigateTo(const BooksListRoute());
// context.navigateNamedTo('/books');
// context.navigateBack();
// context.popRoute();
