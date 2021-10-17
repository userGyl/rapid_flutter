import 'package:flutter_module/generated/json/base/json_convert_content.dart';

class HomePageEntity with JsonConvert<HomePageEntity> {
	late HomePageConfig config;
	late List<HomePageBannerList> bannerList;
	late List<HomePageLocalNavList> localNavList;
	late HomePageGridNav gridNav;
	late List<HomePageSubNavList> subNavList;
	late HomePageSalesBox salesBox;
}

class HomePageConfig with JsonConvert<HomePageConfig> {
	late String searchUrl;
}

class HomePageBannerList with JsonConvert<HomePageBannerList> {
	late String icon;
	late String url;
}

class HomePageLocalNavList with JsonConvert<HomePageLocalNavList> {
	late String icon;
	late String title;
	late String url;
	late String statusBarColor;
	late bool hideAppBar;
}

class HomePageGridNav with JsonConvert<HomePageGridNav> {
	late HomePageGridNavHotel hotel;
	late HomePageGridNavFlight flight;
	late HomePageGridNavTravel travel;
}

class HomePageGridNavHotel with JsonConvert<HomePageGridNavHotel> {
	late String startColor;
	late String endColor;
	late HomePageGridNavHotelMainItem mainItem;
	late HomePageGridNavHotelItem1 item1;
	late HomePageGridNavHotelItem2 item2;
	late HomePageGridNavHotelItem3 item3;
	late HomePageGridNavHotelItem4 item4;
}

class HomePageGridNavHotelMainItem with JsonConvert<HomePageGridNavHotelMainItem> {
	late String title;
	late String icon;
	late String url;
	late String statusBarColor;
}

class HomePageGridNavHotelItem1 with JsonConvert<HomePageGridNavHotelItem1> {
	late String title;
	late String url;
	late String statusBarColor;
}

class HomePageGridNavHotelItem2 with JsonConvert<HomePageGridNavHotelItem2> {
	late String title;
	late String url;
}

class HomePageGridNavHotelItem3 with JsonConvert<HomePageGridNavHotelItem3> {
	late String title;
	late String url;
	late bool hideAppBar;
}

class HomePageGridNavHotelItem4 with JsonConvert<HomePageGridNavHotelItem4> {
	late String title;
	late String url;
	late bool hideAppBar;
}

class HomePageGridNavFlight with JsonConvert<HomePageGridNavFlight> {
	late String startColor;
	late String endColor;
	late HomePageGridNavFlightMainItem mainItem;
	late HomePageGridNavFlightItem1 item1;
	late HomePageGridNavFlightItem2 item2;
	late HomePageGridNavFlightItem3 item3;
	late HomePageGridNavFlightItem4 item4;
}

class HomePageGridNavFlightMainItem with JsonConvert<HomePageGridNavFlightMainItem> {
	late String title;
	late String icon;
	late String url;
}

class HomePageGridNavFlightItem1 with JsonConvert<HomePageGridNavFlightItem1> {
	late String title;
	late String url;
	late bool hideAppBar;
}

class HomePageGridNavFlightItem2 with JsonConvert<HomePageGridNavFlightItem2> {
	late String title;
	late String url;
}

class HomePageGridNavFlightItem3 with JsonConvert<HomePageGridNavFlightItem3> {
	late String title;
	late String url;
	late bool hideAppBar;
}

class HomePageGridNavFlightItem4 with JsonConvert<HomePageGridNavFlightItem4> {
	late String title;
	late String url;
	late bool hideAppBar;
}

class HomePageGridNavTravel with JsonConvert<HomePageGridNavTravel> {
	late String startColor;
	late String endColor;
	late HomePageGridNavTravelMainItem mainItem;
	late HomePageGridNavTravelItem1 item1;
	late HomePageGridNavTravelItem2 item2;
	late HomePageGridNavTravelItem3 item3;
	late HomePageGridNavTravelItem4 item4;
}

class HomePageGridNavTravelMainItem with JsonConvert<HomePageGridNavTravelMainItem> {
	late String title;
	late String icon;
	late String url;
	late bool hideAppBar;
	late String statusBarColor;
}

class HomePageGridNavTravelItem1 with JsonConvert<HomePageGridNavTravelItem1> {
	late String title;
	late String url;
	late String statusBarColor;
	late bool hideAppBar;
}

class HomePageGridNavTravelItem2 with JsonConvert<HomePageGridNavTravelItem2> {
	late String title;
	late String url;
	late String statusBarColor;
	late bool hideAppBar;
}

class HomePageGridNavTravelItem3 with JsonConvert<HomePageGridNavTravelItem3> {
	late String title;
	late String url;
	late bool hideAppBar;
}

class HomePageGridNavTravelItem4 with JsonConvert<HomePageGridNavTravelItem4> {
	late String title;
	late String url;
	late bool hideAppBar;
}

class HomePageSubNavList with JsonConvert<HomePageSubNavList> {
	late String icon;
	late String title;
	late String url;
	late bool hideAppBar;
}

class HomePageSalesBox with JsonConvert<HomePageSalesBox> {
	late String icon;
	late String moreUrl;
	late HomePageSalesBoxBigCard1 bigCard1;
	late HomePageSalesBoxBigCard2 bigCard2;
	late HomePageSalesBoxSmallCard1 smallCard1;
	late HomePageSalesBoxSmallCard2 smallCard2;
	late HomePageSalesBoxSmallCard3 smallCard3;
	late HomePageSalesBoxSmallCard4 smallCard4;
}

class HomePageSalesBoxBigCard1 with JsonConvert<HomePageSalesBoxBigCard1> {
	late String icon;
	late String url;
	late String title;
}

class HomePageSalesBoxBigCard2 with JsonConvert<HomePageSalesBoxBigCard2> {
	late String icon;
	late String url;
	late String title;
}

class HomePageSalesBoxSmallCard1 with JsonConvert<HomePageSalesBoxSmallCard1> {
	late String icon;
	late String url;
	late String title;
}

class HomePageSalesBoxSmallCard2 with JsonConvert<HomePageSalesBoxSmallCard2> {
	late String icon;
	late String url;
	late String title;
}

class HomePageSalesBoxSmallCard3 with JsonConvert<HomePageSalesBoxSmallCard3> {
	late String icon;
	late String url;
	late String title;
}

class HomePageSalesBoxSmallCard4 with JsonConvert<HomePageSalesBoxSmallCard4> {
	late String icon;
	late String url;
	late String title;
}
