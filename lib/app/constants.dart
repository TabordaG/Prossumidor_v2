import 'package:flutter/material.dart';
import 'package:prossumidor_v2/app/models/produto/produto_model.dart';
import 'package:prossumidor_v2/app/models/subcategoria/subcategoria_model.dart';

const kPrimaryColor = Color(0xFF1B5583);
const kSecondaryColor = Color(0xFF82A1B1);
const kContentColorLightTheme = Color(0xFF2A2A2A);
const kContentColorDarkTheme = Color(0xFFF5FCF9);
const kWarninngColor = Color(0xFFF3BB1C);
const kErrorColor = Color(0xFFF03738);

const kDefaultPadding = 20.0;

List<Subcategoria> subcategoriaList = [
  Subcategoria(
    subcategoria_id: 0,
    nome: 'Todos',
    ativo: true,
  ),
  Subcategoria(
    subcategoria_id: 1,
    nome: 'Orgânico',
    ativo: false,
  ),
  Subcategoria(
    subcategoria_id: 2,
    nome: 'Não Orgânico',
    ativo: false,
  ),
  Subcategoria(
    subcategoria_id: 3,
    nome: 'Caseiro',
    ativo: false,
  ),
  Subcategoria(
    subcategoria_id: 4,
    nome: 'Sem Lactose',
    ativo: false,
  ),
];

List<String> categoriaList = [
  'Laticínios',
  'Frutas',
  'Legumes e Tubérculos',
  'Pães e Biscoito',
];

/*
1 - Laticíneos
2 - Cosméticos e Perfumes
3 - Outras
*/

List<Produto> produtoList = [
  Produto(
    produto_id: 1,
    nome: 'Digoreste - Relaxante',
    produtor: 'Banhos do Cerrado',
    preco: 30.0,
    imagem: 'assets/images/produtos/Digoreste_Relaxante.png',
    descricao:
        'Este banho é ideal para aqueles momentos que estamos meio inquietos precisando nos tranquilizar e nos restaurar, pode te ajudar a ter uma noite de sono mais tranquila.',
    condicao:
        'Composição: Calêndula (Calendula officinalis); Camomila (Matricaria chamomila); Maracujá (Passiflora edulis); Melissa (Melissa Officinalis) e Erva Doce (Pimpinella anisum). Tamanho: pote 40ML',
    estoque: 5,
    unidade: 'pote 40ml',
    categorias: [2],
    distribuicao: 'Recoopsol',
  ),
  Produto(
    produto_id: 2,
    nome: 'Vela Aromática 20g',
    produtor: 'GAAD',
    preco: 20.0,
    imagem: 'assets/images/produtos/vela_aromatica.png',
    descricao:
        'Com um perfume doce, auxilia no relaxamento e conforto, enquanto se conecta com você após um dia cheio de trabalho. Composição: Cera vegetal, essência. Modo de usar: Na primeira queima, deixe formar uma poça de cera liquida na superfície, isso fará com que tenha maior duração. Acenda sempre que quiser um ambiente sutilmente perfumado.',
    condicao:
        'Com um perfume doce, auxilia no relaxamento e conforto, enquanto se conecta com você após um dia cheio de trabalho. Composição: Cera vegetal, essência.',
    estoque: 4,
    unidade: 'unidade 20g',
    categorias: [2],
    distribuicao: 'Recoopsol',
  ),
  Produto(
    produto_id: 3,
    nome: 'Requeijão Vegetal',
    produtor: 'Florescer Alimentação',
    preco: 26.9,
    imagem: 'assets/images/produtos/requeijão_vegetal.png',
    descricao: 'Requeijão vegetal, fermentação selvagem, artesanal.',
    condicao: 'Requeijão vegetal, fermentação selvagem, artesanal.',
    estoque: 5,
    unidade: 'unidade 250g',
    categorias: [1],
    distribuicao: 'Recoopsol',
  ),
  Produto(
    produto_id: 4,
    nome: 'Açafrão em pó Pote',
    produtor: 'Coompansal',
    preco: 6.33,
    imagem: 'assets/images/produtos/acafrao_em_po_coopansal.jpg',
    descricao:
        'Tempero muito apreciado na culinária local.  Acompanha frasco para guardar o produto',
    condicao: 'Cooperativa Agropecuária Mista de Santo Antônio de Leverger 60g',
    estoque: 24,
    unidade: 'unidade 60g',
    categorias: [3],
    distribuicao: 'Recoopsol',
  ),
];
