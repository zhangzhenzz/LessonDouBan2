//
//  Request_Urls.h
//  1111
//
//  Created by 袁涛的大爷 on 16/6/27.
//  Copyright © 2016年 zhangzhen. All rights reserved.
//

#ifndef Request_Urls_h
#define Request_Urls_h

#define ActivityRequest_Url @"http://api.douban.com/v2/event/list?type=all&district=all&loc=108288&photo_cate=image&photo_count=5&start=0&day_type=future&apikey=062bcf31694a52d212836d943bdef876"

#define TheaterRequest_Url @"http://115.28.227.1/teacher/yihuiyun/lanouproject/cinemalist.php"
//#define TheaterRequest_Url @"https://api.douban.com/v2/event/21185304/photos?count=5&apikey=062bcf31694a52d212836d943bdef876"
//

#define MovieRequest_Url @"http://api.douban.com/v2/movie/nowplaying?app_name=doubanmovie&client=e:iPhone4,1%7Cy:iPhoneOS_6.1%7Cs:mobile%7Cf:doubanmovie_2%7Cv:3.3.1%7Cm:PP_market%7Cudid:aa1b815b8a4d1e961347304e74b9f9593d95e1c5&alt=json&city=%E5%8C%97%E4%BA%ACversion=2&start=0&apikey=0df993c66c0c636e29ecbb5344252a4a"

//活动详情接口文档

//#define ActivityDetailRequest_Url(ID)  [NSString stringWithFormat:@"https://api.douban.com/v2/event/%@/photos?count=5&apikey=062bcf31694a52d212836d943bdef876", ID];

#define UMengKey @"57746e2367e58eec37000219"

//登录接口
#define LoginRequest_Url @"http://162.211.125.85/douban/user.php/DLogin"
// 注册接口
#define RegisterRequest_Url @"http://162.211.125.85/douban/user.php/DRegister"



//有参数宏定义
#define ActivityDetailRequest_Url(ID) [NSString stringWithFormat:@"http://api.douban.com/v2/event/%@/photos?count=5&apikey=062bcf31694a52d212836d943bdef876",ID]

#define MovieDetailRequest_Url(ID) [NSString stringWithFormat:@"https://api.douban.com/v2/movie/subject/%@?apikey=0df993c66c0c636e29ecbb5344252a4a&client=e:iPhone4,1%%7Cy:iPhoneOS_6.1%%7Cs:mobile%%7Cf:doubanmovie_2%%7Cv:3.3.1%%7Cm:PP_market%%7Cudid:aa1b815b8a4d1e961347304e74b9f9593d95e1c5&alt=json&city=%%E5%%8C%%97%%E4%%BA%%AC&version=2&app_name=doubanmovie",ID]
//第一种 %%就输出% 所以把所有%改成%%
//https://api.douban.com/v2/movie/subject/%@?apikey=0df993c66c0c636e29ecbb5344252a4a&client=e:iPhone4,1%7Cy:iPhoneOS_6.1%7Cs:mobile%7Cf:doubanmovie_2%7Cv:3.3.1%7Cm:PP_market%7Cudid:aa1b815b8a4d1e961347304e74b9f9593d95e1c5&alt=json&city=%E5%8C%97%E4%BA%AC&version=2&app_name=doubanmovie

#endif /* Request_Urls_h */
