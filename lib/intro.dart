import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portfolio_webapp/utils/constants.dart';
import 'package:portfolio_webapp/utils/screen_helper.dart';
import 'package:responsive_framework/responsive_framework.dart';

class Intro extends StatelessWidget {
  final List<Widget> widgetHorizontal = [
    Expanded(child: Container()),
    SizedBox(
      width: 100.0,
    ),
    Expanded(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: introText,
      ),
    )
  ];

  final List<Widget> widgetsVertical = [
    Expanded(child: Container(), flex: 2),
    Expanded(flex: 1,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: introText,
      ),
    )
  ];


  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        child: ScreenHelper(
          mobile: _buildDesktop(context, widgetsVertical, true),
          tablet: _buildDesktop(context, widgetHorizontal, false),
          desktop: _buildDesktop(context, widgetHorizontal, false),
        ),
      ),
    );
  }
}

final Widget hero_svg = SvgPicture.asset("hero.svg", package: "media",);


final List<Widget> introText = [
  Container(
    child: Text("Technical Artist", style: GoogleFonts.montserrat(fontSize: 15, fontWeight: FontWeight.w300)),
  ),
  SizedBox(
    height: 15.0,
  ),
  Container(
    child: Text("Mikkel S. K. Mogensen", style: GoogleFonts.ovo(fontSize: 30, fontWeight: FontWeight.w400)),
  ),
  SizedBox(
    height: 15.0,
  ),
  Container(
    child: Text("Generalist computer graphics artist 🎨 and creative programmer 👾, based in Copenhagen 󠁤󠁫󠀸󠀱󠁿", style: GoogleFonts.montserrat(fontSize: 20, fontWeight: FontWeight.w300)),
  )
];


Widget _buildDesktop(BuildContext context, List<Widget> children, bool flip) {
  return Center(
    child: ResponsiveWrapper(
      maxWidth: kDesktopMaxWidth,
      minWidth: kDesktopMaxWidth,
      defaultScale: false,
      child: _adaptView(context, flip, children),
    ),
  );
}

/// If true, turns wraps the content in a container and set the row to a column instead.
Widget _adaptView(BuildContext context, bool _flipVertically, List<Widget> children) {
  return _flipVertically
      ? Container(alignment: Alignment.center,
      height: MediaQuery.of(context).size.height,
      child: Column(children: children))
      : Row(children: children);
}

Widget _buildMobile(BuildContext context) {
  return Container();
}
