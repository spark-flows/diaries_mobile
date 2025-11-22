import 'package:diaries/app/pages/home_screen/screens/order_history_screen.dart';
import 'package:diaries/app/pages/home_screen/screens/productDetail.dart';
import 'package:diaries/app/pages/home_screen/screens/show_options.dart';
import 'package:diaries/app/pages/home_screen/screens/view_pdf.dart';
import 'package:diaries/app/pages/pages.dart';
import 'package:diaries/app/pages/product_development/allocated_to_designer/add_allocated_designer.dart';
import 'package:diaries/app/pages/product_development/allocated_to_designer/allocated_designer_list.dart';
import 'package:diaries/app/pages/product_development/main_product_development.dart';
import 'package:diaries/app/pages/product_development/product_development_page.dart';
import 'package:diaries/app/pages/product_development/add_concept_screen/view_concept.dart';
import 'package:diaries/app/pages/product_development/recive_from_designer/recive_designer_list.dart';
import 'package:diaries/app/pages/profile_screen/profile_bindings.dart';
import 'package:diaries/app/pages/profile_screen/profile_screen.dart';
import 'package:get/get.dart';

import '../pages/home_screen/screens/add_customer.dart';
import '../pages/home_screen/screens/cart_screen.dart';
import '../pages/product_development/add_concept_screen/add_concept.dart';
import '../pages/product_development/add_concept_screen/concept_detail.dart';

part 'app_routes.dart';

class AppPages {
  static var transitionDuration = const Duration(milliseconds: 300);

  static const initial = _Paths.splashScreen;
  static final pages = <GetPage>[
    GetPage<SplashScreen>(
      name: _Paths.splashScreen,
      transitionDuration: transitionDuration,
      page: SplashScreen.new,
      binding: SplashBinding(),
      transition: Transition.fadeIn,
    ),
    GetPage<HomeScreen>(
      name: _Paths.homeScreen,
      transitionDuration: transitionDuration,
      page: HomeScreen.new,
      binding: HomeBinding(),
      transition: Transition.fadeIn,
    ),
    GetPage<ScannerScreen>(
      name: _Paths.scannerScreen,
      transitionDuration: transitionDuration,
      page: ScannerScreen.new,
      binding: HomeBinding(),
      transition: Transition.fadeIn,
    ),
    GetPage<AuthScreen>(
      name: _Paths.authScreen,
      transitionDuration: transitionDuration,
      page: AuthScreen.new,
      binding: AuthBindings(),
      transition: Transition.fadeIn,
    ),
    GetPage<RegisterScreen>(
      name: _Paths.registerScreen,
      transitionDuration: transitionDuration,
      page: RegisterScreen.new,
      binding: AuthBindings(),
      transition: Transition.fadeIn,
    ),
    GetPage<ForgotScreen>(
      name: _Paths.forgotScreen,
      transitionDuration: transitionDuration,
      page: ForgotScreen.new,
      binding: AuthBindings(),
      transition: Transition.fadeIn,
    ),
    GetPage<ResetPasswordScreen>(
      name: _Paths.resetPasswordScreen,
      transitionDuration: transitionDuration,
      page: ResetPasswordScreen.new,
      binding: AuthBindings(),
      transition: Transition.fadeIn,
    ),
    GetPage<ProductDetailScreen>(
      name: _Paths.scannerDetailScreen,
      transitionDuration: transitionDuration,
      page: ProductDetailScreen.new,
      binding: HomeBinding(),
      transition: Transition.fadeIn,
    ),
    GetPage<AddCustomerScreen>(
      name: _Paths.addCustomerScreen,
      transitionDuration: transitionDuration,
      page: AddCustomerScreen.new,
      binding: HomeBinding(),
      transition: Transition.fadeIn,
    ),
    GetPage<SelectOptionsScreen>(
      name: _Paths.selectOptionsScreen,
      transitionDuration: transitionDuration,
      page: SelectOptionsScreen.new,
      binding: HomeBinding(),
      transition: Transition.fadeIn,
    ),
    GetPage<CartScreen>(
      name: _Paths.cartScreen,
      transitionDuration: transitionDuration,
      page: CartScreen.new,
      binding: HomeBinding(),
      transition: Transition.fadeIn,
    ),
    GetPage<OrderHistoyScreen>(
      name: _Paths.orderHistoryScreen,
      transitionDuration: transitionDuration,
      page: OrderHistoyScreen.new,
      binding: HomeBinding(),
      transition: Transition.fadeIn,
    ),
    GetPage<ViewPDFinFullScreen>(
      name: _Paths.viewPDFScreen,
      transitionDuration: transitionDuration,
      page: ViewPDFinFullScreen.new,
      binding: HomeBinding(),
      transition: Transition.fadeIn,
    ),
    GetPage<ProfileScreen>(
      name: _Paths.profileScreen,
      transitionDuration: transitionDuration,
      page: ProfileScreen.new,
      binding: ProfileBindings(),
      transition: Transition.fadeIn,
    ),
    GetPage<PDevelopmentScreen>(
      name: _Paths.pDevelopment,
      transitionDuration: transitionDuration,
      page: PDevelopmentScreen.new,
      binding: PDevelopmentBinding(),
      transition: Transition.fadeIn,
    ),
    GetPage<AddConceptScreen>(
      name: _Paths.addConceptScreen,
      transitionDuration: transitionDuration,
      page: AddConceptScreen.new,
      binding: PDevelopmentBinding(),
      transition: Transition.fadeIn,
    ),
    GetPage<ConceptDetailScreen>(
      name: _Paths.conceptDetailScreen,
      transitionDuration: transitionDuration,
      page: ConceptDetailScreen.new,
      binding: PDevelopmentBinding(),
      transition: Transition.fadeIn,
    ),
    GetPage<ViewConceptScreen>(
      name: _Paths.viewConceptScreen,
      transitionDuration: transitionDuration,
      page: ViewConceptScreen.new,
      binding: PDevelopmentBinding(),
      transition: Transition.fadeIn,
    ),
    GetPage<MainProductDevelopment>(
      name: _Paths.mainProductDevelopment,
      transitionDuration: transitionDuration,
      page: MainProductDevelopment.new,
      binding: PDevelopmentBinding(),
      transition: Transition.fadeIn,
    ),
    GetPage<AllocatedDesignerList>(
      name: _Paths.allocatedDesignerList,
      transitionDuration: transitionDuration,
      page: AllocatedDesignerList.new,
      binding: PDevelopmentBinding(),
      transition: Transition.fadeIn,
    ),
    GetPage<EditAllocatedScreen>(
      name: _Paths.editAllocatedScreen,
      transitionDuration: transitionDuration,
      page: EditAllocatedScreen.new,
      binding: PDevelopmentBinding(),
      transition: Transition.fadeIn,
    ),
    GetPage<ReciveDesignerList>(
      name: _Paths.reciveDesignerList,
      transitionDuration: transitionDuration,
      page: ReciveDesignerList.new,
      binding: PDevelopmentBinding(),
      transition: Transition.fadeIn,
    ),
  ];
}
