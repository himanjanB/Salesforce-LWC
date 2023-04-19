public with sharing class Spoonacular {

    private static final String SPOONACULAR_API = 'https://api.spoonacular.com';
    private static final String API_KEY = '9eecb78ad98442aaa47bd22dfc1d39b2';

    public static void getRandomRecipes() {
        Http http = new Http();
        HttpRequest request = new HttpRequest();
        request.setEndpoint(SPOONACULAR_API + '/recipes/random?apiKey=' + API_KEY);
        request.setMethod('GET');
        HttpResponse response = http.send(request);

        System.debug('Response Code is ' + response.getStatusCode());

        if(response.getStatusCode() == 200) {
            System.debug('Response is ' + response.getBody());
        }
    }
}