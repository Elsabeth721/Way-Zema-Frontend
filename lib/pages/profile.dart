import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'package:way_zema/pages/theme_color.dart';

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  late TextEditingController _nameController;
  late TextEditingController _contactController;
  late TextEditingController _emailController;
  late TextEditingController _quoteController;

  File? _profileImage;
  bool _isEditing = false;

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController();
    _contactController = TextEditingController();
    _emailController = TextEditingController();
    _quoteController = TextEditingController();
    _loadProfileData();
  }

  Future<void> _loadProfileData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      _nameController.text = prefs.getString('name') ?? 'Your Name';
      _contactController.text = prefs.getString('contact') ?? 'Your Contact';
      _emailController.text = prefs.getString('email') ?? 'Your Email';
      _quoteController.text = prefs.getString('quote') ?? 'Your Favorite Quote';
      String? imagePath = prefs.getString('profileImage');
      if (imagePath != null) {
        _profileImage = File(imagePath);
      }
    });
  }

  Future<void> _saveProfileData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('name', _nameController.text);
    await prefs.setString('contact', _contactController.text);
    await prefs.setString('email', _emailController.text);
    await prefs.setString('quote', _quoteController.text);
    if (_profileImage != null) {
      await prefs.setString('profileImage', _profileImage!.path);
    }
  }

  Future<void> _pickImage() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      setState(() {
        _profileImage = File(pickedFile.path);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final themeColors = ThemeColors.fromContext(context);
    
    return Scaffold(
      appBar: AppBar(
        backgroundColor: themeColors.appBarColor,
        title: const Text('Profile'),
        actions: [
          IconButton(
            icon: Icon(
              _isEditing ? Icons.save : Icons.edit,
              color: themeColors.iconColor,
            ),
            onPressed: () {
              if (_isEditing) {
                _saveProfileData();
              }
              setState(() {
                _isEditing = !_isEditing;
              });
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              clipBehavior: Clip.none, 
              children: [
                Container(
                  width: double.infinity,
                  height: 130,
                  color: themeColors.backgroundColor,
                ),
                Positioned(
                  top: 50, 
                  left: MediaQuery.of(context).size.width / 2 - 80, 
                  child: GestureDetector(
                    onTap: _isEditing ? _pickImage : null,
                    child: CircleAvatar(
                      radius: 80,
                      backgroundImage: _profileImage != null
                          ? FileImage(_profileImage!)
                          : const AssetImage('assets/default_profile.png')
                              as ImageProvider,
                      child: _isEditing
                          ? Icon(
                              Icons.camera_alt,
                              size: 40,
                              color: themeColors.iconColor.withOpacity(0.7),
                            )
                          : null,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 140),
            _buildProfileField(
              controller: _nameController,
              label: 'Name',
              icon: Icons.person,
              isEditable: _isEditing,
              themeColors: themeColors,
            ),
            _buildProfileField(
              controller: _contactController,
              label: 'Contact',
              icon: Icons.phone,
              isEditable: _isEditing,
              themeColors: themeColors,
            ),
            _buildProfileField(
              controller: _emailController,
              label: 'Email',
              icon: Icons.email,
              isEditable: _isEditing,
              themeColors: themeColors,
            ),
            _buildProfileField(
              controller: _quoteController,
              label: 'Favorite Quote',
              icon: Icons.format_quote,
              isEditable: _isEditing,
              themeColors: themeColors,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildProfileField({
    required TextEditingController controller,
    required String label,
    required IconData icon,
    required bool isEditable,
    required ThemeColors themeColors,
  }) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      decoration: BoxDecoration(
        color: themeColors.cardColor,
        borderRadius: BorderRadius.circular(15),
      ),
      child: ListTile(
        leading: Icon(icon, color: themeColors.iconColor),
        title: TextField(
          controller: controller,
          enabled: isEditable,
          style: TextStyle(color: themeColors.textColor),
          decoration: InputDecoration(
            labelText: label,
            labelStyle: TextStyle(color: themeColors.secondaryTextColor),
            border: InputBorder.none,
          ),
        ),
      ),
    );
  }
}
