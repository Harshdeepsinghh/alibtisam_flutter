import 'package:alibtisam/core/common/widgets/custom_container_button.dart';
import 'package:alibtisam/core/common/widgets/custom_gradient_button.dart';
import 'package:alibtisam/core/common/widgets/custom_text_field.dart';
import 'package:alibtisam/core/localStorage/token_id.dart';
import 'package:alibtisam/core/utils/custom_snackbar.dart';
import 'package:alibtisam/features/auth/view/screens/login.dart';
import 'package:alibtisam/features/bottomNav/presentation/userDashboard/presentation/store/models/product_model.dart';
import 'package:alibtisam/features/bottomNav/presentation/userDashboard/presentation/store/viewmodel/products_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';

class BuyForExternalUser extends StatefulWidget {
  final List product;
  const BuyForExternalUser({
    super.key,
    required this.product,
  });

  @override
  State<BuyForExternalUser> createState() => _BuyForExternalUserState();
}

class _BuyForExternalUserState extends State<BuyForExternalUser> {
  int quantity = 1;
  num price = 0;
  @override
  void initState() {
    super.initState();
    calculateTotalPrice();
  }

//   setPrice() {
//     setState(() {
//       price = widget.product.price * quantity;
//     });
//   }
  calculateTotalPrice() {
    num totalPrice = 0.0;
    for (var item in widget.product) {
      totalPrice += item['price'] * item['quantity'];
    }
    total = totalPrice;
    setState(() {});
  }

  num total = 0;
  final address = TextEditingController();
  final productsViewmodel = Get.find<ProductsViewmodel>();
  final formkey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Form(
      key: formkey,
      child: Scaffold(
        appBar: AppBar(
          title: Text("Place Order"),
        ),
        bottomNavigationBar: Obx(
          () => CustomContainerButton(
            loading: productsViewmodel.loading.value,
            onTap: () async {
              if (formkey.currentState!.validate()) {
                Logger().w(widget.product);
                String? token = await getToken();
                if (token == null) {
                  Get.to(() => LoginScreen());
                  customSnackbar(
                      message: 'Please login to order this product.');
                } else {
                  await productsViewmodel.orderProductForExternalUser(
                    product: widget.product,
                    price: price,
                    deliveryAddress: address.text,
                  );
                }
              }
            },
            flexibleHeight: 60,
            label: 'Confirm',
          ),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Address',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w800),
                ),
                CustomTextField(
                  controller: address,
                  label: 'Enter Your address',
                  maxLines: 3,
                ),
                Text(
                  'Total price',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w800),
                ),
                Text(total.toString() + " SAR"),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
