import 'package:flutter/material.dart';
import 'package:koin/common/const/colors.dart';
import 'package:koin/screen/user/home_screen.dart';
import 'package:koin/screen/user/koin/view/koin_screen.dart';
import 'package:koin/screen/user/signup/view/gradient_container.dart';
import 'package:koin/screen/user/signup/widget/selection_section.dart';

class CategorySelectionScreen extends StatefulWidget {
  final String selectedNationality;
  final String selectedLanguage;
  final String selectedResidenceType;
  final String selectedResidencePeriod;

  const CategorySelectionScreen({
    super.key,
    required this.selectedNationality,
    required this.selectedLanguage,
    required this.selectedResidenceType,
    required this.selectedResidencePeriod,
  });

  @override
  State<CategorySelectionScreen> createState() =>
      _CategorySelectionScreenState();
}

class _CategorySelectionScreenState extends State<CategorySelectionScreen> {
  final Set<String> _selectedCategories = <String>{};
  final Set<String> _selectedRegions = <String>{};
  final Set<String> _selectedCultures = <String>{};

  final List<String> _categories = ['Travel', 'Work', 'Law', 'Life', 'Love'];
  final List<String> _regions = [
    'Seoul',
    'Busan',
    'Daejeon',
    'Daegu',
    'Jeju',
    'Gyeonggi',
    'Gangwon',
    'Chungbuk',
    'Chungnam',
    'Jeonbuk',
    'Jeonnam',
    'Gyeongbuk',
    'Gyeongnam',
    'Gwangju',
    'Ulsan',
  ];
  final List<String> _cultures = [
    'Café',
    'Food',
    'House',
    'Trip',
    'Art',
    'Game',
    'Korean',
    'K-pop',
    'Music',
    'Movie',
    'Drama',
    'Sport',
    'Museum',
    'Campus',
    'Band',
    'Photo',
    'Book',
  ];

  void _goToNextStep() {
    Navigator.of(
      context,
    ).push(MaterialPageRoute(builder: (context) => HomeScreen()));
  }

  @override
  Widget build(BuildContext context) {
    return GradientContainer(
      title: TextSpan(
        style: Theme.of(context).textTheme.headlineLarge,
        children: <TextSpan>[
          TextSpan(text: 'Please select all '),
          TextSpan(
            text: 'Korean-related\nkeywords ',
            style: TextStyle(color: PRIMARY_COLOR),
          ),
          TextSpan(text: 'that interest you.\n'),
        ],
      ),
      hasSubmitButton: true,
      submitCallback: () => _goToNextStep(),
      isSubmitEnabled: true,
      submitLabel: "Let's start Koin!",

      hasBottomTextButton: false,
      child: SingleChildScrollView(
        padding: const EdgeInsets.only(bottom: 120),
        child: Column(
          spacing: 36,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(),
            SelectionSection(
              title: 'Category',
              options: _categories,
              selectedOptions: _selectedCategories,
              onToggle: (option) {
                setState(() {
                  if (_selectedCategories.contains(option)) {
                    _selectedCategories.remove(option);
                  } else {
                    _selectedCategories.add(option);
                  }
                });
              },
            ),
            SelectionSection(
              title: 'Region',
              options: _regions,
              selectedOptions: _selectedRegions,
              onToggle: (option) {
                setState(() {
                  if (_selectedRegions.contains(option)) {
                    _selectedRegions.remove(option);
                  } else {
                    _selectedRegions.add(option);
                  }
                });
              },
            ),
            SelectionSection(
              title: 'Culture',
              options: _cultures,
              selectedOptions: _selectedCultures,
              onToggle: (option) {
                setState(() {
                  if (_selectedCultures.contains(option)) {
                    _selectedCultures.remove(option);
                  } else {
                    _selectedCultures.add(option);
                  }
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}
