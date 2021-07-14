class RainFallAmount {
  // rainfall amount
  double rainAmount;
  // application area in meter
  double applicationArea;
  // rainfall intensity in milimeter
  double raindensity;
  // time from applying fungicide till rainfall accure in minutes
  double time;
  // RainFallAmount(this.applicationArea, this.raindensity);

  double calcRainAmount(double aa, double rd) {
    rainAmount = (aa * 10000 * rd) / 1000;
    return rainAmount;
  }

  String respray(ra, t) {
    String message;
    if (t <= 360 || ra < 60) {
      message = "please Respray Your Fungicide Again Urgently.";
      // return message;
    } else if (t > 360 || ra < 60) {
      message = "Fungicide Is Safe No Need To Respray";
      // return message;
    }
    return message;
  }

  double calcFungicideReduction(fec, fet) {
    double fer = (fec - fet) / fec * 100;

    return fer;
  }

  double calcFungicideEfficacy(a, b) {
    double x = (a) - (b);
    double fungeEfficacy = (x / (a)) * 100;

    return fungeEfficacy;
  }
}
