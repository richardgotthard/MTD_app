import 'package:flutter/material.dart';
import 'package:mtd_app/models/mount_model.dart';

import 'notificationscreen.dart';

class AppMountListView extends StatelessWidget {
  const AppMountListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 150,
      child: ListView.builder(
        reverse: false,
        scrollDirection: Axis.horizontal,
        itemCount: mountItems.length,
        itemBuilder: (context, index) {
          final currentMount = mountItems[index];
          return GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => NotificationScreen(
                      image: mountItems[index].path,
                      name: mountItems[index].name,
                      description: mountItems[index].description,
                      location: mountItems[index].location,
                    ),
                  ),
                );
              },
              child: Container(
                alignment: Alignment.bottomLeft,
                padding: const EdgeInsets.all(20),
                margin: const EdgeInsets.all(20),
                width: 150,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage(currentMount.path),
                    fit: BoxFit.cover,
                  ),
                  borderRadius: BorderRadius.circular(16),
                ),
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => NotificationScreen(
                          image: mountItems[index].path,
                          name: mountItems[index].name,
                          description: mountItems[index].description,
                          location: mountItems[index].location,
                        ),
                      ),
                    );
                  },
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        currentMount.name,
                        style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        currentMount.location,
                        style: const TextStyle(color: Colors.white),
                      ),
                    ],
                  ),
                ),
              ));
        },
      ),
    );
  }
}
