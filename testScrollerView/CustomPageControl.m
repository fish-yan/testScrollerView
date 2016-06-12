//
//  CustomPageControl.m
//  BTB
//
//  Created by 薛焱 on 16/2/23.
//  Copyright © 2016年 薛焱. All rights reserved.
//

#import "CustomPageControl.h"

@interface CustomPageControl ()

@property (nonatomic, strong) NSMutableArray *pageViews;

@end

@implementation CustomPageControl

- (void)setPages:(NSInteger)pages{
    _pages = pages;
    [self creatPageView];
}

- (void)setTintColor:(UIColor *)tintColor{
    _tintColor = tintColor;
    [self creatPageView];
}

- (void)setPageViewSize:(CGSize)pageViewSize{
    _pageViewSize = pageViewSize;
    [self creatPageView];
}



- (void)awakeFromNib{
    
    self.backgroundColor = [UIColor clearColor];
    _pages = 2;
    _tintColor = [UIColor lightGrayColor];
    _pageViewSize = CGSizeMake(18, 5);
    [self addObserver:self forKeyPath:@"currentPage" options:(NSKeyValueObservingOptionNew) context:nil];
}

- (void)creatPageView{
    self.pageViews = [NSMutableArray array];
    for (UIView *view in self.subviews) {
        [view removeFromSuperview];
    }
    for (int i = 0; i < self.pages; i++ ) {
        UIView *pageView = [[UIView alloc]initWithFrame:CGRectMake(self.frame.size.width / 2 - (self.pageViewSize.width * self.pages + (self.pages - 1) * 5) / 2 + (self.pageViewSize.width + 5) * i, self.frame.size.height / 2 - self.pageViewSize.height / 2, self.pageViewSize.width, self.pageViewSize.height)];
        pageView.tag = i;
        if (pageView.tag == self.currentPage) {
            pageView.backgroundColor = self.currentPageColor;
        }else{
            pageView.backgroundColor = self.tintColor;
        }
        [self addSubview:pageView];
        [self.pageViews addObject:pageView];
    }
}

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSString *,id> *)change context:(void *)context{
    if ([keyPath isEqualToString:@"currentPage"]) {
        for (UIView *pageView in self.pageViews) {
            if (pageView.tag == [change[@"new"] integerValue]) {
                pageView.backgroundColor = self.currentPageColor;
            }else{
                pageView.backgroundColor = self.tintColor;
            }
        }
    }
}


/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
