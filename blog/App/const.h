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

#define HTTP_PREFIX(x)                 "http://192.168.1.124:8888/blogserver"#x
#define HTTP_BLOG_PREFIX(x)            "http://192.168.1.124:8888/blogserver-service"#x

#define URL_REGISTER                    @HTTP_PREFIX(/users/reg)
#define URL_LOGIN                       @HTTP_PREFIX(/users/login)
#define URL_LOGOUT                      @HTTP_PREFIX(/users/logout)
#define URL_CURRENT                     @HTTP_PREFIX(/users/current)

#define URL_BLOG_GETBYID                @HTTP_BLOG_PREFIX(/posts)
#define URL_BLOG_GETALL                 @HTTP_BLOG_PREFIX(/posts/all)
#define URL_BLOG_POST                   @HTTP_BLOG_PREFIX(/posts)
#define URL_BLOG_UPDATE                 @HTTP_BLOG_PREFIX(/posts)
#define URL_BLOG_DELETE                 @HTTP_BLOG_PREFIX(/posts)

#define TAG_NETQUERY_REGISTER           1

#define TAG_NETQUERY_LOGIN              2

#define TAG_NETQUERY_LOGOUT             3

#define TAG_NETQUERY_CURRENT            4

#define TAG_NETQUERY_BLOG_POST          11

#define TAG_NETQUERY_BLOG_GETBYID       12

#define TAG_NETQUERY_BLOG_GETALL        13

#define TAG_NETQUERY_UPDATE             14

#define TAG_NETQUERY_DELETE             15

#endif
