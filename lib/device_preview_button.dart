import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

class CustomPlugin extends StatelessWidget {
  final String authorDescription;
  final String? sourceCodeUrl;
  final String? apkDownloadUrl;
  final Color themeColor;

  const CustomPlugin({
    super.key,
    this.authorDescription = "Flutter Developer",
    this.sourceCodeUrl,
    this.apkDownloadUrl,
    this.themeColor = const Color(0xFF2196F3),
  });

  @override
  Widget build(BuildContext context) {
    return ToolPanelSection(
      title: 'Auther and Project INFO',
      children: [
        Container(
          decoration: BoxDecoration(
            color: themeColor.withOpacity(0.05),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Column(
            children: [
              _buildAuthorSection(),
              _buildActionSection(),
            ],
          ),
        ),
      ],
    );
  }

  // Up

  Widget _buildActionButton({
    required IconData icon,
    required String label,
    required VoidCallback onPressed,
    bool isPrimary = false,
  }) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: isPrimary ? themeColor : themeColor.withOpacity(0.1),
        foregroundColor: isPrimary ? Colors.white : themeColor,
        padding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 12,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        elevation: isPrimary ? 2 : 0,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            icon,
            size: 20,
            color: isPrimary ? Colors.white : themeColor,
          ),
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

  Widget _buildActionSection() {
    return Container(
      padding: const EdgeInsets.all(16),
      child: Row(
        children: [
          if (sourceCodeUrl != null)
            Expanded(
              child: _buildActionButton(
                icon: Icons.code,
                label: 'Source Code',
                onPressed: () => _launchUrl(sourceCodeUrl!),
              ),
            ),
          if (sourceCodeUrl != null && apkDownloadUrl != null)
            const SizedBox(width: 12),
          if (apkDownloadUrl != null)
            Expanded(
              child: _buildActionButton(
                icon: Icons.download,
                label: 'Download APK',
                onPressed: () => _launchUrl(apkDownloadUrl!),
                isPrimary: true,
              ),
            ),
        ],
      ),
    );
  }

  Widget _buildAuthorSection() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: themeColor.withOpacity(0.1),
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(12),
          topRight: Radius.circular(12),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              CircleAvatar(
                backgroundColor: themeColor,
                radius: 24,
                child: const Text(
                  'HK',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Harshit Khandelwal',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: themeColor,
                      ),
                    ),
                    Text(
                      authorDescription,
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.grey[600],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          _buildSocialButtons(),
        ],
      ),
    );
  }

  Widget _buildSocialButtons() {
    return Wrap(
      spacing: 8,
      runSpacing: 8,
      alignment: WrapAlignment.center,
      children: [
        _buildSocialLink(
          icon: FontAwesomeIcons.globe,
          label: 'Portfolio',
          url: 'https://harshit2756.github.io/portfolio/',
        ),
        _buildSocialLink(
          icon: FontAwesomeIcons.github,
          label: 'GitHub',
          url: 'https://github.com/Harshit2756',
        ),
        _buildSocialLink(
          icon: FontAwesomeIcons.twitter,
          label: 'Twitter',
          url: 'https://twitter.com/Harshit2756',
        ),
        _buildSocialLink(
          icon: FontAwesomeIcons.linkedin,
          label: 'LinkedIn',
          url: 'https://www.linkedin.com/in/harshit-khandelwal-3a76631b9/',
        ),
        _buildSocialLink(
          icon: FontAwesomeIcons.medium,
          label: 'Medium',
          url: 'https://medium.com/@Harshit2756',
        ),
      ],
    );
  }

  Widget _buildSocialLink({
    required IconData icon,
    required String label,
    required String url,
  }) {
    return Tooltip(
      message: label,
      child: InkWell(
        onTap: () => _launchUrl(url),
        borderRadius: BorderRadius.circular(8),
        child: Container(
          padding: const EdgeInsets.symmetric(
            horizontal: 12,
            vertical: 8,
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              FaIcon(
                icon,
                size: 18,
                color: themeColor,
              ),
              const SizedBox(width: 8),
              Text(
                label,
                style: TextStyle(
                  color: themeColor,
                  fontSize: 14,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _launchUrl(String url) async {
    if (!await launchUrl(Uri.parse(url))) {
      throw Exception('Could not launch $url');
    }
  }
}
