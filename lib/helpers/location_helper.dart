const GOOGLE_API_KEY="AIzaSyB2R3TGlGaETV_0TnQ-oask0VlMP-oQq8U";
const SECRET_KEY = "Cmsvx7H8ShMDEP_b41q0IL8ybp4=";
class LocationHelper {

  static String generateLocationPreviewImage({required double latitude, required double longitude}){
     return 'https://maps.googleapis.com/maps/api/staticmap?center=&$latitude,$longitude&zoom=16&size=600x300&maptype=roadmap&markers=color:red%7Clabel:A%7C$latitude,$longitude&key=$GOOGLE_API_KEY';
  }
}