import 'package:cartify/common/widgets/appbar/appbar.dart';
import 'package:cartify/features/shop/screens/order/widgets/orders_list.dart';
import 'package:cartify/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

class OrderScreen extends StatelessWidget {
  const OrderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //-- AppBar---
      appBar: TAppBar(title: Text('My Order', style: Theme.of(context).textTheme.headlineSmall), showBackArrow: true),
      body: const Padding(padding: EdgeInsets.all(TSizes.defaultSpace),

      //--- Order---
      child: TOrderListItems(),
      ),
    );
  }
}