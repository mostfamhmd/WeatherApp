import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:weather/Model/weather_model.dart';
import 'package:weather/Services/weather_services.dart';

part 'weather_state.dart';

class WeatherCubit extends Cubit<WeatherState> {
  WeatherCubit(this.weatherServices) : super(WeatherInitial());
  WeatherServices weatherServices;
  WeatherModel? weatherModel;
  getWeather({required String cityName}) async {
    emit(WeatherLoading());
    try {
      weatherModel = await weatherServices.getWeather(cityName: cityName);
      emit(WeatherSuccess());
    } catch (e) {
      emit(WeatherFailure(failed: e.toString()));
    }
  }
}
