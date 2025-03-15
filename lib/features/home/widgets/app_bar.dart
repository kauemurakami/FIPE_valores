import 'package:fipe_valor/core/utils/functions/hide_keyboard.dart';
import 'package:fipe_valor/core/utils/masks/app_masks.dart';
import 'package:fipe_valor/data/models/app_error.dart';
import 'package:fipe_valor/data/models/fipe_value.dart';
import 'package:fipe_valor/features/home/provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AppBarWidget extends StatelessWidget implements PreferredSize {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  AppBarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final HomeProvider provider = Provider.of<HomeProvider>(
      context,
      listen: false,
    );
    return AppBar(
      actions: [
        Expanded(
          child: Row(
            children: [
              Expanded(child: SizedBox.shrink()),
              Expanded(
                flex: 5,
                child: Form(
                  key: _formKey,
                  child: TextFormField(
                    onChanged: (value) => provider.onChangedCode(value),
                    onSaved: (newValue) => provider.onsavedCode(newValue ?? ''),
                    validator: (value) => provider.validateCode(value ?? ''),
                    inputFormatters: [AppMasks.fipeMask],
                    keyboardType: TextInputType.number,
                    maxLength: 18,
                    decoration: InputDecoration(label: Text('Código FIPE')),
                  ),
                ),
              ),
              Expanded(
                child: ValueListenableBuilder(
                  valueListenable: provider.load,
                  builder:
                      (context, load, child) =>
                          load
                              ? SizedBox(
                                height: 20.0,
                                width: 10.0,
                                child: const CircularProgressIndicator.adaptive(
                                  constraints: BoxConstraints(
                                    minWidth: 20.0,
                                    maxWidth: 20.0,
                                  ),
                                ),
                              )
                              : IconButton(
                                onPressed: () async {
                                  if (_formKey.currentState!.validate()) {
                                    final result = await provider.fetchValues();
                                    result.fold(
                                      (AppError error) {
                                        ScaffoldMessenger.of(
                                          context,
                                        ).showSnackBar(
                                          SnackBar(
                                            content: Text(
                                              error.message ?? 'Erro',
                                            ),
                                          ),
                                        );
                                      },
                                      (List<FipeValue> values) {
                                        hideKeyboard();
                                      },
                                    );
                                  }
                                },
                                icon: Icon(Icons.search),
                              ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  @override
  Widget get child => throw UnimplementedError();

  @override
  Size get preferredSize => Size(double.infinity, 60);
}
