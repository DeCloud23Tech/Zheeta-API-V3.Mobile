import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:zheeta/app/common/storage/local_storage.dart';
import 'package:zheeta/app/common/storage/local_storage_impl.dart';

import '../../../mock/app/common/storage/box.mocks.dart';

void main() {
  group('LocalStorageImpl', () {
    late LocalStorage localStorage;
    late MockBox mockBox;

    setUp(() {
      mockBox = MockBox();
      localStorage = LocalStorageImpl(mockBox);
    });

    test('setString', () async {
      await localStorage.setString('key', 'value');

      verify(mockBox.put('key', 'value')).called(1);
    });

    test('getString', () {
      when(mockBox.get('key')).thenReturn('value');

      final result = localStorage.getString('key');

      expect(result, equals('value'));
    });

    test('setJson', () async {
      final jsonValue = {'key': 'value'};
      await localStorage.setJson('key', jsonValue);

      verify(mockBox.put('key', jsonEncode(jsonValue))).called(1);
    });

    test('getJson', () {
      final jsonValue = {'key': 'value'};
      when(mockBox.get('key')).thenReturn(jsonEncode(jsonValue));

      final result = localStorage.getJson('key');

      expect(result, equals(jsonValue));
    });

    // test('addToJsonList', () async {
    //   final existingList = [
    //     {'existingKey': 'existingValue'}
    //   ];
    //   final newValue = {'newKey': 'newValue'};
    //   when(mockBox.get('key')).thenReturn(jsonEncode(existingList));

    //   await localStorage.addToJsonList('key', newValue);

    //   final decodedExistingList = jsonDecode(mockBox.get('key')!);
    //   final expectedList = [...(decodedExistingList as List), newValue];
    //   verify(mockBox.put('key', jsonEncode(expectedList))).called(1);
    // });

    // test('getJsonList', () {
    //   final jsonList = [
    //     {'key': 'value'},
    //     {'anotherKey': 'anotherValue'}
    //   ];
    //   when(mockBox.get('key')).thenReturn(jsonEncode(jsonList));

    //   final result = localStorage.getJsonList('key');

    //   expect(result, equals(jsonList));
    // });

    // test('setBool', () async {
    //   await localStorage.setBool('key', true);

    //   verify(mockBox.put('key', true)).called(1);
    // });

    // test('getBool', () {
    //   when(mockBox.get('key')).thenReturn(true);

    //   final result = localStorage.getBool('key');

    //   expect(result, equals(true));
    // });

    // test('delete', () async {
    //   await localStorage.delete('key');

    //   verify(mockBox.delete('key')).called(1);
    // });

    // test('clear', () async {
    //   await localStorage.clear();

    //   verify(mockBox.clear()).called(1);
    // });

    // test('removeAllExcept', () async {
    //   when(mockBox.keys).thenReturn({'key1', 'key2', 'key3'});

    //   await localStorage.removeAllExcept(['key1', 'key3']);

    //   verify(mockBox.deleteAll(['key2'])).called(1);
    // });
  });
}
