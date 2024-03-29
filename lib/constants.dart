import 'package:flutter/material.dart';

const String mainContent =
    "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Morbi dignissim ac urna ut bibendum. Donec sapien est, pharetra a semper et, rutrum et magna. Cras ante justo, faucibus quis urna eu, mattis facilisis massa. Sed ornare nisl sit amet tortor accumsan scelerisque. Nam vitae rutrum augue. Mauris ultricies nunc a tempor commodo. Pellentesque a risus placerat, faucibus nibh et, feugiat quam. Cras eu ipsum sapien. Quisque venenatis tortor quis faucibus tincidunt. Nulla aliquet eu ligula vel ullamcorper. Suspendisse bibendum, lectus non pretium tincidunt, enim tellus pellentesque tortor, nec maximus velit odio rhoncus mauris. Morbi pellentesque ante a nisl pulvinar, ac molestie urna commodo.";
const String subContent =
    "Proin varius dictum dui, et tempus justo posuere cursus. Maecenas in mattis arcu. Cras vestibulum facilisis ullamcorper. Cras lobortis sapien id neque vehicula finibus at quis dolor. Nam non mollis urna, ut molestie augue. Pellentesque mi velit, rutrum nec erat eget, posuere vehicula elit. Curabitur accumsan est ut diam ultrices, in iaculis mi consequat. Sed mattis felis augue, ut ultrices dui eleifend vel. Donec placerat massa id nisi tincidunt mattis. Maecenas imperdiet eros quis lacinia laoreet. Donec posuere magna porta dui viverra rhoncus. Duis volutpat commodo ipsum a gravida. Sed bibendum eu nisi eu vestibulum. Cras dignissim bibendum quam. In et enim ac est efficitur hendrerit.";

Map<String, String> hobbies = {
  "https://image.flaticon.com/icons/png/512/2972/2972163.png": "Drawing",
  "https://image.flaticon.com/icons/png/512/2972/2972003.png": "Music",
  "https://image.flaticon.com/icons/png/512/2971/2971986.png": "Sports",
  "https://image.flaticon.com/icons/png/512/2972/2972181.png": "Cooking",
  "https://image.flaticon.com/icons/png/512/2972/2972141.png": "Photography",
  "https://image.flaticon.com/icons/png/512/2972/2972209.png": "Traveling",
  "https://image.flaticon.com/icons/png/512/2972/2972032.png": "Origamy",
  "https://image.flaticon.com/icons/png/512/2972/2972215.png": "Cycling",
  "https://image.flaticon.com/icons/png/512/2971/2971990.png": "Singing",
  "https://image.flaticon.com/icons/png/512/2972/2972107.png": "Swimming",
};

const String profileImageUrl =
    "https://cdn.mirchistatus.com/siteuploads/images/images6/2935/thumb/decent-chasmis-girls-dp-status_xlrg.jpg?time=1555320304";

const List<Tab> newsTabs = [
  Tab(
    text: "All",
  ),
  Tab(
    text: "Latest",
  ),
  Tab(
    text: "Trending",
  ),
  Tab(
    text: "Popular",
  ),
];

List news = [
  {
    "color": Color(0xfff9e84a),
    "text": "The Great \nBritish \nRetail \nRestructuring",
  },
  {
    "color": Color(0xffe8a7b9),
    "text": "Reality has \na starring \nrole at \nMilan",
  },
  {
    "color": Color(0xfff4adac),
    "text": 'Tapping into \nthe future of \nPhysical \nRetail',
  },
  {
    "color": Color(0xffc1c0c6),
    "text": "Most in demand \nfashion trend",
  },
  {
    "color": Color(0xffaeb7b9),
    "text": "In Paris, \nFashion Is \nReady for \nReinvention",
  }
];
