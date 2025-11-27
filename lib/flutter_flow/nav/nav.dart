import 'dart:async';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '/backend/backend.dart';

import '/auth/base_auth_user_provider.dart';

import '/backend/push_notifications/push_notifications_handler.dart'
    show PushNotificationsHandler;
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';

import '/index.dart';

export 'package:go_router/go_router.dart';
export 'serialization_util.dart';

const kTransitionInfoKey = '__transition_info__';

GlobalKey<NavigatorState> appNavigatorKey = GlobalKey<NavigatorState>();

class AppStateNotifier extends ChangeNotifier {
  AppStateNotifier._();

  static AppStateNotifier? _instance;
  static AppStateNotifier get instance => _instance ??= AppStateNotifier._();

  BaseAuthUser? initialUser;
  BaseAuthUser? user;
  bool showSplashImage = true;
  String? _redirectLocation;

  /// Determines whether the app will refresh and build again when a sign
  /// in or sign out happens. This is useful when the app is launched or
  /// on an unexpected logout. However, this must be turned off when we
  /// intend to sign in/out and then navigate or perform any actions after.
  /// Otherwise, this will trigger a refresh and interrupt the action(s).
  bool notifyOnAuthChange = true;

  bool get loading => user == null || showSplashImage;
  bool get loggedIn => user?.loggedIn ?? false;
  bool get initiallyLoggedIn => initialUser?.loggedIn ?? false;
  bool get shouldRedirect => loggedIn && _redirectLocation != null;

  String getRedirectLocation() => _redirectLocation!;
  bool hasRedirect() => _redirectLocation != null;
  void setRedirectLocationIfUnset(String loc) => _redirectLocation ??= loc;
  void clearRedirectLocation() => _redirectLocation = null;

  /// Mark as not needing to notify on a sign in / out when we intend
  /// to perform subsequent actions (such as navigation) afterwards.
  void updateNotifyOnAuthChange(bool notify) => notifyOnAuthChange = notify;

  void update(BaseAuthUser newUser) {
    final shouldUpdate =
        user?.uid == null || newUser.uid == null || user?.uid != newUser.uid;
    initialUser ??= newUser;
    user = newUser;
    // Refresh the app on auth change unless explicitly marked otherwise.
    // No need to update unless the user has changed.
    if (notifyOnAuthChange && shouldUpdate) {
      notifyListeners();
    }
    // Once again mark the notifier as needing to update on auth change
    // (in order to catch sign in / out events).
    updateNotifyOnAuthChange(true);
  }

  void stopShowingSplashImage() {
    showSplashImage = false;
    notifyListeners();
  }
}

