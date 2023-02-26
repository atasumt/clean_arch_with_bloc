import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_project/app/const/design/const_design.dart';
import 'package:flutter_project/app/const/route/route_name.dart';
import 'package:flutter_project/core/service_locator.dart';
import 'package:flutter_project/features/homepage/data/models/user/user_model.dart';
import 'package:flutter_project/services/user_cache_service.dart';

class HomepageDrawer extends StatelessWidget {
  const HomepageDrawer({Key? key, required this.user}) : super(key: key);
  final User user;
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          UserAccountsDrawerHeader(
            currentAccountPicture: CircleAvatar(
              backgroundImage: NetworkImage(
                user.image,
              ),
            ),
            accountName: Text(user.firstName),
            accountEmail: Text(user.email),
          ),
          ElevatedButton(
            onPressed: () {
              serviceLocator<UserCacheService>().deleteUser();
              AutoRouter.of(context).pushNamed(RouteName.autRouteName);
            },
            child: Text(
              'Çıkış',
              style: Theme.of(context).textTheme.labelLarge,
            ),
            style: ButtonStyle(
              shape: MaterialStateProperty.all<OutlinedBorder>(RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              )),
              backgroundColor: MaterialStateProperty.all<Color>(kSecondaryColor),
            ),
          )
        ],
      ),
    );
  }
}
