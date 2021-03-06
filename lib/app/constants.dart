import 'package:flutter/material.dart';
import 'package:prossumidor_v2/app/models/pedidos/pedidos_model.dart';
import 'package:prossumidor_v2/app/models/produto/produto_model.dart';
import 'package:prossumidor_v2/app/models/subcategoria/subcategoria_model.dart';

const kPrimaryColor = Color(0xFF1B5583);
const kSecondaryColor = Color(0xFF82A1B1);
const kContentColorLightTheme = Color(0xFF2A2A2A);
const kContentColorDarkTheme = Color(0xFFF5FCF9);
const kWarninngColor = Color(0xFFF3BB1C);
const kErrorColor = Color(0xFFF03738);
const kCardColor = Color(0xFFF6F6F6);

const kDefaultPadding = 20.0;

List<String> centroDistribuicao = [
  "Cuiabá",
  "Rondonópolis",
];

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
  'Cosméticos e Perfumes',
  'Outras',
];

/*
1 - Laticíneos
2 - Cosméticos e Perfumes
3 - Outras
*/

List<Produto> produtoList = [
  Produto(
    id: 1,
    descricao_simplificada: 'Digoreste - Relaxante',
    marca_produto_id: 1, //'Banhos do Cerrado',
    preco_venda: "30.0",
    imagem: 'assets/images/produtos/Digoreste_Relaxante.png',
    descricao_completa:
        'Este banho é ideal para aqueles momentos que estamos meio inquietos precisando nos tranquilizar e nos restaurar, pode te ajudar a ter uma noite de sono mais tranquila.',
    marketing:
        'Composição: Calêndula (Calendula officinalis); Camomila (Matricaria chamomila); Maracujá (Passiflora edulis); Melissa (Melissa Officinalis) e Erva Doce (Pimpinella anisum). Tamanho: pote 40ML',
    estoque_atual: "5",
    unidade_medida: 'pote 40ml',
    descricao: "Fruta",
  ),
  Produto(
    id: 2,
    descricao_simplificada: 'Digoreste - Relaxante',
    marca_produto_id: 1, //'Banhos do Cerrado',
    preco_venda: "30.0",
    imagem: 'assets/images/produtos/vela_aromatica.png',
    descricao_completa:
        'Este banho é ideal para aqueles momentos que estamos meio inquietos precisando nos tranquilizar e nos restaurar, pode te ajudar a ter uma noite de sono mais tranquila.',
    marketing:
        'Composição: Calêndula (Calendula officinalis); Camomila (Matricaria chamomila); Maracujá (Passiflora edulis); Melissa (Melissa Officinalis) e Erva Doce (Pimpinella anisum). Tamanho: pote 40ML',
    estoque_atual: "5",
    unidade_medida: 'pote 40ml',
    descricao: "Fruta",
  ),
  Produto(
    id: 3,
    descricao_simplificada: 'Digoreste - Relaxante',
    marca_produto_id: 1, //'Banhos do Cerrado',
    preco_venda: "30.0",
    imagem: 'assets/images/produtos/requeijão_vegetal.png',
    descricao_completa:
        'Este banho é ideal para aqueles momentos que estamos meio inquietos precisando nos tranquilizar e nos restaurar, pode te ajudar a ter uma noite de sono mais tranquila.',
    marketing:
        'Composição: Calêndula (Calendula officinalis); Camomila (Matricaria chamomila); Maracujá (Passiflora edulis); Melissa (Melissa Officinalis) e Erva Doce (Pimpinella anisum). Tamanho: pote 40ML',
    estoque_atual: "5",
    unidade_medida: 'pote 40ml',
    descricao: "Fruta",
  ),
  Produto(
    id: 4,
    descricao_simplificada: 'Digoreste - Relaxante',
    marca_produto_id: 1, //'Banhos do Cerrado',
    preco_venda: "30.0",
    imagem: 'assets/images/produtos/mussarela_barrinha.png',
    descricao_completa:
        'Este banho é ideal para aqueles momentos que estamos meio inquietos precisando nos tranquilizar e nos restaurar, pode te ajudar a ter uma noite de sono mais tranquila.',
    marketing:
        'Composição: Calêndula (Calendula officinalis); Camomila (Matricaria chamomila); Maracujá (Passiflora edulis); Melissa (Melissa Officinalis) e Erva Doce (Pimpinella anisum). Tamanho: pote 40ML',
    estoque_atual: "5",
    unidade_medida: 'pote 40ml',
    descricao: "Fruta",
  ),
  Produto(
    id: 5,
    descricao_simplificada: 'Queijo Muçarela - Bolinha',
    marca_produto_id: 1, //'Banhos do Cerrado',
    preco_venda: "30.0",
    imagem: 'assets/images/produtos/mussarela_bolinha.png',
    descricao_completa:
        'Este banho é ideal para aqueles momentos que estamos meio inquietos precisando nos tranquilizar e nos restaurar, pode te ajudar a ter uma noite de sono mais tranquila.',
    marketing:
        'Composição: Calêndula (Calendula officinalis); Camomila (Matricaria chamomila); Maracujá (Passiflora edulis); Melissa (Melissa Officinalis) e Erva Doce (Pimpinella anisum). Tamanho: pote 40ML',
    estoque_atual: "5",
    unidade_medida: 'pote 40ml',
    descricao: "Fruta",
  ),
  // Produto(
  //   produto_id: 2,
  //   nome: 'Vela Aromática 20g',
  //   produtor: 'GAAD',
  //   preco: "20.0",
  //   imagem: 'assets/images/produtos/vela_aromatica.png',
  //   descricao:
  //       'Com um perfume doce, auxilia no relaxamento e conforto, enquanto se conecta com você após um dia cheio de trabalho. Composição: Cera vegetal, essência. Modo de usar: Na primeira queima, deixe formar uma poça de cera liquida na superfície, isso fará com que tenha maior duração. Acenda sempre que quiser um ambiente sutilmente perfumado.',
  //   condicao:
  //       'Com um perfume doce, auxilia no relaxamento e conforto, enquanto se conecta com você após um dia cheio de trabalho. Composição: Cera vegetal, essência.',
  //   estoque: 4,
  //   unidade: 'unidade 20g',
  //   categorias: [2],
  //   distribuicao: 'Recoopsol',
  // ),
  // Produto(
  //   produto_id: 3,
  //   nome: 'Requeijão Vegetal',
  //   produtor: 'Florescer Alimentação',
  //   preco: "26.9",
  //   imagem: 'assets/images/produtos/requeijão_vegetal.png',
  //   descricao: 'Requeijão vegetal, fermentação selvagem, artesanal.',
  //   condicao: 'Requeijão vegetal, fermentação selvagem, artesanal.',
  //   estoque: 5,
  //   unidade: 'unidade 250g',
  //   categorias: [1],
  //   distribuicao: 'Recoopsol',
  // ),
  // Produto(
  //   produto_id: 4,
  //   nome: 'Açafrão em pó Pote',
  //   produtor: 'Coompansal',
  //   preco: "6.33",
  //   imagem: 'assets/images/produtos/acafrao_em_po_coopansal.jpg',
  //   descricao:
  //       'Tempero muito apreciado na culinária local.  Acompanha frasco para guardar o produto',
  //   condicao: 'Cooperativa Agropecuária Mista de Santo Antônio de Leverger 60g',
  //   estoque: 24,
  //   unidade: 'unidade 60g',
  //   categorias: [3],
  //   distribuicao: 'Recoopsol',
  // ),
  // Produto(
  //   produto_id: 5,
  //   nome: 'Queijo Muçarela - Cabacinha',
  //   produtor: 'CPGrande',
  //   preco: "19.41",
  //   imagem: 'assets/images/produtos/mucarela_cabacinha1.png',
  //   descricao:
  //       'Queijo muçarela de excelente qualidade com aproximadamente 480 g, produzido pela Coopergrande, uma cooperativa da agricultura familiar da Baixada Cuiabana.',
  //   condicao: '480 g  Cooperativa Agropecuária Varzeagrandense - COOPERGRANDE',
  //   estoque: 66,
  //   unidade: 'Unidade',
  //   categorias: [1],
  //   distribuicao: 'Recoopsol',
  // ),
  // Produto(
  //   produto_id: 6,
  //   nome: 'Queijo Muçarela - Barrinha',
  //   produtor: 'CPGrande',
  //   preco: "17.65",
  //   imagem: 'assets/images/produtos/mussarela_barrinha.png',
  //   descricao:
  //       'Queijo muçarela de excelente qualidade com aproximadamente 500g. Produzido pela Coopergrande (uma cooperativa da agricultura familiar da Baixada Cuiabana).',
  //   condicao: '500 g Cooperativa Agropecuária Varzeagrandense - COOPERGRANDE',
  //   estoque: 56,
  //   unidade: '500 Gramas',
  //   categorias: [1],
  //   distribuicao: 'Recoopsol',
  // ),
  // Produto(
  //   produto_id: 7,
  //   nome: 'Queijo Muçarela – Barra',
  //   produtor: 'CPGrande',
  //   preco: "122.36",
  //   imagem: 'assets/images/produtos/mussarela_barra.png',
  //   descricao:
  //       'Queijo muçarela de excelente qualidade produzido pela Coopergrande, uma cooperativa da agricultura familiar da Baixada Cuiabana.',
  //   condicao: '4 kg  Cooperativa Agropecuária Varzeagrandense - COOPERGRANDE',
  //   estoque: 108,
  //   unidade: '4 Kg',
  //   categorias: [1],
  //   distribuicao: 'Recoopsol',
  // ),
  // Produto(
  //   produto_id: 8,
  //   nome: 'Queijo Muçarela - Bolinha',
  //   produtor: 'CPGrande',
  //   preco: "14.35",
  //   imagem: 'assets/images/produtos/mussarela_bolinha.png',
  //   descricao:
  //       'Queijo muçarela de excelente qualidade com aproximadamente 280 g, produzido pela Coopergrande, uma cooperativa da agricultura familiar da Baixada Cuiabana.',
  //   condicao:
  //       '280 g    Cooperativa Agropecuária Varzeagrandense - COOPERGRANDE',
  //   estoque: 22,
  //   unidade: '280 Gramas',
  //   categorias: [1],
  //   distribuicao: 'Recoopsol',
  // ),
  // Produto(
  //   produto_id: 9,
  //   nome: 'Queijo Muçarela - Trança',
  //   produtor: 'CPGrande',
  //   preco: "15.53",
  //   imagem: 'assets/images/produtos/mucarela_tranca.png',
  //   descricao:
  //       'Queijo muçarela de excelente qualidade com aproximadamente 300 g, produzido pela Coopergrande, uma cooperativa da agricultura familiar da Baixada Cuiabana.',
  //   condicao: '300 g   Cooperativa Agropecuária Varzeagrandense - COOPERGRANDE',
  //   estoque: 22,
  //   unidade: '300 Gramas',
  //   categorias: [1],
  //   distribuicao: 'Recoopsol',
  // ),
  // Produto(
  //   produto_id: 10,
  //   nome: 'Escalda pés - votê',
  //   produtor: 'Banhos do Cerrado',
  //   preco: "20.0",
  //   imagem: 'assets/images/produtos/escalda_pes_vote.png',
  //   descricao:
  //       'Limpeza energética e calma. Composição: Arruda (Ruta Graveolens L.); Lavanda (Lavandula angustifolia) e sal grosso. Tamanho: pote 40 ML.',
  //   condicao:
  //       'O escalda-pés “votê” oferece um tempo de silêncio, tranquilidade e equilíbrio por meio das propriedades terapêuticas das ervas, flores, sais e cristais. É uma maneira de auxiliar no alívio de dores musculares e em sua rigidez. Pode ajudar na redução da inflamação e melhorar a circulação. Também pode suavizar a pele seca e desodorizar os pés. Com a função de te ajudar a purificar e descarregar de um dia cansativo.',
  //   estoque: 5,
  //   unidade: 'Unidade',
  //   categorias: [2],
  //   distribuicao: 'Recoopsol',
  // ),
  // Produto(
  //   produto_id: 11,
  //   nome: 'Escalda pés - xô mano',
  //   produtor: 'Banhos do Cerrado',
  //   preco: "20.0",
  //   imagem: 'assets/images/produtos/Escalda_pes_xo_mano.png',
  //   descricao:
  //       'Composição: Jasmim (Jasminum officinale L); Camomila (Matricaria chamomila); Melissa (Melissa Officinalis) e sal grosso. Tamanho: pote 40ML',
  //   condicao:
  //       'Os banhos terapêuticos nos pés, chamados escalda-pés, são práticas milenares que ajudam o corpo a eliminar toxinas, além de proporcionar um tempo de relaxamento e equilíbrio mental. Experimente um momento de pleno equilíbrio e harmonia com o escalda pés “xô mano” e potencialize sua rotina de autocuidado e amor próprio por si e seu corpo.',
  //   estoque: 5,
  //   unidade: 'Unidade',
  //   categorias: [2],
  //   distribuicao: 'Recoopsol',
  // ),
  // Produto(
  //   produto_id: 12,
  //   nome: 'Escalda pés relax - Relaxante',
  //   produtor: 'Banhos do Cerrado',
  //   preco: "20.0",
  //   imagem: 'assets/images/produtos/Escalda_pes_Relaxante.png',
  //   descricao:
  //       'Composição: Alecrim (Rosmarinus officinalis L.); Calêndula (Calendula officinalis); Camomila (Matricaria chamomila) e  sal grosso. Tamanho: pote 40 ML.',
  //   condicao:
  //       'Indicado a todas e todos que buscam um momento de relaxamento e autocuidado em meio a dias cheios. Separe um momento especial para si e relaxe, dos pés à cabeça.  É também indicado para aliviar tensões de gestantes que estão no período de pré-parto e pós-parto, uma fase onde os pés se incham causando grande desconforto. Uma dica é embeber os pés durante o ato da amamentação.',
  //   estoque: 5,
  //   unidade: 'Unidade',
  //   categorias: [2],
  //   distribuicao: 'Recoopsol',
  // ),
  // Produto(
  //   produto_id: 13,
  //   nome: 'Escalda-Pés 30g',
  //   produtor: 'GAAD',
  //   preco: "12.0",
  //   imagem: 'assets/images/produtos/escalda_pes.png',
  //   descricao:
  //       'Feito com ervas desidratadas de Alecrim, Calêndula e Camomila. Ação antioxidante, Anti-inflamatória, Antimicótica, Antimicrobiana, Cicatrizante, Analgésica e Antifúngicas. Atua também no campo energét',
  //   condicao:
  //       'Feito com ervas desidratadas de Alecrim, Calêndula e Camomila. Ação antioxidante, Anti-inflamatória, Antimicótica, Antimicrobiana, Cicatrizante, Analgésica e Antifúngicas. Atua também no campo energético, tem função calmante, age contra depressão, estresse, insônia, ansiedade, nervosismo, ajudando na hora do sono.',
  //   estoque: 9,
  //   unidade: 'Unidade',
  //   categorias: [2],
  //   distribuicao: 'Recoopsol',
  // ),
  // Produto(
  //   produto_id: 15,
  //   nome: 'Mel de abelha 280g',
  //   produtor: 'CooperNS',
  //   preco: "16.0",
  //   imagem: 'assets/images/produtos/mel_280_cooperns.png',
  //   descricao: 'Artesanal Agroecológico. Apiário Brumado',
  //   condicao: 'Artesanall Agroecológico',
  //   estoque: 86,
  //   unidade: 'Unidade',
  //   categorias: [3],
  //   distribuicao: 'Recoopsol',
  // ),
  // Produto(
  //   produto_id: 16,
  //   nome: 'Mel de abelha 500g',
  //   produtor: 'CooperNS',
  //   preco: "27.0",
  //   imagem: 'assets/images/produtos/mel_500_cooperns.png',
  //   descricao: 'Artesanal Agroecológico. Apiário Brumado',
  //   condicao: 'Artesanall Agroecológico',
  //   estoque: 34,
  //   unidade: 'Unidade',
  //   categorias: [3],
  //   distribuicao: 'Recoopsol',
  // ),
  // Produto(
  //   produto_id: 17,
  //   nome: 'Paçoca de Panela',
  //   produtor: 'CooperNS',
  //   preco: "15.0",
  //   imagem: 'assets/images/produtos/pacoca_panela_cooperns_vYAhx6n.png',
  //   descricao: 'Pote 150g Paçoca Artesanal',
  //   condicao: 'Pote 150g Paçoca de Panela Artesanal',
  //   estoque: 26,
  //   unidade: 'Unidade',
  //   categorias: [3],
  //   distribuicao: 'Recoopsol',
  // ),
  // Produto(
  //   produto_id: 18,
  //   nome: 'Paçoca de Panela',
  //   produtor: 'CooperNS',
  //   preco: "20.0",
  //   imagem: 'assets/images/produtos/pacoca_panela_cooperns.png',
  //   descricao: 'Pote 250g. Paçoca Artesanal',
  //   condicao: 'Pote 250g Paçoca de Panela Artesanal',
  //   estoque: 160,
  //   unidade: 'Unidade',
  //   categorias: [3],
  //   distribuicao: 'Recoopsol',
  // ),
];