GoRouter createRouter(AppStateNotifier appStateNotifier) => GoRouter(
      initialLocation: '/',
      debugLogDiagnostics: true,
      refreshListenable: appStateNotifier,
      navigatorKey: appNavigatorKey,
      errorBuilder: (context, state) =>
          appStateNotifier.loggedIn ? MainWidget() : StartpageWidget(),
      routes: [
        FFRoute(
          name: '_initialize',
          path: '/',
          builder: (context, _) =>
              appStateNotifier.loggedIn ? MainWidget() : StartpageWidget(),
        ),
        FFRoute(
          name: StartpageWidget.routeName,
          path: StartpageWidget.routePath,
          builder: (context, params) => StartpageWidget(),
        ),
        FFRoute(
          name: OnboardingWidget.routeName,
          path: OnboardingWidget.routePath,
          builder: (context, params) => OnboardingWidget(),
        ),
        FFRoute(
          name: EnterPhoneWidget.routeName,
          path: EnterPhoneWidget.routePath,
          builder: (context, params) => EnterPhoneWidget(),
        ),
        FFRoute(
          name: SmsverificationWidget.routeName,
          path: SmsverificationWidget.routePath,
          builder: (context, params) => SmsverificationWidget(
            phone: params.getParam(
              'phone',
              ParamType.String,
            ),
          ),
        ),
        FFRoute(
          name: EnterEditProfileWidget.routeName,
          path: EnterEditProfileWidget.routePath,
          builder: (context, params) => EnterEditProfileWidget(),
        ),
        FFRoute(
          name: MainWidget.routeName,
          path: MainWidget.routePath,
          requireAuth: true,
          builder: (context, params) => MainWidget(),
        ),
        FFRoute(
          name: MapFilterWidget.routeName,
          path: MapFilterWidget.routePath,
          builder: (context, params) => MapFilterWidget(),
        ),
        FFRoute(
          name: SearchResultWidget.routeName,
          path: SearchResultWidget.routePath,
          builder: (context, params) => SearchResultWidget(),
        ),
        FFRoute(
          name: AllFilterWidget.routeName,
          path: AllFilterWidget.routePath,
          builder: (context, params) => AllFilterWidget(),
        ),
        FFRoute(
          name: MyProfileWidget.routeName,
          path: MyProfileWidget.routePath,
          builder: (context, params) => MyProfileWidget(),
        ),
        FFRoute(
          name: EditProfileWidget.routeName,
          path: EditProfileWidget.routePath,
          requireAuth: true,
          builder: (context, params) => EditProfileWidget(),
        ),
        FFRoute(
          name: AdminPageLoginWidget.routeName,
          path: AdminPageLoginWidget.routePath,
          builder: (context, params) => AdminPageLoginWidget(),
        ),
        FFRoute(
          name: CreateRecordWidget.routeName,
          path: CreateRecordWidget.routePath,
          requireAuth: true,
          asyncParams: {
            'initialServ': getDoc(['services'], ServicesRecord.fromSnapshot),
            'organisationCard': getDoc(['masters'], MastersRecord.fromSnapshot),
            'records': getDocList(['records'], RecordsRecord.fromSnapshot),
          },
          builder: (context, params) => CreateRecordWidget(
            initialServ: params.getParam(
              'initialServ',
              ParamType.Document,
            ),
            organisationCard: params.getParam(
              'organisationCard',
              ParamType.Document,
            ),
            records: params.getParam<RecordsRecord>(
              'records',
              ParamType.Document,
              isList: true,
            ),
          ),
        ),
        FFRoute(
          name: AdminMainProfileWidget.routeName,
          path: AdminMainProfileWidget.routePath,
          requireAuth: true,
          builder: (context, params) => AdminMainProfileWidget(),
        ),
        FFRoute(
          name: AdminPageRegistrationWidget.routeName,
          path: AdminPageRegistrationWidget.routePath,
          builder: (context, params) => AdminPageRegistrationWidget(),
        ),
        FFRoute(
          name: AdminCategoryWidget.routeName,
          path: AdminCategoryWidget.routePath,
          requireAuth: true,
          builder: (context, params) => AdminCategoryWidget(),
        ),
        FFRoute(
          name: MasterPageWidget.routeName,
          path: MasterPageWidget.routePath,
          builder: (context, params) => MasterPageWidget(
            master: params.getParam(
              'master',
              ParamType.DocumentReference,
              isList: false,
              collectionNamePath: ['masters'],
            ),
          ),
        ),
        FFRoute(
          name: CreateDebateWidget.routeName,
          path: CreateDebateWidget.routePath,
          requireAuth: true,
          asyncParams: {
            'recordDOc': getDoc(['records'], RecordsRecord.fromSnapshot),
            'servDoc': getDoc(['services'], ServicesRecord.fromSnapshot),
            'masrterDoc': getDoc(['masters'], MastersRecord.fromSnapshot),
          },
          builder: (context, params) => CreateDebateWidget(
            recordDOc: params.getParam(
              'recordDOc',
              ParamType.Document,
            ),
            servDoc: params.getParam(
              'servDoc',
              ParamType.Document,
            ),
            masrterDoc: params.getParam(
              'masrterDoc',
              ParamType.Document,
            ),
          ),
        ),
        FFRoute(
          name: ServicePageZWidget.routeName,
          path: ServicePageZWidget.routePath,
          builder: (context, params) => ServicePageZWidget(
            servRef: params.getParam(
              'servRef',
              ParamType.DocumentReference,
              isList: false,
              collectionNamePath: ['services'],
            ),
          ),
        ),
        FFRoute(
          name: MasterCreateWidget.routeName,
          path: MasterCreateWidget.routePath,
          builder: (context, params) => MasterCreateWidget(),
        ),
        FFRoute(
          name: MyRecordsWidget.routeName,
          path: MyRecordsWidget.routePath,
          builder: (context, params) => MyRecordsWidget(),
        ),
        FFRoute(
          name: RecordPageWidget.routeName,
          path: RecordPageWidget.routePath,
          builder: (context, params) => RecordPageWidget(
            recordRef: params.getParam(
              'recordRef',
              ParamType.DocumentReference,
              isList: false,
              collectionNamePath: ['records'],
            ),
          ),
        ),
        FFRoute(
          name: AdminServiceListWidget.routeName,
          path: AdminServiceListWidget.routePath,
          requireAuth: true,
          asyncParams: {
            'catDoc': getDoc(['category'], CategoryRecord.fromSnapshot),
          },
          builder: (context, params) => AdminServiceListWidget(
            catDoc: params.getParam(
              'catDoc',
              ParamType.Document,
            ),
          ),
        ),
        FFRoute(
          name: AdminPacketListWidget.routeName,
          path: AdminPacketListWidget.routePath,
          requireAuth: true,
          asyncParams: {
            'catDoc': getDoc(['category'], CategoryRecord.fromSnapshot),
          },
          builder: (context, params) => AdminPacketListWidget(
            catDoc: params.getParam(
              'catDoc',
              ParamType.Document,
            ),
          ),
        ),
        FFRoute(
          name: MasterCreateServiceWidget.routeName,
          path: MasterCreateServiceWidget.routePath,
          builder: (context, params) => MasterCreateServiceWidget(
            choosenCat: params.getParam<DocumentReference>(
              'choosenCat',
              ParamType.DocumentReference,
              isList: true,
              collectionNamePath: ['category'],
            ),
          ),
        ),
        FFRoute(
          name: MasterWorkScheduleWidget.routeName,
          path: MasterWorkScheduleWidget.routePath,
          builder: (context, params) => MasterWorkScheduleWidget(),
        ),
        FFRoute(
          name: MasterChooseCatWidget.routeName,
          path: MasterChooseCatWidget.routePath,
          builder: (context, params) => MasterChooseCatWidget(),
        ),
        FFRoute(
          name: CabinetWidget.routeName,
          path: CabinetWidget.routePath,
          builder: (context, params) => CabinetWidget(),
        ),
        FFRoute(
          name: ReservePageWidget.routeName,
          path: ReservePageWidget.routePath,
          builder: (context, params) => ReservePageWidget(
            recordRef: params.getParam(
              'recordRef',
              ParamType.DocumentReference,
              isList: false,
              collectionNamePath: ['records'],
            ),
          ),
        ),
        FFRoute(
          name: MasterAddServiceWidget.routeName,
          path: MasterAddServiceWidget.routePath,
          asyncParams: {
            'masterRef': getDoc(['masters'], MastersRecord.fromSnapshot),
          },
          builder: (context, params) => MasterAddServiceWidget(
            choosenCat: params.getParam<DocumentReference>(
              'choosenCat',
              ParamType.DocumentReference,
              isList: true,
              collectionNamePath: ['category'],
            ),
            masterRef: params.getParam(
              'masterRef',
              ParamType.Document,
            ),
          ),
        ),
        FFRoute(
          name: MasterChooseCatAddServWidget.routeName,
          path: MasterChooseCatAddServWidget.routePath,
          asyncParams: {
            'masterRef': getDoc(['masters'], MastersRecord.fromSnapshot),
          },
          builder: (context, params) => MasterChooseCatAddServWidget(
            masterRef: params.getParam(
              'masterRef',
              ParamType.Document,
            ),
          ),
        ),
        FFRoute(
          name: MyChatsWidget.routeName,
          path: MyChatsWidget.routePath,
          builder: (context, params) => MyChatsWidget(),
        ),
        FFRoute(
          name: CchatWindowWidget.routeName,
          path: CchatWindowWidget.routePath,
          asyncParams: {
            'chatDocument': getDoc(['chat'], ChatRecord.fromSnapshot),
          },
          builder: (context, params) => CchatWindowWidget(
            chatDocument: params.getParam(
              'chatDocument',
              ParamType.Document,
            ),
          ),
        ),
        FFRoute(
          name: ReviewsWidget.routeName,
          path: ReviewsWidget.routePath,
          builder: (context, params) => ReviewsWidget(),
        ),
        FFRoute(
          name: CreateReviewWidget.routeName,
          path: CreateReviewWidget.routePath,
          asyncParams: {
            'record': getDoc(['records'], RecordsRecord.fromSnapshot),
          },
          builder: (context, params) => CreateReviewWidget(
            record: params.getParam(
              'record',
              ParamType.Document,
            ),
          ),
        ),
        FFRoute(
          name: MasterSearchWidget.routeName,
          path: MasterSearchWidget.routePath,
          builder: (context, params) => MasterSearchWidget(),
        ),
        FFRoute(
          name: MasterPageOfferWidget.routeName,
          path: MasterPageOfferWidget.routePath,
          builder: (context, params) => MasterPageOfferWidget(
            master: params.getParam(
              'master',
              ParamType.DocumentReference,
              isList: false,
              collectionNamePath: ['masters'],
            ),
          ),
        ),
        FFRoute(
          name: FavoriteMastersWidget.routeName,
          path: FavoriteMastersWidget.routePath,
          builder: (context, params) => FavoriteMastersWidget(),
        ),
        FFRoute(
          name: MasterOfferOrganisationWidget.routeName,
          path: MasterOfferOrganisationWidget.routePath,
          asyncParams: {
            'organisation': getDoc(['masters'], MastersRecord.fromSnapshot),
          },
          builder: (context, params) => MasterOfferOrganisationWidget(
            organisation: params.getParam(
              'organisation',
              ParamType.Document,
            ),
          ),
        ),
        FFRoute(
          name: MasterOfferSetServWidget.routeName,
          path: MasterOfferSetServWidget.routePath,
          asyncParams: {
            'organisation': getDoc(['masters'], MastersRecord.fromSnapshot),
          },
          builder: (context, params) => MasterOfferSetServWidget(
            organisation: params.getParam(
              'organisation',
              ParamType.Document,
            ),
          ),
        ),
        FFRoute(
          name: SubbscribesWidget.routeName,
          path: SubbscribesWidget.routePath,
          builder: (context, params) => SubbscribesWidget(),
        ),
        FFRoute(
          name: ChooseSubbscribesWidget.routeName,
          path: ChooseSubbscribesWidget.routePath,
          asyncParams: {
            'master': getDoc(['masters'], MastersRecord.fromSnapshot),
            'tarif': getDoc(['tarif'], TarifRecord.fromSnapshot),
          },
          builder: (context, params) => ChooseSubbscribesWidget(
            master: params.getParam(
              'master',
              ParamType.Document,
            ),
            tarif: params.getParam(
              'tarif',
              ParamType.Document,
            ),
          ),
        ),
        FFRoute(
          name: AdminOrdersWidget.routeName,
          path: AdminOrdersWidget.routePath,
          requireAuth: true,
          builder: (context, params) => AdminOrdersWidget(),
        ),
        FFRoute(
          name: AdminServicePageWidget.routeName,
          path: AdminServicePageWidget.routePath,
          requireAuth: true,
          builder: (context, params) => AdminServicePageWidget(
            serviceRef: params.getParam(
              'serviceRef',
              ParamType.DocumentReference,
              isList: false,
              collectionNamePath: ['services'],
            ),
          ),
        ),
        FFRoute(
          name: PoliticWidget.routeName,
          path: PoliticWidget.routePath,
          builder: (context, params) => PoliticWidget(),
        ),
        FFRoute(
          name: UserAgreevmentWidget.routeName,
          path: UserAgreevmentWidget.routePath,
          builder: (context, params) => UserAgreevmentWidget(),
        ),
        FFRoute(
          name: AdminMoneyWidget.routeName,
          path: AdminMoneyWidget.routePath,
          requireAuth: true,
          builder: (context, params) => AdminMoneyWidget(),
        ),
        FFRoute(
          name: AdminCChatsWidget.routeName,
          path: AdminCChatsWidget.routePath,
          requireAuth: true,
          builder: (context, params) => AdminCChatsWidget(),
        )
      ].map((r) => r.toRoute(appStateNotifier)).toList(),
    );

