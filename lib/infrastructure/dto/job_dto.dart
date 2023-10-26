import 'package:cloud_firestore/cloud_firestore.dart';

class JobDto {
  final String? id;
  final String jobCategory;
  final String jobDescription;
  final String jobExpiry;
  final String jobImage;
  final String jobLocation;
  final String jobOrganisation;
  final String jobPosted;
  final String jobSalary;
  final String jobTitle;

  JobDto({
    this.id,
    required this.jobCategory,
    required this.jobDescription,
    required this.jobExpiry,
    required this.jobImage,
    required this.jobLocation,
    required this.jobOrganisation,
    required this.jobPosted,
    required this.jobSalary,
    required this.jobTitle,
  });

  factory JobDto.fromSnapShot(DocumentSnapshot<Map<String, dynamic>> document) {
    final data = document.data()!;
    return JobDto(
      id: document.id,
      jobCategory: data['job_category'],
      jobDescription: data['job_description'],
      jobExpiry: data['job_expiry'],
      jobImage: data['job_image'],
      jobLocation: data['job_location'],
      jobOrganisation: data['job_organisation'],
      jobPosted: data['job_posted'],
      jobSalary: data['job_salary'],
      jobTitle: data['job_title'],
    );
  }
}