List<Pedidos> pedidosListEntregues = [
  /*
  Pedidos(
    pedidos_id: 1,
    fornecedor: "Recoopsol",
    itens: 3,
    data: "19/05/2021",
    tipo_entrega: "Entrega",
    situacao: "Entregue",
    pagamento: "Dinheiro",
    frete: 5.00,
    total: 36.18,
    produtos: [
      ProdutoPedido(
        produto: produtoList[0],
        quantidade: 2,
      ),
      ProdutoPedido(
        produto: produtoList[1],
        quantidade: 2,
      ),
      ProdutoPedido(
        produto: produtoList[2],
        quantidade: 2,
      ),
      ProdutoPedido(
        produto: produtoList[3],
        quantidade: 2,
      ),
    ],
  ),
  Pedidos(
    pedidos_id: 2,
    fornecedor: "Recoopsol",
    itens: 3,
    data: "19/05/2021",
    tipo_entrega: "Entrega",
    situacao: "Entregue",
    pagamento: "Crédito",
    frete: 5.00,
    total: 36.18,
    produtos: [
      ProdutoPedido(
        produto: produtoList[0],
        quantidade: 2,
      ),
      ProdutoPedido(
        produto: produtoList[1],
        quantidade: 2,
      ),
      ProdutoPedido(
        produto: produtoList[2],
        quantidade: 2,
      ),
      ProdutoPedido(
        produto: produtoList[3],
        quantidade: 2,
      ),
    ],
  ),
  Pedidos(
    pedidos_id: 3,
    fornecedor: "Recoopsol",
    itens: 3,
    data: "19/05/2021",
    tipo_entrega: "Entrega",
    situacao: "Entregue",
    pagamento: "Pix",
    frete: 5.00,
    total: 36.18,
    produtos: [
      ProdutoPedido(
        produto: produtoList[0],
        quantidade: 2,
      ),
      ProdutoPedido(
        produto: produtoList[1],
        quantidade: 2,
      ),
      ProdutoPedido(
        produto: produtoList[2],
        quantidade: 2,
      ),
      ProdutoPedido(
        produto: produtoList[3],
        quantidade: 2,
      ),
    ],
  ),
  Pedidos(
    pedidos_id: 4,
    fornecedor: "Recoopsol",
    itens: 3,
    data: "19/05/2021",
    tipo_entrega: "Entrega",
    situacao: "Entregue",
    pagamento: "Dinheiro",
    frete: 5.00,
    total: 36.18,
    produtos: [
      ProdutoPedido(
        produto: produtoList[0],
        quantidade: 2,
      ),
      ProdutoPedido(
        produto: produtoList[1],
        quantidade: 2,
      ),
      ProdutoPedido(
        produto: produtoList[2],
        quantidade: 2,
      ),
      ProdutoPedido(
        produto: produtoList[3],
        quantidade: 2,
      ),
    ],
  ),
  Pedidos(
    pedidos_id: 5,
    fornecedor: "Recoopsol",
    itens: 3,
    data: "19/05/2021",
    tipo_entrega: "Entrega",
    situacao: "Entregue",
    pagamento: "Dinheiro",
    frete: 5.00,
    total: 36.18,
    produtos: [
      ProdutoPedido(
        produto: produtoList[0],
        quantidade: 2,
      ),
      ProdutoPedido(
        produto: produtoList[1],
        quantidade: 2,
      ),
      ProdutoPedido(
        produto: produtoList[2],
        quantidade: 2,
      ),
      ProdutoPedido(
        produto: produtoList[3],
        quantidade: 2,
      ),
    ],
  ),
  Pedidos(
    pedidos_id: 6,
    fornecedor: "Recoopsol",
    itens: 3,
    data: "19/05/2021",
    tipo_entrega: "Entrega",
    situacao: "Entregue",
    pagamento: "Dinheiro",
    frete: 5.00,
    total: 36.18,
    produtos: [
      ProdutoPedido(
        produto: produtoList[0],
        quantidade: 2,
      ),
      ProdutoPedido(
        produto: produtoList[1],
        quantidade: 2,
      ),
      ProdutoPedido(
        produto: produtoList[2],
        quantidade: 2,
      ),
      ProdutoPedido(
        produto: produtoList[3],
        quantidade: 2,
      ),
    ],
  ),
  Pedidos(
    pedidos_id: 7,
    fornecedor: "Recoopsol",
    itens: 3,
    data: "19/05/2021",
    tipo_entrega: "Entrega",
    situacao: "Entregue",
    pagamento: "Dinheiro",
    frete: 5.00,
    total: 36.18,
    produtos: [
      ProdutoPedido(
        produto: produtoList[0],
        quantidade: 2,
      ),
      ProdutoPedido(
        produto: produtoList[1],
        quantidade: 2,
      ),
      ProdutoPedido(
        produto: produtoList[2],
        quantidade: 2,
      ),
      ProdutoPedido(
        produto: produtoList[3],
        quantidade: 2,
      ),
    ],
  ),
  Pedidos(
    pedidos_id: 8,
    fornecedor: "Recoopsol",
    itens: 3,
    data: "19/05/2021",
    tipo_entrega: "Entrega",
    situacao: "Entregue",
    pagamento: "Dinheiro",
    frete: 5.00,
    total: 36.18,
    produtos: [
      ProdutoPedido(
        produto: produtoList[0],
        quantidade: 2,
      ),
      ProdutoPedido(
        produto: produtoList[1],
        quantidade: 2,
      ),
      ProdutoPedido(
        produto: produtoList[2],
        quantidade: 2,
      ),
      ProdutoPedido(
        produto: produtoList[3],
        quantidade: 2,
      ),
    ],
  ),*/
];

