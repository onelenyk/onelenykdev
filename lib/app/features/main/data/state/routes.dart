
enum Routes {
  Resume,
  HireMe,
  Collab,
  Blog,
  AboutSite,
  Design
}

extension RouteExtension on Routes {

  String get title {
    switch (this) {
      case Routes.Resume:
        return "resume 📓";
      case Routes.HireMe:
        return "hire me 👀";
      case Routes.Blog:
        return "blog 📺";
      case Routes.AboutSite:
        return "the site story 🚨";
      case Routes.Collab:
        return "collaboration 🌍";
      case Routes.Design:
        return "Design develop 👾";
        break;
    }
  }
}