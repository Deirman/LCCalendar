
---
layout: post
title: 自定义日历控件
date: 2018-06-30
tag: iOS
---

在曾经的开发中，忙于开发任务，没有时间对自己的东西整理。在以往的工作中我们肯定定制过一些比较实用的控件。一直以来我都想把自己曾经的项目里面的一些实用的控件分割出来封装成可以直接移植实用的工具。今天我给大家分享一个曾经自己写的一个日历控件。先给大家看一下实现后的效果图。

![](/images/自定义日历控件.jpg)

###  自定义日历控件的实现思路

这个日期控件的详细实现我不在此细说，就给大家讲解一下大概的实现思路和使用方法。这个日历控件的数据源是NSCalendar获取到所选择月份的数据。再把所获取的数据转换成自己所要的数据模型里面。日历的每一个日期其实就是你一按钮。把数据模型转换成UI渲染出来。

###  自定义日历控件的使用
1、初始化

```

_calendarView=[[LCCalendarView alloc]initWithFrame:CGRectMake(0, 50, self.view.frame.size.width, self.view.frame.size.height*1/2)];
_calendarView.delegate=self;
[self.view addSubview:_calendarView];


```

2、刷新日历每天的状态

```
NSDate *date = [NSDate date];//这个是NSDate类型的日期，所要获取的年月日都放在这里；

NSCalendar *cal = [NSCalendar currentCalendar];
unsigned int unitFlags = NSYearCalendarUnit|NSMonthCalendarUnit|
NSDayCalendarUnit;//这句是说你要获取日期的元素有哪些。获取年就要写NSYearCalendarUnit，获取小时就要写NSHourCalendarUnit，中间用|隔开；

NSDateComponents *d = [cal components:unitFlags fromDate:date];//把要从date中获取的unitFlags标示的日期元素存放在NSDateComponents类型的d里面；
//然后就可以从d中获取具体的年月日了；
NSInteger year = [d year];
NSInteger month = [d month];

[_calendarView setNormal:month Day:9];
[_calendarView setAlarm:month Day:10];
[_calendarView setLock:month Day:11];

[_calendarView setNormal:month Day:15];
[_calendarView setAlarm:month Day:14];
[_calendarView setLock:month Day:16];

[_calendarView setNormal:month Day:18];
[_calendarView setAlarm:month Day:19];
[_calendarView setLock:month Day:20];

[_calendarView updateCalendar];

```

###  自定义日历控件源码已经上传至GitHub上,如有需要自行下载。

[自定义日历源码下载](https://github.com/Deirman/LCCalendar.git)


<br>
转载请注明：[Deirman的博客](http://deirman.com) » [自定义日历控件](http://deirman.com/2018/06/自定义日历控件/)  
