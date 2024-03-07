import 'package:flutter/material.dart';

class NewRecipe extends StatefulWidget {
  const NewRecipe({super.key});

  @override
  State<NewRecipe> createState() => _NewRecipeState();
}

class _NewRecipeState extends State<NewRecipe> {
  final _formkey = GlobalKey<FormState>();
  final namaMenuController = TextEditingController();
  final estimasiWaktuController = TextEditingController();
  final deskripsiController = TextEditingController();
  final resepController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        scrolledUnderElevation: 0,
        title: const Text(
          'NEW RECIPE',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        actions: [
          TextButton(
            onPressed: () {},
            child: const Text(
              'Close',
              style: TextStyle(
                color: Colors.red,
                fontWeight: FontWeight.bold,
                fontSize: 16.0,
              ),
            ),
          ),
        ],
      ),
      body: ListView(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            alignment: Alignment.centerLeft,
            height: 50,
            color: Colors.red,
            child: const Text(
              "Super Cool you are creating a new recipe!\nLet's get started",
              style: TextStyle(color: Colors.white),
            ),
          ),
          const SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Form(
              key: _formkey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Give your recipe a name',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                  const SizedBox(height: 5),
                  TextFormField(
                    controller: namaMenuController,
                    validator: (value) =>
                        value!.isEmpty ? 'Nama Menu tidak boleh kosong' : null,
                    decoration: const InputDecoration(
                      hintText: 'Masukkan Nama Menu',
                    ),
                    style: const TextStyle(
                      fontSize: 14,
                    ),
                  ),
                  const SizedBox(height: 16),
                  const Text(
                    'Estimasi Waktu Memasak (menit)',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                  const SizedBox(height: 5),
                  TextFormField(
                    controller: estimasiWaktuController,
                    validator: (value) => value!.isEmpty
                        ? 'Waktu pembuatan tidak boleh kosong'
                        : null,
                    decoration: const InputDecoration(
                      hintText: 'Masukkan Waktu Pembuatan',
                    ),
                    style: const TextStyle(
                      fontSize: 14,
                    ),
                  ),
                  const SizedBox(height: 16),
                  const Text(
                    'Deskripsi',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                  const SizedBox(height: 5),
                  TextFormField(
                    maxLines: 4,
                    controller: deskripsiController,
                    validator: (value) =>
                        value!.isEmpty ? 'Deskripsi tidak boleh kosong' : null,
                    decoration: const InputDecoration(
                      hintText: 'Masukkan Deskripsi ',
                    ),
                    style: const TextStyle(
                      fontSize: 14,
                    ),
                  ),
                  const SizedBox(height: 16),
                  const Text(
                    'Resep, Bahan dan Langkah',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                  const SizedBox(height: 5),
                  TextFormField(
                    maxLines: 6,
                    controller: resepController,
                    validator: (value) =>
                        value!.isEmpty ? 'Resep tidak boleh kosong' : null,
                    decoration: const InputDecoration(
                      hintText: 'Masukkan Resep dan Cara Pembuatan ',
                    ),
                    style: const TextStyle(
                      fontSize: 14,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 32),
                    child: SizedBox(
                      width: double.infinity,
                      height: 40,
                      child: ElevatedButton(
                        style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all(Colors.red),
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                        ),
                        onPressed: () {
                          if (_formkey.currentState!.validate()) {
                            namaMenuController.clear();
                            estimasiWaktuController.clear();
                            deskripsiController.clear();
                            resepController.clear();

                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content:
                                    Text('Your data successfully submitted!'),
                                backgroundColor: Colors.green,
                              ),
                            );
                          }
                        },
                        child: const Text(
                          "Add Menu",
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
