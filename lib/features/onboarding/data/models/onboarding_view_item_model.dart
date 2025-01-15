class OnboardingItemViewModel {
  final int currentPageIndex;
  final String image;
  final String title;
  final String subtitle;
  final String textButton1;
  final String textbutton2;
  final void Function()? onTapNext;
  final void Function()? onTapSkip;

  const OnboardingItemViewModel({
    required this.currentPageIndex,
    required this.image,
    required this.title,
    required this.subtitle,
    required this.textButton1,
    required this.textbutton2,
    this.onTapNext,
    this.onTapSkip,
  });
}
