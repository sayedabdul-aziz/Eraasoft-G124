import 'package:doctor_profile_ui/core/colors.dart';
import 'package:doctor_profile_ui/widgets/address_widget.dart';
import 'package:doctor_profile_ui/widgets/contact_widget.dart';
import 'package:doctor_profile_ui/widgets/custom_button.dart';
import 'package:doctor_profile_ui/widgets/profile_header.dart';
import 'package:flutter/material.dart';

class DoctorProfileScreen extends StatelessWidget {
  const DoctorProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.primaryColor,
        leading: Icon(
          Icons.arrow_back_ios_new_rounded,
          color: Colors.white,
        ),
        title: Text(
          'Doctor Profile',
          style: TextStyle(color: Colors.white, fontSize: 20),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ProfileHeader(),
              SizedBox(height: 10),
              Text(
                'About',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
              ),
              Text(
                  'Former Head of Department of Dental Surgery at the University of Oxford'),
              SizedBox(height: 16),
              AddressWidget(),
              Divider(),
              SizedBox(height: 10),
              Text(
                'Contact Info',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
              ),
              SizedBox(height: 10),
              ContactInfoWidget(),
              SizedBox(height: 20),
              CustomButton(
                text: 'Chat With Dr',
                bgColor: Colors.green,
                onPressed: () {},
              ),
              SizedBox(height: 10),
              CustomButton(
                text: 'Book an Appointment',
                onPressed: () {},
              )
            ],
          ),
        ),
      ),
    );
  }
}
