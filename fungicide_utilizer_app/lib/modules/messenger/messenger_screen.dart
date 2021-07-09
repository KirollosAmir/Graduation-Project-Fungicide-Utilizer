import 'package:flutter/material.dart';

class MessengerScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0,
        titleSpacing: 20.0,
        title: Row(
          children: [
            CircleAvatar(
              radius: 20.0,
              backgroundImage: NetworkImage('https://img.webmd.com/dtmcms/live/webmd/consumer_assets/site_images/article_thumbnails/other/dog_cool_summer_slideshow/1800x1200_dog_cool_summer_other.jpg'),
            ),
            SizedBox(
              width: 15.0,
            ),
            Text(
              'Chats',
              style: TextStyle(
                color: Colors.black ,
              ),
            ),
          ],
        ),
        actions: [
          IconButton(
              icon: CircleAvatar(
                radius: 15.0,
                backgroundColor: Colors.blue,
                child: Icon(
                  Icons.camera_alt,
                  size: 20.0,
                  color: Colors.white,
                ),
              ),
              onPressed: () {}),
          IconButton(
              icon: CircleAvatar(
                radius: 15.0,
                backgroundColor: Colors.blue,
                child: Icon(
                  Icons.edit,
                  size: 20.0,
                  color: Colors.white,
                ),
              ),
              onPressed: (){}),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: EdgeInsets.all(5.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(
                      5.0
                  ),
                  color: Colors.grey[350],
                ),
                child: Row(
                  children: [
                    Icon(
                      Icons.search,
                    ),
                    SizedBox(
                      width: 10.0,
                    ),
                    Text(
                      'Search'
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 10.0,
              ),
              Container(
                height: 100.0,
                child: ListView.separated(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemBuilder:(context , index) => buildItemStory(),
                  separatorBuilder: (context , index) => SizedBox(
                    width: 10.0,
                  ),
                  itemCount: 10,
                ),
              ),
              SizedBox(
                height: 20.0,
              ),
              ListView.separated(
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemBuilder:(BuildContext  context , int index ) => buildChatItem() ,
                separatorBuilder:(BuildContext  context , int index ) => SizedBox(
                  height: 10.0,
                ) ,
                itemCount: 15 ,
              ),




              // SingleChildScrollView(
              //   scrollDirection: Axis.horizontal,
              //   child: Row(
              //     children: [
              //       Container(
              //         width: 60.0,
              //         child: Column(
              //           children: [
              //             Stack(
              //               alignment: Alignment.bottomRight,
              //               children: [
              //                 CircleAvatar(
              //                   radius: 30.0,
              //                   backgroundImage: NetworkImage('https://img.webmd.com/dtmcms/live/webmd/consumer_assets/site_images/article_thumbnails/other/dog_cool_summer_slideshow/1800x1200_dog_cool_summer_other.jpg'),
              //                 ),
              //                 Padding(
              //                   padding: const EdgeInsetsDirectional.only(
              //                     bottom: 3.0,
              //                     end: 3.0
              //                   ),
              //                   child: CircleAvatar(
              //                     radius: 7.0,
              //                     backgroundColor: Colors.red,
              //                   ),
              //                 ),
              //               ],
              //            ),
              //             SizedBox(
              //               height: 6.0,
              //             ),
              //             Text(
              //               'ali barakat story 1',
              //               overflow: TextOverflow.ellipsis,
              //               maxLines: 2,
              //             ),
              //           ],
              //         ),
              //       ),
              //       SizedBox(
              //         width: 10.0,
              //       ),
              //       Container(
              //         width: 60.0,
              //         child: Column(
              //           children: [
              //             Stack(
              //               alignment: Alignment.bottomRight,
              //               children: [
              //                 CircleAvatar(
              //                   radius: 30.0,
              //                   backgroundImage: NetworkImage('https://img.webmd.com/dtmcms/live/webmd/consumer_assets/site_images/article_thumbnails/other/dog_cool_summer_slideshow/1800x1200_dog_cool_summer_other.jpg'),
              //                 ),
              //                 Padding(
              //                   padding: const EdgeInsetsDirectional.only(
              //                       bottom: 3.0,
              //                       end: 3.0
              //                   ),
              //                   child: CircleAvatar(
              //                     radius: 7.0,
              //                     backgroundColor: Colors.red,
              //                   ),
              //                 ),
              //               ],
              //             ),
              //             SizedBox(
              //               height: 6.0,
              //             ),
              //             Text(
              //               'ali barakat story 1',
              //               overflow: TextOverflow.ellipsis,
              //               maxLines: 2,
              //             ),
              //           ],
              //         ),
              //       ),
              //       SizedBox(
              //         width: 10.0,
              //       ),
              //       Container(
              //         width: 60.0,
              //         child: Column(
              //           children: [
              //             Stack(
              //               alignment: Alignment.bottomRight,
              //               children: [
              //                 CircleAvatar(
              //                   radius: 30.0,
              //                   backgroundImage: NetworkImage('https://img.webmd.com/dtmcms/live/webmd/consumer_assets/site_images/article_thumbnails/other/dog_cool_summer_slideshow/1800x1200_dog_cool_summer_other.jpg'),
              //                 ),
              //                 Padding(
              //                   padding: const EdgeInsetsDirectional.only(
              //                       bottom: 3.0,
              //                       end: 3.0
              //                   ),
              //                   child: CircleAvatar(
              //                     radius: 7.0,
              //                     backgroundColor: Colors.red,
              //                   ),
              //                 ),
              //               ],
              //             ),
              //             SizedBox(
              //               height: 6.0,
              //             ),
              //             Text(
              //               'ali barakat story 1',
              //               overflow: TextOverflow.ellipsis,
              //               maxLines: 2,
              //             ),
              //           ],
              //         ),
              //       ),SizedBox(
              //         width: 10.0,
              //       ),
              //       Container(
              //         width: 60.0,
              //         child: Column(
              //           children: [
              //             Stack(
              //               alignment: Alignment.bottomRight,
              //               children: [
              //                 CircleAvatar(
              //                   radius: 30.0,
              //                   backgroundImage: NetworkImage('https://img.webmd.com/dtmcms/live/webmd/consumer_assets/site_images/article_thumbnails/other/dog_cool_summer_slideshow/1800x1200_dog_cool_summer_other.jpg'),
              //                 ),
              //                 Padding(
              //                   padding: const EdgeInsetsDirectional.only(
              //                       bottom: 3.0,
              //                       end: 3.0
              //                   ),
              //                   child: CircleAvatar(
              //                     radius: 7.0,
              //                     backgroundColor: Colors.red,
              //                   ),
              //                 ),
              //               ],
              //             ),
              //             SizedBox(
              //               height: 6.0,
              //             ),
              //             Text(
              //               'ali barakat story 1',
              //               overflow: TextOverflow.ellipsis,
              //               maxLines: 2,
              //             ),
              //           ],
              //         ),
              //       ),SizedBox(
              //         width: 10.0,
              //       ),
              //       Container(
              //         width: 60.0,
              //         child: Column(
              //           children: [
              //             Stack(
              //               alignment: Alignment.bottomRight,
              //               children: [
              //                 CircleAvatar(
              //                   radius: 30.0,
              //                   backgroundImage: NetworkImage('https://img.webmd.com/dtmcms/live/webmd/consumer_assets/site_images/article_thumbnails/other/dog_cool_summer_slideshow/1800x1200_dog_cool_summer_other.jpg'),
              //                 ),
              //                 Padding(
              //                   padding: const EdgeInsetsDirectional.only(
              //                       bottom: 3.0,
              //                       end: 3.0
              //                   ),
              //                   child: CircleAvatar(
              //                     radius: 7.0,
              //                     backgroundColor: Colors.red,
              //                   ),
              //                 ),
              //               ],
              //             ),
              //             SizedBox(
              //               height: 6.0,
              //             ),
              //             Text(
              //               'ali barakat story 1',
              //               overflow: TextOverflow.ellipsis,
              //               maxLines: 2,
              //             ),
              //           ],
              //         ),
              //       ),SizedBox(
              //         width: 10.0,
              //       ),
              //       Container(
              //         width: 60.0,
              //         child: Column(
              //           children: [
              //             Stack(
              //               alignment: Alignment.bottomRight,
              //               children: [
              //                 CircleAvatar(
              //                   radius: 30.0,
              //                   backgroundImage: NetworkImage('https://img.webmd.com/dtmcms/live/webmd/consumer_assets/site_images/article_thumbnails/other/dog_cool_summer_slideshow/1800x1200_dog_cool_summer_other.jpg'),
              //                 ),
              //                 Padding(
              //                   padding: const EdgeInsetsDirectional.only(
              //                       bottom: 3.0,
              //                       end: 3.0
              //                   ),
              //                   child: CircleAvatar(
              //                     radius: 7.0,
              //                     backgroundColor: Colors.red,
              //                   ),
              //                 ),
              //               ],
              //             ),
              //             SizedBox(
              //               height: 6.0,
              //             ),
              //             Text(
              //               'ali barakat story 1',
              //               overflow: TextOverflow.ellipsis,
              //               maxLines: 2,
              //             ),
              //           ],
              //         ),
              //       ),
              //     ],
              //   ),
              // ),

              // Expanded(
              //   child: SingleChildScrollView(
              //     child: Column(
              //       children: [
              //         SizedBox(
              //           height: 25.0,
              //         ),
              //         Row(
              //           children: [
              //             Stack(
              //               alignment: Alignment.bottomRight,
              //               children: [
              //                 CircleAvatar(
              //                   radius: 30.0,
              //                   backgroundImage: NetworkImage('https://img.webmd.com/dtmcms/live/webmd/consumer_assets/site_images/article_thumbnails/other/dog_cool_summer_slideshow/1800x1200_dog_cool_summer_other.jpg'),
              //                 ),
              //                 Padding(
              //                   padding: const EdgeInsetsDirectional.only(
              //                       bottom: 3.0,
              //                       end: 3.0
              //                   ),
              //                   child: CircleAvatar(
              //                     radius: 7.0,
              //                     backgroundColor: Colors.red,
              //                   ),
              //                 ),
              //               ],
              //             ),
              //             SizedBox(
              //               width: 10.0,
              //             ),
              //             Expanded(
              //               child: Column(
              //                 crossAxisAlignment: CrossAxisAlignment.start,
              //                 children: [
              //                   Text(
              //                     'ali barakat',
              //                     maxLines: 1,
              //                     overflow: TextOverflow.ellipsis ,
              //                     style: TextStyle(
              //                       fontSize: 16.0,
              //                       fontWeight: FontWeight.bold,
              //                     ),
              //
              //
              //                   ),
              //                   SizedBox(
              //                     height: 7.0,
              //                   ),
              //                   Row(
              //                     children: [
              //                       Expanded(
              //                           child: Text(
              //                             ' hi my name is ali barakat i want to play game with you , i have a experinse for ' ,
              //                             overflow: TextOverflow.ellipsis,
              //                             maxLines: 2,
              //
              //                           ),
              //                       ),
              //                       Padding(
              //                         padding: const EdgeInsets.symmetric(
              //                             horizontal: 7.0
              //                         ),
              //                         child: Container(
              //                           width: 10.0,
              //                           height: 10.0,
              //                           decoration: BoxDecoration(
              //                             shape:BoxShape.circle ,
              //                             color: Colors.blue ,
              //                           ),
              //                         ),
              //                       ),
              //                       Text(' 02:00 pm'),
              //                     ],
              //                   ),
              //
              //                 ],
              //               ),
              //             ),
              //           ],
              //         ),
              //         SizedBox(
              //           height: 10.0,
              //         ),
              //         Row(
              //           children: [
              //             Stack(
              //               alignment: Alignment.bottomRight,
              //               children: [
              //                 CircleAvatar(
              //                   radius: 30.0,
              //                   backgroundImage: NetworkImage('https://img.webmd.com/dtmcms/live/webmd/consumer_assets/site_images/article_thumbnails/other/dog_cool_summer_slideshow/1800x1200_dog_cool_summer_other.jpg'),
              //                 ),
              //                 Padding(
              //                   padding: const EdgeInsetsDirectional.only(
              //                       bottom: 3.0,
              //                       end: 3.0
              //                   ),
              //                   child: CircleAvatar(
              //                     radius: 7.0,
              //                     backgroundColor: Colors.red,
              //                   ),
              //                 ),
              //               ],
              //             ),
              //             SizedBox(
              //               width: 10.0,
              //             ),
              //             Expanded(
              //               child: Column(
              //                 crossAxisAlignment: CrossAxisAlignment.start,
              //                 children: [
              //                   Text(
              //                     'ali barakat',
              //                     maxLines: 1,
              //                     overflow: TextOverflow.ellipsis ,
              //                     style: TextStyle(
              //                       fontSize: 16.0,
              //                       fontWeight: FontWeight.bold,
              //                     ),
              //
              //
              //                   ),
              //                   SizedBox(
              //                     height: 7.0,
              //                   ),
              //                   Row(
              //                     children: [
              //                       Expanded(
              //                         child: Text(
              //                           ' hi my name is ali barakat i want to play game with you , i have a experinse for ' ,
              //                           overflow: TextOverflow.ellipsis,
              //                           maxLines: 2,
              //
              //                         ),
              //                       ),
              //                       Padding(
              //                         padding: const EdgeInsets.symmetric(
              //                             horizontal: 7.0
              //                         ),
              //                         child: Container(
              //                           width: 10.0,
              //                           height: 10.0,
              //                           decoration: BoxDecoration(
              //                             shape:BoxShape.circle ,
              //                             color: Colors.blue ,
              //                           ),
              //                         ),
              //                       ),
              //                       Text(' 02:00 pm'),
              //                     ],
              //                   ),
              //
              //                 ],
              //               ),
              //             ),
              //           ],
              //         ),
              //         SizedBox(
              //           height: 10.0,
              //         ),
              //         Row(
              //           children: [
              //             Stack(
              //               alignment: Alignment.bottomRight,
              //               children: [
              //                 CircleAvatar(
              //                   radius: 30.0,
              //                   backgroundImage: NetworkImage('https://img.webmd.com/dtmcms/live/webmd/consumer_assets/site_images/article_thumbnails/other/dog_cool_summer_slideshow/1800x1200_dog_cool_summer_other.jpg'),
              //                 ),
              //                 Padding(
              //                   padding: const EdgeInsetsDirectional.only(
              //                       bottom: 3.0,
              //                       end: 3.0
              //                   ),
              //                   child: CircleAvatar(
              //                     radius: 7.0,
              //                     backgroundColor: Colors.red,
              //                   ),
              //                 ),
              //               ],
              //             ),
              //             SizedBox(
              //               width: 10.0,
              //             ),
              //             Expanded(
              //               child: Column(
              //                 crossAxisAlignment: CrossAxisAlignment.start,
              //                 children: [
              //                   Text(
              //                     'ali barakat',
              //                     maxLines: 1,
              //                     overflow: TextOverflow.ellipsis ,
              //                     style: TextStyle(
              //                       fontSize: 16.0,
              //                       fontWeight: FontWeight.bold,
              //                     ),
              //
              //
              //                   ),
              //                   SizedBox(
              //                     height: 7.0,
              //                   ),
              //                   Row(
              //                     children: [
              //                       Expanded(
              //                         child: Text(
              //                           ' hi my name is ali barakat i want to play game with you , i have a experinse for ' ,
              //                           overflow: TextOverflow.ellipsis,
              //                           maxLines: 2,
              //
              //                         ),
              //                       ),
              //                       Padding(
              //                         padding: const EdgeInsets.symmetric(
              //                             horizontal: 7.0
              //                         ),
              //                         child: Container(
              //                           width: 10.0,
              //                           height: 10.0,
              //                           decoration: BoxDecoration(
              //                             shape:BoxShape.circle ,
              //                             color: Colors.blue ,
              //                           ),
              //                         ),
              //                       ),
              //                       Text(' 02:00 pm'),
              //                     ],
              //                   ),
              //
              //                 ],
              //               ),
              //             ),
              //           ],
              //         ),
              //         SizedBox(
              //           height: 10.0,
              //         ),
              //         Row(
              //           children: [
              //             Stack(
              //               alignment: Alignment.bottomRight,
              //               children: [
              //                 CircleAvatar(
              //                   radius: 30.0,
              //                   backgroundImage: NetworkImage('https://img.webmd.com/dtmcms/live/webmd/consumer_assets/site_images/article_thumbnails/other/dog_cool_summer_slideshow/1800x1200_dog_cool_summer_other.jpg'),
              //                 ),
              //                 Padding(
              //                   padding: const EdgeInsetsDirectional.only(
              //                       bottom: 3.0,
              //                       end: 3.0
              //                   ),
              //                   child: CircleAvatar(
              //                     radius: 7.0,
              //                     backgroundColor: Colors.red,
              //                   ),
              //                 ),
              //               ],
              //             ),
              //             SizedBox(
              //               width: 10.0,
              //             ),
              //             Expanded(
              //               child: Column(
              //                 crossAxisAlignment: CrossAxisAlignment.start,
              //                 children: [
              //                   Text(
              //                     'ali barakat',
              //                     maxLines: 1,
              //                     overflow: TextOverflow.ellipsis ,
              //                     style: TextStyle(
              //                       fontSize: 16.0,
              //                       fontWeight: FontWeight.bold,
              //                     ),
              //
              //
              //                   ),
              //                   SizedBox(
              //                     height: 7.0,
              //                   ),
              //                   Row(
              //                     children: [
              //                       Expanded(
              //                         child: Text(
              //                           ' hi my name is ali barakat i want to play game with you , i have a experinse for ' ,
              //                           overflow: TextOverflow.ellipsis,
              //                           maxLines: 2,
              //
              //                         ),
              //                       ),
              //                       Padding(
              //                         padding: const EdgeInsets.symmetric(
              //                             horizontal: 7.0
              //                         ),
              //                         child: Container(
              //                           width: 10.0,
              //                           height: 10.0,
              //                           decoration: BoxDecoration(
              //                             shape:BoxShape.circle ,
              //                             color: Colors.blue ,
              //                           ),
              //                         ),
              //                       ),
              //                       Text(' 02:00 pm'),
              //                     ],
              //                   ),
              //
              //                 ],
              //               ),
              //             ),
              //           ],
              //         ),
              //         SizedBox(
              //           height: 10.0,
              //         ),
              //         Row(
              //           children: [
              //             Stack(
              //               alignment: Alignment.bottomRight,
              //               children: [
              //                 CircleAvatar(
              //                   radius: 30.0,
              //                   backgroundImage: NetworkImage('https://img.webmd.com/dtmcms/live/webmd/consumer_assets/site_images/article_thumbnails/other/dog_cool_summer_slideshow/1800x1200_dog_cool_summer_other.jpg'),
              //                 ),
              //                 Padding(
              //                   padding: const EdgeInsetsDirectional.only(
              //                       bottom: 3.0,
              //                       end: 3.0
              //                   ),
              //                   child: CircleAvatar(
              //                     radius: 7.0,
              //                     backgroundColor: Colors.red,
              //                   ),
              //                 ),
              //               ],
              //             ),
              //             SizedBox(
              //               width: 10.0,
              //             ),
              //             Expanded(
              //               child: Column(
              //                 crossAxisAlignment: CrossAxisAlignment.start,
              //                 children: [
              //                   Text(
              //                     'ali barakat',
              //                     maxLines: 1,
              //                     overflow: TextOverflow.ellipsis ,
              //                     style: TextStyle(
              //                       fontSize: 16.0,
              //                       fontWeight: FontWeight.bold,
              //                     ),
              //
              //
              //                   ),
              //                   SizedBox(
              //                     height: 7.0,
              //                   ),
              //                   Row(
              //                     children: [
              //                       Expanded(
              //                         child: Text(
              //                           ' hi my name is ali barakat i want to play game with you , i have a experinse for ' ,
              //                           overflow: TextOverflow.ellipsis,
              //                           maxLines: 2,
              //
              //                         ),
              //                       ),
              //                       Padding(
              //                         padding: const EdgeInsets.symmetric(
              //                             horizontal: 7.0
              //                         ),
              //                         child: Container(
              //                           width: 10.0,
              //                           height: 10.0,
              //                           decoration: BoxDecoration(
              //                             shape:BoxShape.circle ,
              //                             color: Colors.blue ,
              //                           ),
              //                         ),
              //                       ),
              //                       Text(' 02:00 pm'),
              //                     ],
              //                   ),
              //
              //                 ],
              //               ),
              //             ),
              //           ],
              //         ),
              //         SizedBox(
              //           height: 10.0,
              //         ),
              //         Row(
              //           children: [
              //             Stack(
              //               alignment: Alignment.bottomRight,
              //               children: [
              //                 CircleAvatar(
              //                   radius: 30.0,
              //                   backgroundImage: NetworkImage('https://img.webmd.com/dtmcms/live/webmd/consumer_assets/site_images/article_thumbnails/other/dog_cool_summer_slideshow/1800x1200_dog_cool_summer_other.jpg'),
              //                 ),
              //                 Padding(
              //                   padding: const EdgeInsetsDirectional.only(
              //                       bottom: 3.0,
              //                       end: 3.0
              //                   ),
              //                   child: CircleAvatar(
              //                     radius: 7.0,
              //                     backgroundColor: Colors.red,
              //                   ),
              //                 ),
              //               ],
              //             ),
              //             SizedBox(
              //               width: 10.0,
              //             ),
              //             Expanded(
              //               child: Column(
              //                 crossAxisAlignment: CrossAxisAlignment.start,
              //                 children: [
              //                   Text(
              //                     'ali barakat',
              //                     maxLines: 1,
              //                     overflow: TextOverflow.ellipsis ,
              //                     style: TextStyle(
              //                       fontSize: 16.0,
              //                       fontWeight: FontWeight.bold,
              //                     ),
              //
              //
              //                   ),
              //                   SizedBox(
              //                     height: 7.0,
              //                   ),
              //                   Row(
              //                     children: [
              //                       Expanded(
              //                         child: Text(
              //                           ' hi my name is ali barakat i want to play game with you , i have a experinse for ' ,
              //                           overflow: TextOverflow.ellipsis,
              //                           maxLines: 2,
              //
              //                         ),
              //                       ),
              //                       Padding(
              //                         padding: const EdgeInsets.symmetric(
              //                             horizontal: 7.0
              //                         ),
              //                         child: Container(
              //                           width: 10.0,
              //                           height: 10.0,
              //                           decoration: BoxDecoration(
              //                             shape:BoxShape.circle ,
              //                             color: Colors.blue ,
              //                           ),
              //                         ),
              //                       ),
              //                       Text(' 02:00 pm'),
              //                     ],
              //                   ),
              //
              //                 ],
              //               ),
              //             ),
              //           ],
              //         ),
              //         SizedBox(
              //           height: 10.0,
              //         ),
              //         Row(
              //           children: [
              //             Stack(
              //               alignment: Alignment.bottomRight,
              //               children: [
              //                 CircleAvatar(
              //                   radius: 30.0,
              //                   backgroundImage: NetworkImage('https://img.webmd.com/dtmcms/live/webmd/consumer_assets/site_images/article_thumbnails/other/dog_cool_summer_slideshow/1800x1200_dog_cool_summer_other.jpg'),
              //                 ),
              //                 Padding(
              //                   padding: const EdgeInsetsDirectional.only(
              //                       bottom: 3.0,
              //                       end: 3.0
              //                   ),
              //                   child: CircleAvatar(
              //                     radius: 7.0,
              //                     backgroundColor: Colors.red,
              //                   ),
              //                 ),
              //               ],
              //             ),
              //             SizedBox(
              //               width: 10.0,
              //             ),
              //             Expanded(
              //               child: Column(
              //                 crossAxisAlignment: CrossAxisAlignment.start,
              //                 children: [
              //                   Text(
              //                     'ali barakat',
              //                     maxLines: 1,
              //                     overflow: TextOverflow.ellipsis ,
              //                     style: TextStyle(
              //                       fontSize: 16.0,
              //                       fontWeight: FontWeight.bold,
              //                     ),
              //
              //
              //                   ),
              //                   SizedBox(
              //                     height: 7.0,
              //                   ),
              //                   Row(
              //                     children: [
              //                       Expanded(
              //                         child: Text(
              //                           ' hi my name is ali barakat i want to play game with you , i have a experinse for ' ,
              //                           overflow: TextOverflow.ellipsis,
              //                           maxLines: 2,
              //
              //                         ),
              //                       ),
              //                       Padding(
              //                         padding: const EdgeInsets.symmetric(
              //                             horizontal: 7.0
              //                         ),
              //                         child: Container(
              //                           width: 10.0,
              //                           height: 10.0,
              //                           decoration: BoxDecoration(
              //                             shape:BoxShape.circle ,
              //                             color: Colors.blue ,
              //                           ),
              //                         ),
              //                       ),
              //                       Text(' 02:00 pm'),
              //                     ],
              //                   ),
              //
              //                 ],
              //               ),
              //             ),
              //           ],
              //         ),
              //         SizedBox(
              //           height: 10.0,
              //         ),
              //         Row(
              //           children: [
              //             Stack(
              //               alignment: Alignment.bottomRight,
              //               children: [
              //                 CircleAvatar(
              //                   radius: 30.0,
              //                   backgroundImage: NetworkImage('https://img.webmd.com/dtmcms/live/webmd/consumer_assets/site_images/article_thumbnails/other/dog_cool_summer_slideshow/1800x1200_dog_cool_summer_other.jpg'),
              //                 ),
              //                 Padding(
              //                   padding: const EdgeInsetsDirectional.only(
              //                       bottom: 3.0,
              //                       end: 3.0
              //                   ),
              //                   child: CircleAvatar(
              //                     radius: 7.0,
              //                     backgroundColor: Colors.red,
              //                   ),
              //                 ),
              //               ],
              //             ),
              //             SizedBox(
              //               width: 10.0,
              //             ),
              //             Expanded(
              //               child: Column(
              //                 crossAxisAlignment: CrossAxisAlignment.start,
              //                 children: [
              //                   Text(
              //                     'ali barakat',
              //                     maxLines: 1,
              //                     overflow: TextOverflow.ellipsis ,
              //                     style: TextStyle(
              //                       fontSize: 16.0,
              //                       fontWeight: FontWeight.bold,
              //                     ),
              //
              //
              //                   ),
              //                   SizedBox(
              //                     height: 7.0,
              //                   ),
              //                   Row(
              //                     children: [
              //                       Expanded(
              //                         child: Text(
              //                           ' hi my name is ali barakat i want to play game with you , i have a experinse for ' ,
              //                           overflow: TextOverflow.ellipsis,
              //                           maxLines: 2,
              //
              //                         ),
              //                       ),
              //                       Padding(
              //                         padding: const EdgeInsets.symmetric(
              //                             horizontal: 7.0
              //                         ),
              //                         child: Container(
              //                           width: 10.0,
              //                           height: 10.0,
              //                           decoration: BoxDecoration(
              //                             shape:BoxShape.circle ,
              //                             color: Colors.blue ,
              //                           ),
              //                         ),
              //                       ),
              //                       Text(' 02:00 pm'),
              //                     ],
              //                   ),
              //
              //                 ],
              //               ),
              //             ),
              //           ],
              //         ),
              //       ],
              //     ),
              //   ),
              // ),

            ],
          ),
        ),
      ),

    );
  }

  // list view
  // 1. build item {reusable item } ba3mlo 23adet est5dam
  // 2. build list
  // add item to list

  // arrow function
  Widget buildChatItem () =>  Row(
      children: [
        Stack(
          alignment: Alignment.bottomRight,
          children: [
            CircleAvatar(
              radius: 30.0,
              backgroundImage: NetworkImage('https://img.webmd.com/dtmcms/live/webmd/consumer_assets/site_images/article_thumbnails/other/dog_cool_summer_slideshow/1800x1200_dog_cool_summer_other.jpg'),
            ),
            Padding(
              padding: const EdgeInsetsDirectional.only(
                  bottom: 3.0,
                  end: 3.0
              ),
              child: CircleAvatar(
                radius: 7.0,
                backgroundColor: Colors.red,
              ),
            ),
          ],
        ),
        SizedBox(
          width: 10.0,
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'ali barakat',
                maxLines: 1,
                overflow: TextOverflow.ellipsis ,
                style: TextStyle(
                  fontSize: 16.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: 7.0,
              ),
              Row(
                children: [
                  Expanded(
                    child: Text(
                      ' hi my name is ali barakat i want to play game with you , i have a experinse for ' ,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 2,

                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 7.0
                    ),
                    child: Container(
                      width: 10.0,
                      height: 10.0,
                      decoration: BoxDecoration(
                        shape:BoxShape.circle ,
                        color: Colors.blue ,
                      ),
                    ),
                  ),
                  Text(' 02:00 pm'),
                ],
              ),

            ],
          ),
        ),
      ],
    );

  Widget buildItemStory () => Container(
    width: 60.0,
    child: Column(
      children: [
        Stack(
          alignment: Alignment.bottomRight,
          children: [
            CircleAvatar(
              radius: 30.0,
              backgroundImage: NetworkImage('https://img.webmd.com/dtmcms/live/webmd/consumer_assets/site_images/article_thumbnails/other/dog_cool_summer_slideshow/1800x1200_dog_cool_summer_other.jpg'),
            ),
            Padding(
              padding: const EdgeInsetsDirectional.only(
                  bottom: 3.0,
                  end: 3.0
              ),
              child: CircleAvatar(
                radius: 7.0,
                backgroundColor: Colors.red,
              ),
            ),
          ],
        ),
        SizedBox(
          height: 6.0,
        ),
        Text(
          'ali barakat story 1',
          overflow: TextOverflow.ellipsis,
          maxLines: 2,
        ),
      ],
    ),
  );

}
