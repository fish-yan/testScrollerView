//
//  HeaderView.m
//  BTB
//
//  Created by 薛焱 on 16/2/3.
//  Copyright © 2016年 薛焱. All rights reserved.
//


#import "HeaderView.h"

#define kScreenWidth [UIScreen mainScreen].bounds.size.width

@interface HeaderView ()<UIScrollViewDelegate>

@property (nonatomic, strong) NSTimer *timer;


@end

@implementation HeaderView

- (id)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    [self loadNib];
    return self;
}

- (id)initWithCoder:(NSCoder *)aDecoder{
    self = [super initWithCoder:aDecoder];
    [self loadNib];
    return self;
}


- (void)loadNib{
    UIView *view = [[UINib nibWithNibName:@"HeaderView" bundle:nil] instantiateWithOwner:self options:nil].firstObject;
    view.frame = self.bounds;
    [self addSubview:view];
    
    self.headerScrollView.delegate = self;
[self.headerScrollView setContentOffset:CGPointMake(self.bounds.size.width, 0) animated:YES];
    //
    self.headerPageControl.pages = 3;
    self.headerPageControl.tintColor = [UIColor colorWithWhite:1 alpha:0.5];
    self.headerPageControl.currentPageColor = [UIColor whiteColor];
    self.headerPageControl.pageViewSize = CGSizeMake(15, 5);
    [self addTimer];
  
}

- (void)nextImage{
    [self.headerScrollView setContentOffset:CGPointMake(self.headerScrollView.contentOffset.x + self.bounds.size.width, 0) animated:YES];
}

- (void)addTimer{
    self.timer = [NSTimer scheduledTimerWithTimeInterval:5 target:self selector:@selector(nextImage) userInfo:nil repeats:YES];
}
#pragma mark - UIScrollViewDelegate

- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
    if (scrollView.contentOffset.x == 0) {
        [scrollView setContentOffset:CGPointMake(scrollView.contentSize.width - 2*kScreenWidth, 0) animated:NO];
    }else if (scrollView.contentOffset.x == scrollView.contentSize.width-kScreenWidth){
        [scrollView setContentOffset:CGPointMake(kScreenWidth, 0) animated:NO];
    }
    self.headerPageControl.currentPage = scrollView.contentOffset.x / [UIScreen mainScreen].bounds.size.width - 1;
    self.pageController.currentPage = scrollView.contentOffset.x / [UIScreen mainScreen].bounds.size.width - 1;
}

- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView{
    [self.timer invalidate];
}

- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate{
    [self addTimer];
}


@end