extension NavParamExtensions on Map<String, String?> {
  Map<String, String> get withoutNulls => Map.fromEntries(
        entries
            .where((e) => e.value != null)
            .map((e) => MapEntry(e.key, e.value!)),
      );
}

extension NavigationExtensions on BuildContext {
  void goNamedAuth(
    String name,
    bool mounted, {
    Map<String, String> pathParameters = const <String, String>{},
    Map<String, String> queryParameters = const <String, String>{},
    Object? extra,
    bool ignoreRedirect = false,
  }) =>
      !mounted || GoRouter.of(this).shouldRedirect(ignoreRedirect)
          ? null
          : goNamed(
              name,
              pathParameters: pathParameters,
              queryParameters: queryParameters,
              extra: extra,
            );

  void pushNamedAuth(
    String name,
    bool mounted, {
    Map<String, String> pathParameters = const <String, String>{},
    Map<String, String> queryParameters = const <String, String>{},
    Object? extra,
    bool ignoreRedirect = false,
  }) =>
      !mounted || GoRouter.of(this).shouldRedirect(ignoreRedirect)
          ? null
          : pushNamed(
              name,
              pathParameters: pathParameters,
              queryParameters: queryParameters,
              extra: extra,
            );

  void safePop() {
    // If there is only one route on the stack, navigate to the initial
    // page instead of popping.
    if (canPop()) {
      pop();
    } else {
      go('/');
    }
  }
}

