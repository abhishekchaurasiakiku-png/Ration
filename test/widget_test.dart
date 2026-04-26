// This is a basic Flutter widget test for the Ration MVP.

import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/material.dart';

import 'package:ration/app.dart';

void main() {
  testWidgets('App launches without crashing', (WidgetTester tester) async {
    await tester.pumpWidget(const RationApp());
    expect(find.text('Welcome Back'), findsOneWidget);
  });

  testWidgets('Login layout supports narrow mobile screens', (
    WidgetTester tester,
  ) async {
    await tester.binding.setSurfaceSize(const Size(360, 800));
    addTearDown(() => tester.binding.setSurfaceSize(null));

    await tester.pumpWidget(const RationApp());
    await tester.pumpAndSettle();

    expect(find.text('PDS Tracker'), findsOneWidget);
    expect(tester.takeException(), isNull);
  });

  testWidgets('Login layout supports laptop width', (
    WidgetTester tester,
  ) async {
    await tester.binding.setSurfaceSize(const Size(1280, 900));
    addTearDown(() => tester.binding.setSurfaceSize(null));

    await tester.pumpWidget(const RationApp());
    await tester.pumpAndSettle();

    expect(find.text('PDS Tracker'), findsOneWidget);
    expect(tester.takeException(), isNull);
  });

  testWidgets('Dashboard layout supports narrow mobile screens', (
    WidgetTester tester,
  ) async {
    await tester.binding.setSurfaceSize(const Size(360, 800));
    addTearDown(() => tester.binding.setSurfaceSize(null));

    await tester.pumpWidget(const RationApp());
    await tester.tap(find.widgetWithText(ElevatedButton, 'Login'));
    await tester.pumpAndSettle();

    expect(find.text('Monthly Ration Collection'), findsOneWidget);
    expect(find.text('Wheat'), findsWidgets);
    expect(find.text('Kerosene'), findsWidgets);
    expect(tester.takeException(), isNull);
  });
}
