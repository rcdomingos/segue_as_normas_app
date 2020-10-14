import 'package:flutter/material.dart';
import 'package:segue_as_normas_app/ui/constants.dart';
import 'package:segue_as_normas_app/ui/pages/categoty_list_page.dart';
import 'package:segue_as_normas_app/ui/widgets/botton_category.dart';

class CategoryPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Categorias'),
      ),
      body: Container(
        padding: EdgeInsets.all(20.0),
        child: ListView(
          children: [
            Row(
              children: [
                BottonCategory(
                  label: 'Restaurante',
                  icon: Icons.restaurant,
                  onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          CategoryListPage(category: 'Restaurante'),
                    ),
                  ),
                ),
                SizedBox(width: 15),
                BottonCategory(
                  label: 'Padaria',
                  icon: Icons.local_cafe,
                  onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          CategoryListPage(category: 'Padaria'),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 15),
            Row(
              children: [
                BottonCategory(
                  label: 'Mercado',
                  icon: Icons.local_grocery_store,
                  onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          CategoryListPage(category: 'Supermecado'),
                    ),
                  ),
                ),
                SizedBox(width: 15),
                BottonCategory(
                  label: 'Farmacia',
                  icon: Icons.local_pharmacy,
                  onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          CategoryListPage(category: 'Farmacia'),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 15),
            Row(
              children: [
                BottonCategory(
                  label: 'Loja de Roupas',
                  icon: Icons.local_mall,
                  onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          CategoryListPage(category: 'Loja de Roupas'),
                    ),
                  ),
                ),
                SizedBox(width: 15),
                BottonCategory(
                  label: 'Posto de Gasolina',
                  icon: Icons.local_gas_station,
                  onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          CategoryListPage(category: 'Posto de Gasolina'),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
