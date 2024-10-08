import 'package:alibtisam/features/bottomNav/controller/user.dart';
import 'package:alibtisam/features/store/view/screens/products_tabbar.dart';
import 'package:alibtisam/features/store/view/screens/external_store.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class StoreNavigation extends StatefulWidget {
  const StoreNavigation({super.key});

  @override
  State<StoreNavigation> createState() => _StoreNavigationState();
}

class _StoreNavigationState extends State<StoreNavigation> {
  final userController = Get.find<UserController>();

  @override
  Widget build(BuildContext context) {
    return ProductsTabBar();
  }
}