extension GoRouterExtensions on GoRouter {
  AppStateNotifier get appState => AppStateNotifier.instance;
  void prepareAuthEvent([bool ignoreRedirect = false]) =>
      appState.hasRedirect() && !ignoreRedirect
          ? null
          : appState.updateNotifyOnAuthChange(false);
  bool shouldRedirect(bool ignoreRedirect) =>
      !ignoreRedirect && appState.hasRedirect();
  void clearRedirectLocation() => appState.clearRedirectLocation();
  void setRedirectLocationIfUnset(String location) =>
      appState.updateNotifyOnAuthChange(false);
}

extension _GoRouterStateExtensions on GoRouterState {
  Map<String, dynamic> get extraMap =>
      extra != null ? extra as Map<String, dynamic> : {};
  Map<String, dynamic> get allParams => <String, dynamic>{}
    ..addAll(pathParameters)
    ..addAll(uri.queryParameters)
    ..addAll(extraMap);
  TransitionInfo get transitionInfo => extraMap.containsKey(kTransitionInfoKey)
      ? extraMap[kTransitionInfoKey] as TransitionInfo
      : TransitionInfo.appDefault();
}

class FFParameters {
  FFParameters(this.state, [this.asyncParams = const {}]);

  final GoRouterState state;
  final Map<String, Future<dynamic> Function(String)> asyncParams;

