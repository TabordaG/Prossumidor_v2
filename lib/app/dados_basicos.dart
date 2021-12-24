import 'dart:convert' show utf8, base64;

class Basicos {
  static String ip =
      "http://200.129.247.236:8000"; // variavel publica com anderline na frente private
  static String ip2 = "http://200.129.247.242:8000"; // ip servidor de produção
  // 200.129.247.242  ->servidor web Django
  static String categoriaUsada = '*'; //categorias id
  static String categoriaUsadaDesc = ' '; //categorias descricao
  static String empresaID = '';
  static String localRetiradaID =
      ''; //identifica local de reitrada na tabela de cliente

  //-----------controle de produtos
  static int offset =
      0; // posiciona a tela de home na posição inicial apos rolagens
  static List productList =
      []; // carrega o lista da tela de home e vi preenchendo com as rolagens
  static double pagina = 1; // contas as paginas na rolagem do home

  // ------------controle de pedidos
  static List meusPedidos = [];

  // armazena consulta de produtos temporariamente
  static String buscarProdutoHome = '';

  // variavel para mudar a seleção da categoria
  static int categoriaItem;

  static codifica(String cod) {
    // codifica o string a ser enviado ao servidor
    var bytesUtf8 = utf8
        .encode(cod.substring(39, cod.length)); //converte carateres em inteiro
    var dados = base64.encode(bytesUtf8); // converte inteiros para base64
    String temp = dados.substring(0, 2);
    String temp2 = dados.substring(2, dados.length);
    dados = temp + 'l' + temp2;

    return cod.substring(0, 39) + dados;
  }

  static decodifica(String cod) {
    // decodifica base64 que vem do servidor
    String temp = cod.substring(2, 4); //
    String temp2 = cod.substring(5, cod.length - 1);
    cod = temp + temp2;
    String dados = (utf8.decode(base64.decode(base64.normalize(cod))))
        .replaceAll('\'', '"');
    dados = dados.replaceAll(
        'Decimal(', ''); // remove esse tido de retorno Decimal("111.000")
    dados = dados.replaceAll(')', ''); // remove o ")"
    // dados = dados.substring(0, dados.length);
    print(dados);
    return dados;
  }

  static codificapwss(String cod) {
    // codifica o string a ser enviado ao servidor
    var bytesUtf8 = utf8
        .encode(cod.substring(0, cod.length)); //converte carateres em inteiro
    var dados = base64.encode(bytesUtf8); // converte inteiros para base64
    String temp = dados.substring(0, 2);
    String temp2 = dados.substring(2, dados.length);
    dados = temp + 'l' + temp2;

    return cod.substring(0, 1) + dados; // envia os dados
  }

  static decodificapwss(String cod) {
    String temp = cod.substring(0, 3); //
    String temp2 = cod.substring(4, cod.length);
    cod = temp + temp2;

    String dados = utf8.decode(base64.decode(cod.substring(1, cod.length)));

    return dados;
  }

  //remove caracteres especiais
  static strip(String cod) {
    String exp = cod.replaceAll(',', ' '); // remove virgula
    String exp2 = exp.replaceAll('"', ' '); //remove aspas duplas
    return exp2; // envia os dados
  }
}
