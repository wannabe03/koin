import 'package:flutter/material.dart';
import 'package:koin/common/const/colors.dart';
import 'package:koin/screen/user/signup/view/gradient_container.dart';
import 'package:koin/screen/user/signup/view/terms_of_use.dart';
import 'package:koin/screen/user/signup/widget/dropdown_field.dart';
import 'package:koin/screen/user/signup/view/signup_category_selection_screen.dart';
import 'package:koin/screen/user/signup/widget/guided_textbutton.dart';

class SignUpInfoScreen extends StatefulWidget {
  const SignUpInfoScreen({super.key});

  @override
  State<SignUpInfoScreen> createState() => _SignUpInfoScreenState();
}

class _SignUpInfoScreenState extends State<SignUpInfoScreen> {
  String? _selectedNationality;
  String? _selectedLanguage;
  String? _selectedResidenceType;
  String? _selectedResidencePeriod;

  final List<String> _nationalities = [
    'China',
    'Japan',
    'Taiwan',
    'USA',
    'Vietnam',
    'Philippines',
    'Hong Kong',
    'Thailand',
    'Malaysia',
  ];
  final List<String> _languages = [
    'English',
    'Chinese',
    'Japanese',
    'Cantonese (Hong Kong)',
    'Taiwanese',
    'Vietnamese',
    'Thai',
    'Malay',
  ];
  final List<String> _residenceTypes = [
    'Exchange Student',
    'Working Holiday',
    'Tourist',
    'Resident',
  ];
  final List<String> _residencePeriods = [
    '1 Month',
    '3 Months',
    '6 Months',
    '1 Year',
    'More than 1 Year',
  ];

  bool isEveryInfoFilled = false;

  void _setInfos() {
    if (_selectedNationality != null &&
        _selectedLanguage != null &&
        _selectedResidenceType != null &&
        _selectedResidencePeriod != null) {
      setState(() {
        isEveryInfoFilled = true;
      });
    } else {
      isEveryInfoFilled = false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return GradientContainer(
      hasSubmitButton: true,
      submitCallback:
          () => Navigator.of(context).push(
            MaterialPageRoute(
              builder:
                  (context) => CategorySelectionScreen(
                    selectedNationality: _selectedNationality!,
                    selectedLanguage: _selectedLanguage!,
                    selectedResidenceType: _selectedResidenceType!,
                    selectedResidencePeriod: _selectedResidencePeriod!,
                  ),
            ),
          ),
      submitLabel: "Next",
      isSubmitEnabled: isEveryInfoFilled,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Spacer(flex: 3),
          RichText(
            text: TextSpan(
              style: Theme.of(context).textTheme.headlineLarge,
              children: [
                TextSpan(
                  text:
                      'To help you use Koin more effectively, please select your \n',
                ),
                TextSpan(
                  text: 'visit information.',
                  style: TextStyle(color: PRIMARY_COLOR),
                ),
              ],
            ),
          ),

          const Spacer(flex: 1),
          DropdownField(
            label: 'Nationality',
            value: _selectedNationality,
            items: _nationalities,
            onChanged: (newValue) {
              setState(() {
                _selectedNationality = newValue;
                _setInfos();
              });
            },
          ),
          const SizedBox(height: 30),
          DropdownField(
            label: 'Language',
            value: _selectedLanguage,
            items: _languages,
            onChanged: (newValue) {
              setState(() {
                _selectedLanguage = newValue;
                _setInfos();
              });
            },
          ),
          const SizedBox(height: 30),
          DropdownField(
            label: 'Residence type',
            value: _selectedResidenceType,
            items: _residenceTypes,
            onChanged: (newValue) {
              setState(() {
                _selectedResidenceType = newValue;
                _setInfos();
              });
            },
          ),
          const SizedBox(height: 30),
          DropdownField(
            label: 'Residence Period',
            value: _selectedResidencePeriod,
            items: _residencePeriods,
            onChanged: (newValue) {
              setState(() {
                _selectedResidencePeriod = newValue;
                _setInfos();
              });
            },
          ),
          const Spacer(flex: 4),
          GuidedTextButton(
            nextRoute: MaterialPageRoute(
              builder: (context) => TermsOfUseScreen(),
            ),
            guideText: "Do you have any question?",
            label: "Terms of Use",
          ),

          const Spacer(flex: 3),
        ],
      ),
    );
  }
}
