import 'package:flutter/material.dart';
import 'package:sommelio/config/app_icons.dart';
import 'package:sommelio/models/Wines.dart';
import 'package:sommelio/models/delicacies.dart';
import 'package:sommelio/models/user.dart';
import 'package:sommelio/modules/resultPage/result_page_controller.dart';
import 'package:sommelio/template/btnWine.dart';

class ResultPage extends StatefulWidget {
  final User user;
  final Delicacies? mainDelicacy;
  final String? search;
  final Function(Wines)? btnWineClicked;

  const ResultPage(
      {required this.user,
      this.mainDelicacy,
      this.search,
      required this.btnWineClicked,
      Key? key})
      : super(key: key);

  @override
  State<ResultPage> createState() => _ResultPageState();
}

class _ResultPageState extends State<ResultPage> {
  late ResultController controller = ResultController();

  @override
  Widget build(BuildContext context) {
    Future<List<Wines>> btnWineFuture;
    if (widget.mainDelicacy != null) {
      btnWineFuture = controller.getWinesByDelicacy(widget.mainDelicacy?.id);
    } else if (widget.search != null) {
      btnWineFuture = controller.getWinesByString(widget.search!);
    } else {
      btnWineFuture = controller.getAllWines();
    }

    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 20.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Image.asset(
                AppIcons.viandes,
                width: MediaQuery.of(context).size.width * 0.2,
              ),
            ],
          ),
          const SizedBox(height: 40.0),
          FutureBuilder<List<Wines>>(
            future: btnWineFuture,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const CircularProgressIndicator();
              } else if (snapshot.hasError) {
                return Text('Erreur : ${snapshot.error}');
              } else if (snapshot.hasData) {
                return ListView.separated(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: snapshot.data!.length,
                  separatorBuilder: (context, index) => const SizedBox(height: 8.0),
                  itemBuilder: (context, index) {
                    final wine = snapshot.data![index];
                    return BtnWine(
                      isFavorite: false,
                      name: wine.name,
                      cepage: wine.cepage,
                      year: wine.year,
                      imgName: wine.pictureUrl,
                      colorBtn : index,
                      onPressed: () {
                        widget.btnWineClicked?.call(wine);
                      },
                    );
                  },
                );
              } else {
                return const Text('Aucun mets disponible');
              }
            },
          ),
          const SizedBox(height: 60.0)
        ],
      ),
    );
  }
}
