// BasicProfileWidget
import 'package:flutter/material.dart';

import '../../../app/common/color.dart';
import '../../data/model/user_profile_model.dart';
import 'basic_profile_prop.dart';

class BasicProfileWidget extends StatelessWidget {
  final ProfileModel? profile;

  BasicProfileWidget({required this.profile});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Basic Profile",
          style: TextStyle(
            color: AppColors.grayscale,
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),
        ),
        SizedBox(height: 10),
        ...[
          BasicProfileProp(
            leftTitle: 'Height',
            leftValue: '${profile?.height?.round()}cm',
            rightTitle: 'Weight',
            rightValue: '${profile?.weight?.round()}kg',
          ),
          BasicProfileProp(
            leftTitle: 'Body Type',
            leftValue: '${profile?.bodyType}',
            rightTitle: 'Occupation',
            rightValue: '${profile?.occupation}',
          ),
          BasicProfileProp(
            leftTitle: 'Complexion',
            leftValue: '${profile?.complexion}',
            rightTitle: 'Language',
            rightValue: '${profile?.languageCSV}',
          ),
          BasicProfileProp(
            leftTitle: 'Religion',
            leftValue: '${profile?.religion}',
          ),
        ],
        SizedBox(height: 20),
      ],
    );
  }
}
