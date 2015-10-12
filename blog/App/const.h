//
//  const.h
//  Blog
//
//  Created by peter on 15/9/14.
//  Copyright (c) 2015年 lazyathome. All rights reserved.
//

#ifndef Blog_const_h
#define Blog_const_h

#define COLOR_MAIN [UIColor colorWithRed:0/255.0 green:0xb6/255.0 blue:0xd1/255.0 alpha:1.0];

#define HTTP_JASON                     "jason.tunnel.mobi";

#undef MOCKUP

#ifndef MOCKUP
//"http://192.168.1.101:8888/blogserver"#x
#define HTTP_PREFIX(x)                 "http://192.168.1.127:8080/blogserver"#x
#define HTTP_BLOG_PREFIX(x)            "http://192.168.1.127:8080/blogserver"#x

#define URL_REGISTER                    Config.URL_REGISTER
#define URL_LOGIN                       Config.URL_LOGIN
#define URL_LOGOUT                      Config.URL_LOGOUT
#define URL_CURRENT                     Config.URL_CURRENT

#define URL_BLOG_GETBYID                Config.URL_BLOG_GETBYID
#define URL_BLOG_GETALL                 Config.URL_BLOG_GETALL
#define URL_BLOG_POST                   Config.URL_BLOG_POST
#define URL_BLOG_UPDATE                 Config.URL_BLOG_UPDATE
#define URL_BLOG_DELETE                 Config.URL_BLOG_DELETE

#else

#define HTTP_PREFIX(x)                 "https://raw.githubusercontent.com/LazyAtHome/blog_ios/feature/Blog_PostAPI/BlogTests"#x
#define HTTP_BLOG_PREFIX(x)            "https://raw.githubusercontent.com/LazyAtHome/blog_ios/feature/Blog_PostAPI/BlogTests"#x

#define URL_REGISTER                    @HTTP_PREFIX(/reg.json)
#define URL_LOGIN                       @HTTP_PREFIX(/login.json)
#define URL_LOGOUT                      @HTTP_PREFIX(/logout.json)
#define URL_CURRENT                     @HTTP_PREFIX(/current.json)

#define URL_BLOG_GETBYID                @HTTP_BLOG_PREFIX(/postbyid.json)
#define URL_BLOG_GETALL                 @HTTP_BLOG_PREFIX(/postsall.json)
#define URL_BLOG_POST                   @HTTP_BLOG_PREFIX(/post.json)
#define URL_BLOG_UPDATE                 @HTTP_BLOG_PREFIX(/postupdate.json)
#define URL_BLOG_DELETE                 @HTTP_BLOG_PREFIX(/postdelete.json)

#endif

#define TAG_NETQUERY_REGISTER           1

#define TAG_NETQUERY_LOGIN              2

#define TAG_NETQUERY_LOGOUT             3

#define TAG_NETQUERY_CURRENT            4

#define TAG_NETQUERY_BLOG_POST          11

#define TAG_NETQUERY_BLOG_GETBYID       12

#define TAG_NETQUERY_BLOG_GETALL        13

#define TAG_NETQUERY_BLOG_UPDATE        14

#define TAG_NETQUERY_DELETE             15

#define KNotify_PostChanged              @"PostChanged"

#endif
