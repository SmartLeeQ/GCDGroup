//
//  ViewController.m
//  信号量机制
//
//  Created by lixiaoqiang on 2018/2/5.
//  Copyright © 2018年 lixiaoqiang. All rights reserved.
//
//https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1517831753911&di=af06ae81ad02e0b94314d3d4c0902e21&imgtype=0&src=http%3A%2F%2Fattachments.gfan.com%2Fforum%2Fattachments2%2Fday_110225%2F1102251359e765b56f9a86af4b.jpg
//https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1517831753911&di=caff353706de3c3ff02f8fd3529fa1fc&imgtype=0&src=http%3A%2F%2Fimg2.niutuku.com%2Fdesk%2F1212%2F2222%2F2222-ntk38676.jpg
//https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1517831753910&di=1e9da9a6cdf1452ec9ca3eb10ddea85a&imgtype=0&src=http%3A%2F%2Fimg3.duitang.com%2Fuploads%2Fitem%2F201505%2F10%2F20150510002613_MmRsY.jpeg
#import "ViewController.h"
#import "SDWebImageManager.h"
#import "UIImageView+WebCache.h"'
@interface ViewController ()
@property (nonatomic,strong)UIImageView *imageView;
@property (nonatomic,strong)UIImageView *imageView2;
@property (nonatomic,strong)UIImageView *imageView3;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.imageView = [[UIImageView alloc]init];
    self.imageView2 = [[UIImageView alloc]init];
    self.imageView3 = [[UIImageView alloc]init];
    // Do any additional setup after loading the view, typically from a nib.
    [self dispatchEnterAndLeave];
}
- (void)dispatchEnterAndLeave
{
    dispatch_group_t group = dispatch_group_create();
    dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    __block UIImage *image1;
    __block UIImage *image2;
    __block UIImage *image3;
    dispatch_group_enter(group);
    dispatch_group_async(group, queue, ^{
      //  dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);
        NSURL *url = [NSURL URLWithString:@"https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1517831753911&di=af06ae81ad02e0b94314d3d4c0902e21&imgtype=0&src=http%3A%2F%2Fattachments.gfan.com%2Fforum%2Fattachments2%2Fday_110225%2F1102251359e765b56f9a86af4b.jpg"];
        [self.imageView sd_setImageWithURL:url completed:^(UIImage * _Nullable image, NSError * _Nullable error, SDImageCacheType cacheType, NSURL * _Nullable imageURL) {
            image1 = image;
            NSLog(@"图片1下载完了");
            dispatch_group_leave(group);
           // dispatch_semaphore_signal(semaphore);
        }];
     //   dispatch_semaphore_wait(semaphore, DISPATCH_TIME_FOREVER);
    });
    dispatch_group_enter(group);
    dispatch_group_async(group, queue, ^{
       // dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);
        NSURL *url = [NSURL URLWithString:@"https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1517831753911&di=caff353706de3c3ff02f8fd3529fa1fc&imgtype=0&src=http%3A%2F%2Fimg2.niutuku.com%2Fdesk%2F1212%2F2222%2F2222-ntk38676.jpg"];
        [self.imageView2 sd_setImageWithURL:url completed:^(UIImage * _Nullable image, NSError * _Nullable error, SDImageCacheType cacheType, NSURL * _Nullable imageURL) {
            image2 = image;
            NSLog(@"图片2下载完了");
          //  dispatch_semaphore_signal(semaphore);
            dispatch_group_leave(group);
        }];
       // dispatch_semaphore_wait(semaphore, DISPATCH_TIME_FOREVER);
    });
    dispatch_group_enter(group);
    dispatch_group_async(group, queue, ^{
       // dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);
        NSURL *url = [NSURL URLWithString:@"https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1517831753910&di=1e9da9a6cdf1452ec9ca3eb10ddea85a&imgtype=0&src=http%3A%2F%2Fimg3.duitang.com%2Fuploads%2Fitem%2F201505%2F10%2F20150510002613_MmRsY.jpeg"];
        [self.imageView3 sd_setImageWithURL:url completed:^(UIImage * _Nullable image, NSError * _Nullable error, SDImageCacheType cacheType, NSURL * _Nullable imageURL) {
            image3 = image;
            NSLog(@"图片3下载完了");
           // dispatch_semaphore_signal(semaphore);
            dispatch_group_leave(group);
        }];
      //  dispatch_semaphore_wait(semaphore, DISPATCH_TIME_FOREVER);
    });
    dispatch_group_notify(group, queue, ^{
        NSLog(@"全部下载完毕");
    });
    
}
- (void)testSignal
{
    dispatch_group_t group = dispatch_group_create();
    dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    __block UIImage *image1;
    __block UIImage *image2;
    __block UIImage *image3;
    dispatch_group_async(group, queue, ^{
        dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);
        NSURL *url = [NSURL URLWithString:@"https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1517831753911&di=af06ae81ad02e0b94314d3d4c0902e21&imgtype=0&src=http%3A%2F%2Fattachments.gfan.com%2Fforum%2Fattachments2%2Fday_110225%2F1102251359e765b56f9a86af4b.jpg"];
        [self.imageView sd_setImageWithURL:url completed:^(UIImage * _Nullable image, NSError * _Nullable error, SDImageCacheType cacheType, NSURL * _Nullable imageURL) {
            image1 = image;
            NSLog(@"图片1下载完了");
            dispatch_semaphore_signal(semaphore);
        }];
        dispatch_semaphore_wait(semaphore, DISPATCH_TIME_FOREVER);
    });
    dispatch_group_async(group, queue, ^{
        dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);
        NSURL *url = [NSURL URLWithString:@"https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1517831753911&di=caff353706de3c3ff02f8fd3529fa1fc&imgtype=0&src=http%3A%2F%2Fimg2.niutuku.com%2Fdesk%2F1212%2F2222%2F2222-ntk38676.jpg"];
        [self.imageView2 sd_setImageWithURL:url completed:^(UIImage * _Nullable image, NSError * _Nullable error, SDImageCacheType cacheType, NSURL * _Nullable imageURL) {
            image2 = image;
            NSLog(@"图片2下载完了");
            dispatch_semaphore_signal(semaphore);
        }];
        dispatch_semaphore_wait(semaphore, DISPATCH_TIME_FOREVER);
    });
    dispatch_group_async(group, queue, ^{
        dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);
        NSURL *url = [NSURL URLWithString:@"https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1517831753910&di=1e9da9a6cdf1452ec9ca3eb10ddea85a&imgtype=0&src=http%3A%2F%2Fimg3.duitang.com%2Fuploads%2Fitem%2F201505%2F10%2F20150510002613_MmRsY.jpeg"];
        [self.imageView3 sd_setImageWithURL:url completed:^(UIImage * _Nullable image, NSError * _Nullable error, SDImageCacheType cacheType, NSURL * _Nullable imageURL) {
            image3 = image;
            NSLog(@"图片3下载完了");
            dispatch_semaphore_signal(semaphore);
        }];
        dispatch_semaphore_wait(semaphore, DISPATCH_TIME_FOREVER);
    });
    dispatch_group_notify(group, queue, ^{
        NSLog(@"全部下载完了%@ %@ %@",image1,image2,image3);
        
    });
}
@end
