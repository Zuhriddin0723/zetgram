import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:gap/gap.dart';
import 'package:zetgram/src/app_theme/app_icons.dart';
import 'package:zetgram/src/app_theme/app_images.dart';
import 'package:zetgram/src/app_theme/app_style.dart';
import 'package:zetgram/src/ui/main/explore/porofil/profil_screen.dart';

class ExploreScreen extends StatefulWidget {
  const ExploreScreen({super.key});

  @override
  State<ExploreScreen> createState() => _ExploreScreenState();
}

bool isSearching = false;
final TextEditingController _searchController = TextEditingController();

class _ExploreScreenState extends State<ExploreScreen> {
  List profile = [
    {
      "pic": AppImages.chat_image1,
      "name": "Jacob Howard",
      "title": "@ramsay1snow",
    },
    {"pic": AppImages.vid1, "name": "Arthur Black", "title": "@ramsay1snow"},
    {
      "pic": AppImages.chat_image3,
      "name": "Diane Richards",
      "title": "@ramsay1snow",
    },
    {"pic": AppImages.vid2, "name": "Sansa Indira", "title": "@ramsay1snow"},
    {"pic": AppImages.user, "name": "Davos Edwards", "title": "@ramsay1snow"},
    {
      "pic": AppImages.chat_image2,
      "name": "Jorge Cooper",
      "title": "@ramsay1snow",
    },
  ];
  List<String> img = [
    AppImages.one,
    AppImages.two,
    AppImages.three,
    AppImages.four,
    AppImages.five,
    AppImages.six,
    AppImages.seven,
    AppImages.eight,
    AppImages.nine,
    AppImages.ten,
    AppImages.eleven,
    AppImages.twelve,
    AppImages.one_,
    AppImages.two_,
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: isSearching
            ? IconButton(
                icon: Image.asset(AppIcons.x, color: Colors.black),
                onPressed: () {
                  setState(() {
                    isSearching = false;
                    _searchController.clear();
                  });
                },
              )
            : null,

        title: isSearching
            ? TextField(
                controller: _searchController,
                autofocus: true,
                decoration: const InputDecoration(
                  hintText: 'Search...',
                  border: InputBorder.none,
                ),
                onChanged: (_) => setState(() {}),
              )
            : Text('Explore', style: AppStyle.agBoldH1(color: Colors.black)),

        actions: [
          if (!isSearching)
            IconButton(
              icon: Image.asset(AppIcons.search, color: Colors.black),
              onPressed: () {
                setState(() {
                  isSearching = true;
                });
              },
            ),
        ],
      ),

      body: _searchController.text.isEmpty
          ? Padding(
              padding: const EdgeInsets.all(10),
              child: StaggeredGrid.count(
                crossAxisCount: 2,
                mainAxisSpacing: 8,
                crossAxisSpacing: 8,
                children: List.generate(img.length, (index) {
                  return ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: Image.asset(img[index], fit: BoxFit.cover),
                  );
                }),
              ),
            )
          : ListView.builder(
              itemCount: profile.length,
              itemBuilder: (context, index) {
                if (profile[index]["name"].toLowerCase().contains(
                  _searchController.text.toLowerCase(),
                )) {
                  return InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (ctx) => ProfilScreen(
                            name: profile[index]["name"],
                            pic: profile[index]["pic"],
                            title: profile[index]["title"],
                          ),
                        ),
                      );
                    },
                    child: ListTile(
                      leading: CircleAvatar(
                        backgroundImage: AssetImage(profile[index]["pic"]),
                      ),
                      title: Text(profile[index]["name"]),
                      subtitle: Text(profile[index]["title"]),
                    ),
                  );
                }
                return const SizedBox.shrink();
              },
            ),
    );
  }
}
