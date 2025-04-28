  import 'package:flutter/widgets.dart';

import '../core/constants/text_font_style.dart';

Center powerByText() {
    return Center(
      child: RichText(
        text: TextSpan(
          text: 'Powered by ',
          style: TextFontStyle.headline12w400cADADAD,
          children: [
            TextSpan(
              text: 'M360 ICT',
              style: TextFontStyle.headline14w700primaryColor,
            ),
          ],
        ),
      ),
    );
  }