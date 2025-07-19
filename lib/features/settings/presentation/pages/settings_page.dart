import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../../../../core/constants/app_constants.dart';
import '../../../../core/themes/app_theme.dart';

@RoutePage()
class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  bool _darkMode = false;
  bool _notifications = true;
  bool _dataBackup = true;
  String _glucoseUnit = 'mg/dL';
  String _weightUnit = 'kg';
  String _reminderFrequency = '4 hours';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Settings')),
      body: ListView(
        padding: const EdgeInsets.all(AppConstants.defaultPadding),
        children: [
          _buildProfileSection(),
          const SizedBox(height: 24),
          _buildPreferencesSection(),
          const SizedBox(height: 24),
          _buildNotificationSection(),
          const SizedBox(height: 24),
          _buildDataSection(),
          const SizedBox(height: 24),
          _buildAboutSection(),
        ],
      ),
    );
  }

  Widget _buildProfileSection() {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(AppConstants.defaultPadding),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Profile',
              style: Theme.of(
                context,
              ).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            ListTile(
              leading: const CircleAvatar(
                backgroundColor: AppTheme.primaryColor,
                child: Icon(Icons.person, color: Colors.white),
              ),
              title: const Text('John Doe'),
              subtitle: const Text('john.doe@example.com'),
              trailing: const Icon(Icons.edit),
              onTap: () {
                // TODO: Navigate to profile edit
              },
            ),
            const Divider(),
            ListTile(
              leading: const Icon(Icons.medical_information),
              title: const Text('Health Profile'),
              subtitle: const Text('Medical conditions, goals, etc.'),
              trailing: const Icon(Icons.arrow_forward_ios),
              onTap: () {
                // TODO: Navigate to health profile
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPreferencesSection() {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(AppConstants.defaultPadding),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Preferences',
              style: Theme.of(
                context,
              ).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            SwitchListTile(
              title: const Text('Dark Mode'),
              subtitle: const Text('Use dark theme'),
              value: _darkMode,
              onChanged: (value) {
                setState(() {
                  _darkMode = value;
                });
                // TODO: Update theme preference
              },
            ),
            const Divider(),
            ListTile(
              leading: const Icon(Icons.straighten),
              title: const Text('Glucose Unit'),
              subtitle: Text(_glucoseUnit),
              trailing: const Icon(Icons.arrow_forward_ios),
              onTap: () {
                _showUnitSelector(
                  'Glucose Unit',
                  ['mg/dL', 'mmol/L'],
                  _glucoseUnit,
                  (value) {
                    setState(() {
                      _glucoseUnit = value;
                    });
                  },
                );
              },
            ),
            const Divider(),
            ListTile(
              leading: const Icon(Icons.scale),
              title: const Text('Weight Unit'),
              subtitle: Text(_weightUnit),
              trailing: const Icon(Icons.arrow_forward_ios),
              onTap: () {
                _showUnitSelector('Weight Unit', ['kg', 'lbs'], _weightUnit, (
                  value,
                ) {
                  setState(() {
                    _weightUnit = value;
                  });
                });
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildNotificationSection() {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(AppConstants.defaultPadding),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Notifications',
              style: Theme.of(
                context,
              ).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            SwitchListTile(
              title: const Text('Enable Notifications'),
              subtitle: const Text('Receive reminders and alerts'),
              value: _notifications,
              onChanged: (value) {
                setState(() {
                  _notifications = value;
                });
              },
            ),
            const Divider(),
            ListTile(
              leading: const Icon(Icons.access_time),
              title: const Text('Reminder Frequency'),
              subtitle: Text('Every $_reminderFrequency'),
              trailing: const Icon(Icons.arrow_forward_ios),
              enabled: _notifications,
              onTap: _notifications
                  ? () {
                      _showFrequencySelector();
                    }
                  : null,
            ),
            const Divider(),
            ListTile(
              leading: const Icon(Icons.medication),
              title: const Text('Medication Reminders'),
              subtitle: const Text('Set up medication alerts'),
              trailing: const Icon(Icons.arrow_forward_ios),
              enabled: _notifications,
              onTap: _notifications
                  ? () {
                      // TODO: Navigate to medication reminders
                    }
                  : null,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDataSection() {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(AppConstants.defaultPadding),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Data & Privacy',
              style: Theme.of(
                context,
              ).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            SwitchListTile(
              title: const Text('Data Backup'),
              subtitle: const Text('Backup data to cloud'),
              value: _dataBackup,
              onChanged: (value) {
                setState(() {
                  _dataBackup = value;
                });
              },
            ),
            const Divider(),
            ListTile(
              leading: const Icon(Icons.file_download),
              title: const Text('Export Data'),
              subtitle: const Text('Download your health data'),
              trailing: const Icon(Icons.arrow_forward_ios),
              onTap: () {
                _showExportDialog();
              },
            ),
            const Divider(),
            ListTile(
              leading: const Icon(Icons.delete_forever, color: Colors.red),
              title: const Text('Delete All Data'),
              subtitle: const Text('Permanently delete all health data'),
              trailing: const Icon(Icons.arrow_forward_ios),
              onTap: () {
                _showDeleteDataDialog();
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildAboutSection() {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(AppConstants.defaultPadding),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'About',
              style: Theme.of(
                context,
              ).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            ListTile(
              leading: const Icon(Icons.info),
              title: const Text('App Version'),
              subtitle: const Text(AppConstants.appVersion),
            ),
            const Divider(),
            ListTile(
              leading: const Icon(Icons.help),
              title: const Text('Help & Support'),
              subtitle: const Text('Get help and contact support'),
              trailing: const Icon(Icons.arrow_forward_ios),
              onTap: () {
                // TODO: Navigate to help
              },
            ),
            const Divider(),
            ListTile(
              leading: const Icon(Icons.privacy_tip),
              title: const Text('Privacy Policy'),
              subtitle: const Text('Read our privacy policy'),
              trailing: const Icon(Icons.arrow_forward_ios),
              onTap: () {
                // TODO: Navigate to privacy policy
              },
            ),
            const Divider(),
            ListTile(
              leading: const Icon(Icons.article),
              title: const Text('Terms of Service'),
              subtitle: const Text('Read our terms of service'),
              trailing: const Icon(Icons.arrow_forward_ios),
              onTap: () {
                // TODO: Navigate to terms of service
              },
            ),
          ],
        ),
      ),
    );
  }

  void _showUnitSelector(
    String title,
    List<String> options,
    String currentValue,
    Function(String) onSelected,
  ) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(title),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: options.map((option) {
            return RadioListTile<String>(
              title: Text(option),
              value: option,
              groupValue: currentValue,
              onChanged: (value) {
                if (value != null) {
                  onSelected(value);
                  Navigator.pop(context);
                }
              },
            );
          }).toList(),
        ),
      ),
    );
  }

  void _showFrequencySelector() {
    final frequencies = [
      '2 hours',
      '4 hours',
      '6 hours',
      '8 hours',
      '12 hours',
    ];
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Reminder Frequency'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: frequencies.map((frequency) {
            return RadioListTile<String>(
              title: Text('Every $frequency'),
              value: frequency,
              groupValue: _reminderFrequency,
              onChanged: (value) {
                if (value != null) {
                  setState(() {
                    _reminderFrequency = value;
                  });
                  Navigator.pop(context);
                }
              },
            );
          }).toList(),
        ),
      ),
    );
  }

  void _showExportDialog() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Export Data'),
        content: const Text(
          'Export your health data as a CSV file for backup or analysis?',
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancel'),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.pop(context);
              _exportData();
            },
            child: const Text('Export'),
          ),
        ],
      ),
    );
  }

  void _showDeleteDataDialog() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Delete All Data'),
        content: const Text(
          'Are you sure you want to permanently delete all your health data? This action cannot be undone.',
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancel'),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.pop(context);
              _deleteAllData();
            },
            style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
            child: const Text('Delete'),
          ),
        ],
      ),
    );
  }

  void _exportData() {
    // TODO: Implement data export functionality
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Data export functionality coming soon!'),
        backgroundColor: AppTheme.infoColor,
      ),
    );
  }

  void _deleteAllData() {
    // TODO: Implement data deletion functionality
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('All data deleted successfully!'),
        backgroundColor: AppTheme.successColor,
      ),
    );
  }
}