  Map<String, dynamic> futureParamValues = {};

  // Parameters are empty if the params map is empty or if the only parameter
  // present is the special extra parameter reserved for the transition info.
  bool get isEmpty =>
      state.allParams.isEmpty ||
      (state.allParams.length == 1 &&
          state.extraMap.containsKey(kTransitionInfoKey));
  bool isAsyncParam(MapEntry<String, dynamic> param) =>
      asyncParams.containsKey(param.key) && param.value is String;
  bool get hasFutures => state.allParams.entries.any(isAsyncParam);
  Future<bool> completeFutures() => Future.wait(
        state.allParams.entries.where(isAsyncParam).map(
          (param) async {
            final doc = await asyncParams[param.key]!(param.value)
                .onError((_, __) => null);
            if (doc != null) {
              futureParamValues[param.key] = doc;
              return true;
            }
            return false;
          },
        ),
      ).onError((_, __) => [false]).then((v) => v.every((e) => e));

  dynamic getParam<T>(
    String paramName,
    ParamType type, {
    bool isList = false,
    List<String>? collectionNamePath,
    StructBuilder<T>? structBuilder,
  }) {
    if (futureParamValues.containsKey(paramName)) {
      return futureParamValues[paramName];
    }
    if (!state.allParams.containsKey(paramName)) {
      return null;
    }
    final param = state.allParams[paramName];
    // Got parameter from `extras`, so just directly return it.
    if (param is! String) {
      return param;
    }
    // Return serialized value.
    return deserializeParam<T>(
      param,
      type,
      isList,
      collectionNamePath: collectionNamePath,
      structBuilder: structBuilder,
    );
  }
}