List<Pedidos> pedidosListNaoEntregues = [
  /*Pedidos(
    pedidos_id: 1,
    fornecedor: "Recoopsol",
    itens: 3,
    data: "19/05/2021",
    tipo_entrega: "Entrega",
    situacao: "EM ANDAMENTO",
    pagamento: "Dinheiro",
    frete: 5.00,
    total: 36.18,
    produtos: [
      ProdutoPedido(
        produto: produtoList[0],
        quantidade: 2,
      ),
      ProdutoPedido(
        produto: produtoList[1],
        quantidade: 2,
      ),
      ProdutoPedido(
        produto: produtoList[2],
        quantidade: 2,
      ),
      ProdutoPedido(
        produto: produtoList[3],
        quantidade: 2,
      ),
    ],
  ),
  Pedidos(
    pedidos_id: 2,
    fornecedor: "Recoopsol",
    itens: 3,
    data: "19/05/2021",
    tipo_entrega: "Entrega",
    situacao: "EM ANDAMENTO",
    pagamento: "Dinheiro",
    frete: 5.00,
    total: 36.18,
    produtos: [
      ProdutoPedido(
        produto: produtoList[0],
        quantidade: 2,
      ),
      ProdutoPedido(
        produto: produtoList[1],
        quantidade: 2,
      ),
      ProdutoPedido(
        produto: produtoList[2],
        quantidade: 2,
      ),
      ProdutoPedido(
        produto: produtoList[3],
        quantidade: 2,
      ),
    ],
  ),
  Pedidos(
    pedidos_id: 3,
    fornecedor: "Recoopsol",
    itens: 3,
    data: "19/05/2021",
    tipo_entrega: "Entrega",
    situacao: "CANCELADO",
    pagamento: "Dinheiro",
    frete: 5.00,
    total: 36.18,
    produtos: [
      ProdutoPedido(
        produto: produtoList[0],
        quantidade: 2,
      ),
      ProdutoPedido(
        produto: produtoList[1],
        quantidade: 2,
      ),
      ProdutoPedido(
        produto: produtoList[2],
        quantidade: 2,
      ),
      ProdutoPedido(
        produto: produtoList[3],
        quantidade: 2,
      ),
    ],
  ),
  Pedidos(
    pedidos_id: 4,
    fornecedor: "Recoopsol",
    itens: 3,
    data: "19/05/2021",
    tipo_entrega: "Entrega",
    situacao: "CANCELADO",
    pagamento: "Dinheiro",
    frete: 5.00,
    total: 36.18,
    produtos: [
      ProdutoPedido(
        produto: produtoList[0],
        quantidade: 2,
      ),
      ProdutoPedido(
        produto: produtoList[1],
        quantidade: 2,
      ),
      ProdutoPedido(
        produto: produtoList[2],
        quantidade: 2,
      ),
      ProdutoPedido(
        produto: produtoList[3],
        quantidade: 2,
      ),
    ],
  ),
  Pedidos(
    pedidos_id: 5,
    fornecedor: "Recoopsol",
    itens: 3,
    data: "19/05/2021",
    tipo_entrega: "Entrega",
    situacao: "EM ANDAMENTO",
    pagamento: "Dinheiro",
    frete: 5.00,
    total: 36.18,
    produtos: [
      ProdutoPedido(
        produto: produtoList[0],
        quantidade: 2,
      ),
      ProdutoPedido(
        produto: produtoList[1],
        quantidade: 2,
      ),
      ProdutoPedido(
        produto: produtoList[2],
        quantidade: 2,
      ),
      ProdutoPedido(
        produto: produtoList[3],
        quantidade: 2,
      ),
    ],
  ),*/
];

String mensagem = 'Ola';
