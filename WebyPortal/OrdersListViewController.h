//
//  OrdersListViewController.h
//  WebyPortal
//
//  Created by Apple on 28/03/19.
//  Copyright © 2019 Apple. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BaseViewController.h"
NS_ASSUME_NONNULL_BEGIN

@interface OrdersListViewController : BaseViewController<UIScrollViewDelegate>
@property (weak, nonatomic) IBOutlet UITableView *ordersListTable;
@property (weak, nonatomic) IBOutlet UILabel *emptyLbl;
@property (weak, nonatomic) IBOutlet UIView *centerView;
@property (weak, nonatomic) IBOutlet UIButton *pendingOrderBtn;
@property (weak, nonatomic) IBOutlet UIButton *ordersListbtn;
- (IBAction)pendingOrdersBtnAction:(id)sender;
- (IBAction)ordersListBtnAction:(id)sender;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *tableviewheight;
@property (weak, nonatomic) IBOutlet UIView *topView;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *btnsTop;

@end

NS_ASSUME_NONNULL_END
