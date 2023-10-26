import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

class PrivacPolicyPageScaffold extends StatelessWidget {
  const PrivacPolicyPageScaffold({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 100),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  InkWell(
                    onTap: () => context.router.pop(),
                    child: Image.asset('assets/icons/back_button.png'),
                  ),
                  const SizedBox(width: 15),
                  Text(
                    'Privacy Policy',
                    style: Theme.of(context).textTheme.displayMedium,
                  ),
                ],
              ),
              const SizedBox(height: 45),
              Text(
                'PRIVACY NOTICE',
                style: Theme.of(context).textTheme.bodyLarge,
              ),
              const SizedBox(height: 8),
              Text(
                'Last update: October 1, 2023',
                style: Theme.of(context).textTheme.bodyMedium,
              ),
              const SizedBox(height: 20),
              Text(
                'This privacy notice for us, describes how and why we might collect, store, use, and/or share ("process") your information when you use our services ("Services"), such as when you: \nDownload and use our mobile application (EnjoyNT), or any other application of ours that links to this privacy notice\nEngage with us in other related ways, including any sales, marketing, or events\nQuestions or concerns? Reading this privacy notice will help you understand your privacy rights and choices. If you do not agree with our policies and practices, please do not use our Services.',
                style: Theme.of(context).textTheme.bodySmall,
              ),
              const SizedBox(height: 20),
              Text(
                'SUMMARY OF KEY POINTS',
                style: Theme.of(context).textTheme.bodyLarge,
              ),
              const SizedBox(height: 8),
              Text(
                'This summary provides key points from our privacy notice, but you can find out more details about any of these topics by clicking the link following each key point or by using our table of contents below to find the section you are looking for.\n\nWhat personal information do we process? When you visit, use, or navigate our Services, we may process personal information depending on how you interact with us and the Services, the choices you make, and the products and features you use. Learn more about personal information you disclose to us.\n\nDo we process any sensitive personal information? We may process sensitive personal information when necessary with your consent or as otherwise permitted by applicable law. Learn more about sensitive information we process.\n\nDo we receive any information from third parties? We may receive information from public databases, marketing partners, social media platforms, and other outside sources. Learn more about information collected from other sources.\n\nHow do we process your information? We process your information to provide, improve, and administer our Services, communicate with you, for security and fraud prevention, and to comply with law. We may also process your information for other purposes with your consent. We process your information only when we have a valid legal reason to do so. Learn more about how we process your information.\n\nIn what situations and with which parties do we share personal information? We may share information in specific situations and with specific third parties. Learn more about when and with whom we share your personal information.\n\nWhat are your rights? Depending on where you are located geographically, the applicable privacy law may mean you have certain rights regarding your personal information. Learn more about your privacy rights.',
                style: Theme.of(context).textTheme.bodySmall,
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
