import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:delivery_app/src/pages/delivery/orders/list/delivery_orders_list_controller.dart';

class DeliveryOrdersListPage extends StatelessWidget {

  DeliveryOrdersListController con = Get.put(DeliveryOrdersListController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('Delivery Orders List'),
      ),
    );
  }
}
