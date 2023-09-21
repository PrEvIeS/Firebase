import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_template/constants/widget_keys.dart';
import 'package:flutter_template/data/models/purchase.dart';
import 'package:flutter_template/data/repositories/purchase.dart';
import 'package:flutter_template/generated/l10n.dart';
import 'package:flutter_template/services/firebase_service/firebase_firestore.dart';
import 'package:flutter_template/services/firebase_service/firebase_storage.dart';
import 'package:flutter_template/usecases/home/bloc/home_cubit.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  final _nameController = TextEditingController();
  final PurchaseRepository _purchaseRepository = PurchaseRepository(
      purchaseCollection: FirebaseFirestoreService.getPurchasesCollection());

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => HomeCubit(purchaseRepository: _purchaseRepository),
      child: Center(
        child: Scaffold(
          key: const Key(WidgetKeys.homeScaffoldKey),
          appBar: AppBar(
            title: Text(S.of(context).home),
          ),
          body: FutureBuilder<String>(
            future: FirebaseStorageService.getImageByName(
                'shopping-pattern-background-design_260839-17.avif'),
            builder: (BuildContext context, snapshot) {
              if (snapshot.connectionState == ConnectionState.done) {
                return Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: NetworkImage(
                        snapshot.data as String,
                      ),
                      fit: BoxFit.cover,
                    ),
                  ),
                  child: Column(
                    children: [
                      _PurchaseList(),
                      SizedBox(
                        height: 100,
                        child: Row(
                          children: <Widget>[
                            Flexible(
                              flex: 3,
                              child: TextField(
                                controller: _nameController,
                                decoration:
                                    const InputDecoration(hintText: 'Name'),
                              ),
                            ),
                            ElevatedButton(
                              onPressed: () =>
                                  context.read<HomeCubit>().addNewPurchase(
                                        Purchase(
                                          name: _nameController.text,
                                          purchased: false,
                                        ),
                                      ),
                              child: const Text('Submit'),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                );
              } else {
                return Container(
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: NetworkImage(
                        'https://cdn.dribbble.com/users/683081/screenshots/2728654/media/7bb2b47d0574d39b20354620e4fa50c8.png?resize=400x300&vertical=center',
                      ),
                      fit: BoxFit.cover,
                    ),
                  ),
                );
              }
            },
          ),
        ),
      ),
    );
  }
}

class _PurchaseList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: StreamBuilder<List<Purchase>>(
        stream:
            FirebaseFirestoreService.getPurchasesCollection().snapshots().map(
                  (e) => e.docs.map((e) => e.data()).toList(),
                ),
        builder: (BuildContext context, snapshot) => ListView(
          children: snapshot.hasData
              ? snapshot.data!
                  .map(
                    (e) => ListTile(
                      leading: Text(e.name),
                      onTap: () => context
                          .read<HomeCubit>()
                          .markPurchased(e.id, !e.purchased),
                      trailing: e.purchased
                          ? const Icon(
                              Icons.done,
                            )
                          : const Icon(
                              Icons.close,
                            ),
                    ),
                  )
                  .toList()
              : [],
        ),
      ),
    );
  }
}
