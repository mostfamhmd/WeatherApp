import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:weather/Feature/Home/Presentation/Model/weather_model.dart';
import 'package:weather/Feature/Home/data/services/weather_services.dart';

part 'weather_state.dart';

class WeatherCubit extends Cubit<WeatherState> {
  WeatherCubit() : super(WeatherInitial());

  Future<void> getWeatherInfo({required String cityName}) async {
    emit(WeatherCubitLoading());
    try {
      WeatherService services = WeatherService();
      WeatherModel weatherModel = await services.getWeather(cityName: cityName);
      emit(WeatherSuccess(weatherModel: weatherModel));
    } catch (e) {
      emit(WeatherFailed(errMessage: e.toString()));
    }
  }
}
