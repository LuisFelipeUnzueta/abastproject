import 'package:abast_pk/abast_pk.dart';
import 'package:test/test.dart';

void main() {
  // test('Canary Test', () {
  //   // if (true == true)
  //   expect(true, true);
  // });

  group('Abastecimento.autonomia():', () {
    test('Deve retornar 10 quando a quantLitros = 10 e kmRodada = 100', () {
      // A - Arrumação
      double autonomiaEsperada = 10;
      double quantLitros = 10;
      int kmRodada = 100;
      Abastecimento abastecimento = Abastecimento(0.0, quantLitros, kmRodada);

      // A - Ação
      double autonomiaEncontrada = abastecimento.autonomia();

      // A - Averiguação
      expect(autonomiaEncontrada, autonomiaEsperada);
    });

    test('Deve retornar 5 quando a quantLitros = 20 e kmRodada = 100', () {
      double autonomiaEsperada = 5;
      double quantLitros = 20;
      int kmRodada = 100;
      Abastecimento abastecimento = Abastecimento(0.0, quantLitros, kmRodada);

      double autonomiaEncontrada = abastecimento.autonomia();

      expect(autonomiaEncontrada, autonomiaEsperada);
    });
  });

  group('Abastecimento.valorPorLitro():', () {
    test('Deve retornar 4 quando o valorTotal = 100 e quantLitros = 25', () {
      double valorPorLitroEsperado = 4;
      double valorTotal = 100;
      double quantLitros = 25;
      Abastecimento abastecimento = Abastecimento(valorTotal, quantLitros, 0);

      double valorPorLitroEncontrado = abastecimento.valorPorLitro();

      expect(valorPorLitroEncontrado, valorPorLitroEsperado);
    });

    test('Deve retornar 5 quando o valorTotal = 100 e quantLitros = 20', () {
      double valorPorLitroEsperado = 5;
      double valorTotal = 100;
      double quantLitros = 20;
      Abastecimento abastecimento = Abastecimento(valorTotal, quantLitros, 0);

      double valorPorLitroEncontrado = abastecimento.valorPorLitro();

      expect(valorPorLitroEncontrado, valorPorLitroEncontrado);
    });
  });
}
