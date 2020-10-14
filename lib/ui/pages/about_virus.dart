import 'package:flutter/material.dart';
import 'package:segue_as_normas_app/ui/constants.dart';

class AboutVirus extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double container = 120;

    return Scaffold(
      appBar: AppBar(
        title: Text('Recomendações'),
      ),
      body: Container(
        padding: EdgeInsets.all(20.0),
        child: ListView(
          children: [
            Text(
              'Se possivel fique em casa, mas se precisar sair sempre siga os métodos de prevenção:',
              style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: cFontPrincipal),
            ),
            Divider(),
            Container(
              height: container,
              padding: EdgeInsets.all(10.0),
              color: Color.fromRGBO(224, 237, 254, 1),
              child: Row(
                children: [
                  Container(
                    width: 90,
                    height: 90,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage('assets/useMascara.png'),
                          fit: BoxFit.cover),
                    ),
                  ),
                  SizedBox(width: 10),
                  Expanded(
                    child: Text(
                      'Sempre utilize a máscara.',
                      style:
                          TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
            ),
            Divider(),
            Container(
              height: container,
              padding: EdgeInsets.all(10.0),
              color: Color.fromRGBO(129, 135, 213, 1),
              child: Row(
                children: [
                  Container(
                    width: 90,
                    height: 90,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage('assets/alcoolGel.png'),
                          fit: BoxFit.cover),
                    ),
                  ),
                  SizedBox(width: 10),
                  Expanded(
                    child: Text(
                      'Só entre nos estabelecimentos que disponibilize álcool gel na entrada, e sempre utilize.',
                      style: TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Divider(),
            Container(
              height: container,
              padding: EdgeInsets.all(10.0),
              color: Color.fromRGBO(16, 137, 254, 1),
              child: Row(
                children: [
                  Container(
                    width: 90,
                    height: 90,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage('assets/multidao.png'),
                          fit: BoxFit.cover),
                    ),
                  ),
                  SizedBox(width: 10),
                  Expanded(
                    child: Text(
                      'Evite lugares que estejam muito cheios.',
                      style:
                          TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
            ),
            Divider(),
            Container(
              height: container,
              padding: EdgeInsets.all(10.0),
              color: Color.fromRGBO(255, 238, 228, 1),
              child: Row(
                children: [
                  Container(
                    width: 90,
                    height: 90,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage('assets/pegarNecessario.png'),
                          fit: BoxFit.cover),
                    ),
                  ),
                  SizedBox(width: 10),
                  Expanded(
                    child: Text(
                      'Procure tocar apenas nos produtos que vai levar.',
                      style:
                          TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
            ),
            Divider(),
            Container(
              height: container,
              padding: EdgeInsets.all(10.0),
              color: Color.fromRGBO(77, 212, 153, 1),
              child: Row(
                children: [
                  Container(
                    width: 90,
                    height: 90,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage('assets/bocaNariz.png'),
                          fit: BoxFit.cover),
                    ),
                  ),
                  SizedBox(width: 10),
                  Expanded(
                    child: Text(
                      'Evite tocar nos olhos, nariz e boca com as mãos não lavadas depois de tocar nos produtos.',
                      style:
                          TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
            ),
            Divider(),
            Container(
              height: container,
              padding: EdgeInsets.all(10.0),
              color: Color.fromRGBO(254, 147, 91, 1),
              child: Row(
                children: [
                  Container(
                    width: 90,
                    height: 90,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage('assets/obejtosPessoais.png'),
                          fit: BoxFit.cover),
                    ),
                  ),
                  SizedBox(width: 10),
                  Expanded(
                    child: Text(
                      'Não compartilhe objetos pessoais como copos, talheres e garrafas.',
                      style:
                          TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
            ),
            Divider(),
            Container(
              height: container,
              padding: EdgeInsets.all(10.0),
              color: Color.fromRGBO(74, 140, 201, 1),
              child: Row(
                children: [
                  Container(
                    width: 90,
                    height: 90,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage('assets/desinfetarProdutos.png'),
                          fit: BoxFit.cover),
                    ),
                  ),
                  SizedBox(width: 10),
                  Expanded(
                    child: Text(
                      'Procure higienizar e desinfetar as embalagens dos produtos comprados quando chegar em casa.',
                      style:
                          TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
