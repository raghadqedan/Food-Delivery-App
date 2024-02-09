import 'package:flutter/material.dart';
import 'package:food_delivary_app/utils/app_colors.dart';

import '../widgets/profile_item.dart';


class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Column(children: [
        Row(
          children: [
            CircleAvatar(
                radius: 35,
                backgroundColor: Theme.of(context).primaryColor,
                child: const Icon(
                  Icons.person,
                  size: 60,
                )),
            const SizedBox(
              width: 40,
            ),
            Column(
              children: [
                Text("Raghad qedan ",
                    style: Theme.of(context)
                        .textTheme
                        .bodyLarge!
                        .copyWith(fontWeight: FontWeight.bold)),
                Text("ID:204 222 881",
                    style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                          color: AppColors.grey,
                        ))
              ],
            ),
            const SizedBox(
              width: 50,
            ),
            TextButton(onPressed: () {}, child: const Text("Edit Profile")),
          ],
        ),
        const SizedBox(height: 30),
         Divider(
          height: 12,
          color: Theme.of(context).primaryColor,
        ),
       const  ProfileItem(name: 'My Profile'),
        Divider(
          height: 12,
          color: Theme.of(context).primaryColor,
        ),
        const ProfileItem(name: 'Payment Methods'),
        Divider(
          height: 12,
          color: Theme.of(context).primaryColor,
        ),
       const  ProfileItem(name: 'Setting'),
        Divider(
          height: 12,
          color: Theme.of(context).primaryColor,
        ),
        const ProfileItem(name: 'Help'),
        Divider(
          height: 12,
          color: Theme.of(context).primaryColor,
        ),
        const ProfileItem(name: 'PrivacyPolicy'),
        Divider(
          height: 12,
          color: Theme.of(context).primaryColor,
        ),
        const SizedBox(height: 60),
        SizedBox(
          width: 300,
          child: ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
                backgroundColor: Theme.of(context).primaryColor,
                foregroundColor: AppColors.wight,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12))),
            child: const Text("Log Out"),
          ),
        ),
      ]),
    );
  }
}
