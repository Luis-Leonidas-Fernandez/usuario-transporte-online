part of 'map_bloc.dart';

class MapState extends Equatable {

  final bool isLoadedIcon;
  final bool isMapInitialized;
  final bool isfollowingUser;
  final bool isAccepted;
  final bool isCardReady;

  const MapState({
    this.isMapInitialized= false,
    this.isfollowingUser = true,
    this.isLoadedIcon     = false,
    this.isAccepted = false,
    this.isCardReady = false, 
    });


  MapState copyWith({
    bool? isMapInitialized,
    bool? isfollowingUser,
    bool? isLoadedIcon,
    bool? isAccepted,
    bool? isCardReady

  })
   => MapState(
     isMapInitialized: isMapInitialized ?? this.isMapInitialized,
     isfollowingUser: isfollowingUser ?? this.isfollowingUser,
     isLoadedIcon: isLoadedIcon ?? this.isLoadedIcon,
     isAccepted: isAccepted?? this.isAccepted,
     isCardReady: isCardReady ?? this.isCardReady
   );
  
  @override
  List<Object> get props => [isMapInitialized, isfollowingUser, isLoadedIcon,  isAccepted, isCardReady];
}


