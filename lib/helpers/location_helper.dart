const GOOGLE_API_KEY="AIzaSyCgQ8q60HpzwIZXBCmm7ftb_mYfC-SyJYo";

class LocationHelper {

  static String generateLocationPreviewImage({required double latitude, required double longitute}){
    return "https://maps.googleapis.com/maps/api/staticmap?center=&$latitude,$longitute&zoom=16&size=600x300&maptype=roadmap&markers=color:red%7Clabel:C%7C$latitude,$longitute&key=YOUR_API_KEY&signature=$GOOGLE_API_KEY";
  }
}