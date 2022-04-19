import 'package:coffeeshop/core/constants/colorconst.dart';
import 'package:coffeeshop/provider/login_provider.dart';
import 'package:coffeeshop/screens/admin/home_admin_page.dart';
import 'package:coffeeshop/screens/admin/order_admin_page.dart';
import 'package:coffeeshop/widgets/app_bar_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AdminPage extends StatefulWidget {
  const AdminPage({Key? key}) : super(key: key);

  @override
  State<AdminPage> createState() => _AdminPageState();
}

class _AdminPageState extends State<AdminPage>
    with SingleTickerProviderStateMixin {
  TabController? tabController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    tabController = TabController(length: 2, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConst.kScaffoldBackgroundColor,
      appBar: MyAppBar(
          title: "Qahwa Coffee Admin",
          context: context,
          function: () {
            context.read<LoginProvider>().logOut(context);
          }),
      body: TabBarView(
        controller: tabController,
        children: [
          HomeAdminPage(),
          OrderAdminPage()
          ],
      ),
      bottomNavigationBar: TabBar(
        controller: tabController,
        labelColor: ColorConst.kPrimaryColor,
        unselectedLabelColor: Colors.brown.shade200,
        indicatorColor: ColorConst.kPrimaryColor,
        tabs: const [
          Tab(icon: Icon(Icons.home), text: "Home",),
          Tab(icon: Icon(Icons.shopping_basket_outlined), text: "Basket",),
      ]),
    );
  }
}
