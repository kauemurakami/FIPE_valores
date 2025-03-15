import 'package:fipe_valor/features/home/provider.dart';
import 'package:fipe_valor/features/home/widgets/app_bar.dart';
import 'package:fipe_valor/features/home/widgets/item.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final HomeProvider provider = Provider.of<HomeProvider>(
      context,
      listen: false,
    );
    return Scaffold(
      appBar: AppBarWidget(),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            children: [
              Expanded(
                child: ValueListenableBuilder(
                  valueListenable: provider.load,
                  builder:
                      (context, load, child) =>
                          load
                              ? Center(
                                child: CircularProgressIndicator.adaptive(),
                              )
                              : ValueListenableBuilder(
                                valueListenable: provider.fipeValues,
                                builder:
                                    (context, value, child) =>
                                        value.isEmpty
                                            ? Center(
                                              child: Text(
                                                'Insira um código FIPE e pesquise',
                                              ),
                                            )
                                            : ListView.builder(
                                              itemCount: value.length,
                                              itemBuilder:
                                                  (context, index) =>
                                                      ItemWidget(
                                                        value: value[index],
                                                      ),
                                            ),
                              ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
