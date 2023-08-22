import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'core/app.dart';

Future main() async {
  await dotenv.load(fileName: '.env');
  runApp(const ProviderScope(child: App()));
}
