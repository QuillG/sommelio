import 'package:flutter/material.dart';
import 'package:sommelio/config/app-colors.dart';
import 'package:sommelio/config/app_icons.dart';
import 'package:sommelio/template/qr_code_bottomSheet.dart';

class CustomHeader extends StatefulWidget implements PreferredSizeWidget {
  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight + (kToolbarHeight / 2));

  @override
  _CustomHeaderState createState() => _CustomHeaderState();
}

class _CustomHeaderState extends State<CustomHeader> {
  bool isSearching = false;
  TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        AppBar(
          automaticallyImplyLeading: false, // Remove the back arrow
          backgroundColor: AppColors.white,
          elevation: 0,
          title: Image.asset(
            AppIcons.sommelioIcon,
            width: MediaQuery.of(context).size.width * 0.35,
            fit: BoxFit.fill,
          ),
          actions: [
            IconButton(
              onPressed: () {
                setState(() {
                  isSearching = !isSearching;
                });
              },
              icon: Icon(
                isSearching ? Icons.close : Icons.search,
                color: AppColors.black,
                size: 35.0,
              ),
            ),
            IconButton(
              onPressed: () {
                QrCodeBottomSheet.show(context, '1234567890');
              },
              icon: const Icon(Icons.qr_code, color: AppColors.black, size: 35.0),
            ),
          ],
        ),
        AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          height: isSearching ? 60.0 : 0.0,
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          child: isSearching
              ? TextField(
                  controller: searchController,
                  decoration: InputDecoration(
                    hintText: 'Rechercher un vin',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  onSubmitted: (query) {
                    setState(() {
                      isSearching = false;
                    });
                    // Ajoutez la logique de recherche ici avec `query`
                  },
                )
              : null,
        ),
      ],
    );
  }
}