class FFRoute {
  const FFRoute({
    required this.name,
    required this.path,
    required this.builder,
    this.requireAuth = false,
    this.asyncParams = const {},
    this.routes = const [],
  });

  final String name;
  final String path;
  final bool requireAuth;
  final Map<String, Future<dynamic> Function(String)> asyncParams;
  final Widget Function(BuildContext, FFParameters) builder;
  final List<GoRoute> routes;

  GoRoute toRoute(AppStateNotifier appStateNotifier) => GoRoute(
        name: name,
        path: path,
        redirect: (context, state) {
          if (appStateNotifier.shouldRedirect) {
            final redirectLocation = appStateNotifier.getRedirectLocation();
            appStateNotifier.clearRedirectLocation();
            return redirectLocation;
          }

          if (requireAuth && !appStateNotifier.loggedIn) {
            appStateNotifier.setRedirectLocationIfUnset(state.uri.toString());
            return '/startpage';
          }
          return null;
        },
        pageBuilder: (context, state) {
          fixStatusBarOniOS16AndBelow(context);
          final ffParams = FFParameters(state, asyncParams);
          final page = ffParams.hasFutures
              ? FutureBuilder(
                  future: ffParams.completeFutures(),
                  builder: (context, _) => builder(context, ffParams),
                )
              : builder(context, ffParams);
          final child = appStateNotifier.loading
              ? Container(
                  color: FlutterFlowTheme.of(context).secondary,
                  child: Center(
                    child: Image.asset(
                      'assets/images/Frame_1851040970.png',
                      width: 300.0,
                      fit: BoxFit.fitWidth,
                    ),
                  ),
                )
              : PushNotificationsHandler(child: page);

          final transitionInfo = state.transitionInfo;
          return transitionInfo.hasTransition
              ? CustomTransitionPage(
                  key: state.pageKey,
                  child: child,
                  transitionDuration: transitionInfo.duration,
                  transitionsBuilder:
                      (context, animation, secondaryAnimation, child) =>
                          PageTransition(
                    type: transitionInfo.transitionType,
                    duration: transitionInfo.duration,
                    reverseDuration: transitionInfo.duration,
                    alignment: transitionInfo.alignment,
                    child: child,
                  ).buildTransitions(
                    context,
                    animation,
                    secondaryAnimation,
                    child,
                  ),
                )
              : MaterialPage(key: state.pageKey, child: child);
        },
        routes: routes,
      );
}

class TransitionInfo {
  const TransitionInfo({
    required this.hasTransition,
    this.transitionType = PageTransitionType.fade,
    this.duration = const Duration(milliseconds: 300),
    this.alignment,
  });

  final bool hasTransition;
  final PageTransitionType transitionType;
  final Duration duration;
  final Alignment? alignment;

  static TransitionInfo appDefault() => TransitionInfo(hasTransition: false);
}

class RootPageContext {
  const RootPageContext(this.isRootPage, [this.errorRoute]);
  final bool isRootPage;
  final String? errorRoute;

  static bool isInactiveRootPage(BuildContext context) {
    final rootPageContext = context.read<RootPageContext?>();
    final isRootPage = rootPageContext?.isRootPage ?? false;
    final location = GoRouterState.of(context).uri.toString();
    return isRootPage &&
        location != '/' &&
        location != rootPageContext?.errorRoute;
  }

  static Widget wrap(Widget child, {String? errorRoute}) => Provider.value(
        value: RootPageContext(true, errorRoute),
        child: child,
      );
}

extension GoRouterLocationExtension on GoRouter {
  String getCurrentLocation() {
    final RouteMatch lastMatch = routerDelegate.currentConfiguration.last;
    final RouteMatchList matchList = lastMatch is ImperativeRouteMatch
        ? lastMatch.matches
        : routerDelegate.currentConfiguration;
    return matchList.uri.toString();
  }
}
