package com.example.weather.controllers;

import com.example.weather.WeatherForecast;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.client.RestTemplate;

import java.util.List;
import java.util.Map;

@Controller
public class WeatherController {
    @Value("${openweather.api.key}")
    private String apiKey;
    @GetMapping("/")
    public String showWeatherForm(Model model) {
        model.addAttribute("city", "");
        return "search";
    }
    @PostMapping("/")
    public String getWeatherForCity(@RequestParam("city") String city, Model model) {
        String url = "https://api.openweathermap.org/data/2.5/weather?q=" + city + "&appid=" + apiKey;

        RestTemplate restTemplate = new RestTemplate();
        ResponseEntity<Map> response = restTemplate.getForEntity(url, Map.class);
        Map<String, Object> weatherData = response.getBody();

        WeatherForecast forecast = new WeatherForecast();
        forecast.setCity((String) weatherData.get("name"));

        List<Map<String, Object>> weatherDetails = (List<Map<String, Object>>) weatherData.get("weather");
        if (weatherDetails != null && !weatherDetails.isEmpty()) {
            Map<String, Object> weather = weatherDetails.get(0);
            forecast.setDescription((String) weather.get("description"));
        }

        Map<String, Object> mainDetails = (Map<String, Object>) weatherData.get("main");
        if (mainDetails != null) {
            double temperature = (double) mainDetails.get("temp");
            double celsiusTemperature = temperature - 273.15;
            forecast.setTemperature(celsiusTemperature);
        }
        String imageUrl = getCityImage(city);
        model.addAttribute("forecast", forecast);
        model.addAttribute("city", city);
        model.addAttribute("imageUrl", imageUrl);
        return "weather";
    }
    private String getCityImage(String city) {
        String url = "https://api.unsplash.com/search/photos?query=" + city + "&client_id=XTVej1F4gyKJhEs7s0FSawrht_h5qYFepBSAjsCVYmw";

        RestTemplate restTemplate = new RestTemplate();
        ResponseEntity<Map> response = restTemplate.getForEntity(url, Map.class);
        Map<String, Object> imageData = response.getBody();

        List<Map<String, Object>> results = (List<Map<String, Object>>) imageData.get("results");
        if (results != null && !results.isEmpty()) {
            Map<String, Object> firstResult = results.get(0);
            Map<String, Object> urls = (Map<String, Object>) firstResult.get("urls");
            if (urls != null) {
                return (String) urls.get("small");
            }
        }
        return null;
    }
}
