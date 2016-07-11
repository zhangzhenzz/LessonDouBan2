//
//  TheatreMapViewController.m
//  1111
//
//  Created by 袁涛的大爷 on 16/7/1.
//  Copyright © 2016年 zhangzhen. All rights reserved.
//

#import "TheatreMapViewController.h"
#import <BaiduMapAPI_Map/BMKMapView.h>
#import <BaiduMapAPI_Map/BMKMapComponent.h>
#import <BaiduMapAPI_Search/BMKSearchComponent.h>

@interface TheatreMapViewController ()<BMKPoiSearchDelegate,BMKGeoCodeSearchDelegate,BMKMapViewDelegate>
@property(nonatomic,strong)BMKMapView*mapView;
@property(nonatomic,strong)BMKGeoCodeSearch*searcher;
@property(nonatomic,strong)BMKGeoCodeSearchOption *geocodeSearchOption;

@end

@implementation TheatreMapViewController

- (void)viewDidLoad {

    [super viewDidLoad];
    
    
    //个性化地图模板文件路径
    
    NSString* path = [[NSBundle mainBundle] pathForResource:@"custom_config_0323(清新蓝)" ofType:@""];
    
    //设置个性化地图样式
    
    [BMKMapView customMapStyle:path];
    
    self.mapView = [[BMKMapView alloc]initWithFrame:CGRectMake(0, 0, WindownWidth, WindowHeight)];
    self.view =self.mapView;
    // Do any additional setup after loading the view.
    
    //初始化检索对象
    self.searcher =[[BMKGeoCodeSearch alloc]init];
    self.mapView.zoomLevel=15;
    self.searcher.delegate = self;
    BMKGeoCodeSearchOption *geoCodeSearchOption = [[BMKGeoCodeSearchOption alloc]init];
    geoCodeSearchOption.city=self.cityString;
    geoCodeSearchOption.address=self.addressString;
//    geoCodeSearchOption.city= @"北京市";
//    geoCodeSearchOption.address = @"海淀区上地10街10号";
    BOOL flag = [self.searcher geoCode:geoCodeSearchOption];
//    [geoCodeSearchOption release];
    if(flag)
    {
        NSLog(@"geo检索发送成功");
    }
    else
    {
        NSLog(@"geo检索发送失败");
    }
}

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [self.mapView viewWillAppear];
    self.mapView.delegate=self;
}

-(void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    [self.mapView viewWillDisappear];
    //退出时代理清理为空
    self.mapView.delegate=nil;
}

- (void) viewDidAppear:(BOOL)animated {
    // 添加一个PointAnnotation
//    BMKPointAnnotation* annotation = [[BMKPointAnnotation alloc]init];
//    CLLocationCoordinate2D coor;
//    coor.latitude = 39.915;
//    coor.longitude = 116.404;
//    annotation.coordinate = coor;
//    annotation.title = @"这里是北京";
//    [_mapView addAnnotation:annotation];
}

// Override
- (BMKAnnotationView *)mapView:(BMKMapView *)mapView viewForAnnotation:(id <BMKAnnotation>)annotation
{
//    if ([annotation isKindOfClass:[BMKPointAnnotation class]]) {
//        BMKPinAnnotationView *newAnnotationView = [[BMKPinAnnotationView alloc] initWithAnnotation:annotation reuseIdentifier:@"myAnnotation"];
//        newAnnotationView.pinColor = BMKPinAnnotationColorPurple;
//        newAnnotationView.animatesDrop = YES;// 设置该标注点动画显示
//        return newAnnotationView;
//    }
    NSLog(@"!");
    NSString*annotationViewID=@"annotationID";
    BMKAnnotationView*annotationView=[mapView dequeueReusableAnnotationViewWithIdentifier:annotationViewID];
    //复用机制 省内存
    if (annotationView==nil) {
        annotationView=[[BMKPinAnnotationView alloc] initWithAnnotation:annotation reuseIdentifier:annotationViewID];
        ((BMKPinAnnotationView *)annotationView).pinColor = BMKPinAnnotationColorRed;
    }
    annotationView.annotation=annotation;
    return annotationView;
}

//编码的代理方法
- (void)onGetGeoCodeResult:(BMKGeoCodeSearch *)searcher result:(BMKGeoCodeResult *)result errorCode:(BMKSearchErrorCode)error{
    
    NSLog(@"result = %@",result);
//    if(error == BMK_SEARCH_NO_ERROR){
//        //在此处理正常结果
//        
//    }
    BMKPointAnnotation*pointAnnotation=[[BMKPointAnnotation alloc] init];
    pointAnnotation.coordinate=result.location;
    pointAnnotation.title=result.address;
    
    
    
    [self.mapView addAnnotation:pointAnnotation];
    self.mapView.centerCoordinate=result.location;
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
