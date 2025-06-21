import 'dart:developer';
import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:easy_social_share/easy_social_share.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Easy Social Share Demo",
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        useMaterial3: true,
      ),
      home: const ShareDemoScreen(),
    );
  }
}

class ShareDemoScreen extends StatefulWidget {
  const ShareDemoScreen({super.key});

  @override
  State<ShareDemoScreen> createState() => _ShareDemoScreenState();
}

class _ShareDemoScreenState extends State<ShareDemoScreen> {
  final EasySocialShare _easySocialShare = EasySocialShare();
  bool _isLoading = false;

  final List<String> _externalImageUrls = [
    'https://media.portraitmode.app/pmlive/2023/09/portraitmode-6503528c9e6b9-david-vongries-768x512.jpg',
    'https://media.portraitmode.app/pmlive/2022/09/portraitmode-63628a212698b-david-vongries-768x1145.jpg'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Easy Social Share'),
        centerTitle: true,
        primary: true,
        elevation: 0.5,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Local Images Sharing Section
              _buildSectionHeader('Local Images Sharing'),
              const SizedBox(height: 16),
              _buildShareButton(
                icon: Icons.system_update_alt,
                label: 'Share image to system',
                description: 'Use native Android share dialog',
                color: Colors.blue,
                onPressed: _isLoading
                    ? null
                    : () async {
                        await _handleShare(_shareToSystem);
                      },
              ),
              const SizedBox(height: 16),
              _buildShareButton(
                icon: Icons.chat,
                label: 'Share image to WhatsApp',
                description: 'Share directly to WhatsApp',
                color: Colors.green,
                onPressed: _isLoading
                    ? null
                    : () async {
                        await _handleShare(_shareToWhatsApp);
                      },
              ),

              const SizedBox(height: 32),

              // External Images Sharing Section
              _buildSectionHeader('External Images Sharing'),
              const SizedBox(height: 16),
              ..._buildExternalImagesList(),

              if (_isLoading) ...[
                const SizedBox(height: 32),
                const Center(
                  child: Column(
                    children: [
                      CircularProgressIndicator(),
                      SizedBox(height: 16),
                      Text(
                        'Processing...',
                        style: TextStyle(color: Colors.grey),
                      ),
                    ],
                  ),
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildShareButton({
    required IconData icon,
    required String label,
    required String description,
    required Color color,
    required VoidCallback? onPressed,
  }) {
    return Container(
      width: double.infinity,
      height: 80,
      margin: const EdgeInsets.symmetric(vertical: 4),
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: color,
          foregroundColor: Colors.white,
          elevation: 2,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
        child: Row(
          children: [
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Colors.white.withValues(alpha: 0.2),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Icon(icon, size: 24),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    label,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    description,
                    style: TextStyle(
                      fontSize: 12,
                      color: Colors.white.withValues(alpha: 0.8),
                    ),
                  ),
                ],
              ),
            ),
            const Icon(Icons.arrow_forward_ios, size: 16),
          ],
        ),
      ),
    );
  }

  Widget _buildSectionHeader(String title) {
    return Text(
      title,
      style: const TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.bold,
        color: Colors.black87,
      ),
    );
  }

  List<Widget> _buildExternalImagesList() {
    return _externalImageUrls.map((imageUrl) {
      return Container(
        margin: const EdgeInsets.only(bottom: 24),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withValues(alpha: 0.2),
              spreadRadius: 1,
              blurRadius: 4,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Column(
          children: [
            ClipRRect(
              borderRadius:
                  const BorderRadius.vertical(top: Radius.circular(12)),
              child: CachedNetworkImage(
                imageUrl: imageUrl,
                height: 200,
                width: double.infinity,
                fit: BoxFit.cover,
                placeholder: (context, url) => Container(
                  height: 200,
                  color: Colors.grey[200],
                  child: const Center(
                    child: CircularProgressIndicator(),
                  ),
                ),
                errorWidget: (context, url, error) => Container(
                  height: 200,
                  color: Colors.grey[200],
                  child: const Center(
                    child: Icon(
                      Icons.error,
                      color: Colors.red,
                      size: 48,
                    ),
                  ),
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.all(16),
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius:
                    BorderRadius.vertical(bottom: Radius.circular(12)),
              ),
              child: Row(
                children: [
                  Expanded(
                    child: _buildSmallShareButton(
                      icon: Icons.system_update_alt,
                      label: 'System',
                      color: Colors.blue,
                      onPressed: _isLoading
                          ? null
                          : () async {
                              await _handleExternalImageShare(
                                imageUrl,
                                _shareToSystem,
                              );
                            },
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: _buildSmallShareButton(
                      icon: Icons.chat,
                      label: 'WhatsApp',
                      color: Colors.green,
                      onPressed: _isLoading
                          ? null
                          : () async {
                              await _handleExternalImageShare(
                                imageUrl,
                                _shareToWhatsApp,
                              );
                            },
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      );
    }).toList();
  }

  Widget _buildSmallShareButton({
    required IconData icon,
    required String label,
    required Color color,
    required VoidCallback? onPressed,
  }) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: color,
        foregroundColor: Colors.white,
        elevation: 1,
        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, size: 18),
          const SizedBox(width: 8),
          Text(
            label,
            style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }

  Future<void> _handleShare(
    Future<String> Function(String, String) shareFunction,
  ) async {
    setState(() {
      _isLoading = true;
    });

    try {
      FilePickerResult? file = await FilePicker.platform.pickFiles(
        type: FileType.image,
        allowMultiple: false,
      );

      if (file != null && file.paths.isNotEmpty && file.paths[0] != null) {
        final String shareResult = await shareFunction(
            "Check out this amazing image! 📸", file.paths[0]!);

        log('Share result: $shareResult');
        _showSnackBar('Share completed successfully!', Colors.green);
      } else {
        _showSnackBar('No image selected', Colors.orange);
      }
    } catch (e) {
      log('Share error: $e');
      _showSnackBar('Failed to share: $e', Colors.red);
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }

  Future<void> _handleExternalImageShare(
    String imageUrl,
    Future<String> Function(String, String) shareFunction,
  ) async {
    setState(() {
      _isLoading = true;
    });

    try {
      // Download the image using DefaultCacheManager
      final file = await DefaultCacheManager().getSingleFile(imageUrl);

      final String shareResult =
          await shareFunction("Check out this amazing image! 📸", file.path);

      log('Share result: $shareResult');
      _showSnackBar('Share completed successfully!', Colors.green);
    } catch (e) {
      log('Share error: $e');
      _showSnackBar('Failed to share: $e', Colors.red);
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }

  Future<String> _shareToSystem(String message, String filePath) async {
    String result = 'Unsupported platform';

    if (Platform.isAndroid) {
      result = await _easySocialShare.android.shareToSystem(
        'Share Image',
        message,
        filePath,
      );
    } else if (Platform.isIOS) {
      result = await _easySocialShare.iOS.shareToSystem(
        message,
        filePaths: [filePath],
      );
    }

    return result;
  }

  Future<String> _shareToWhatsApp(String message, String filePath) async {
    String result = 'Unsupported platform';

    if (Platform.isAndroid) {
      result = await _easySocialShare.android.shareToWhatsapp(
        message,
        filePath,
      );
    } else if (Platform.isIOS) {
      result = await _easySocialShare.iOS.shareImageToWhatsApp(filePath);
    }

    return result;
  }

  void _showSnackBar(String message, Color color) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: color,
        duration: const Duration(seconds: 3),
      ),
    );
  }
}
