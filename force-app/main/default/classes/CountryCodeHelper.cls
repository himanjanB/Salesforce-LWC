public class CountryCodeHelper {
  public static String getCountryCode(String country) {
      return Country_Code__mdt.getInstance(country).Country_Code__c;
  }
}