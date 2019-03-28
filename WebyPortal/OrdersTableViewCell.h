//
//  OrdersTableViewCell.h
//  WebyPortal
//
//  Created by Apple on 28/03/19.
//  Copyright © 2019 Apple. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface OrdersTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *order_id;
@property (weak, nonatomic) IBOutlet UILabel *ordertime_1;
@property (weak, nonatomic) IBOutlet UILabel *ordertime_2;
@property (weak, nonatomic) IBOutlet UILabel *ordertime_2_border;

@property (weak, nonatomic) IBOutlet UITextView *order_address;
@property (weak, nonatomic) IBOutlet UITextView *order_products;
@property (weak, nonatomic) IBOutlet UIButton *order_price;
@property (weak, nonatomic) IBOutlet UIButton *viewDetailsbtn;
- (IBAction)viewDetailsBtnAction:(id)sender;
@property(nonatomic) void (^detailsView)();
@property (weak, nonatomic) IBOutlet UIView *bgView;
@end

NS_ASSUME_NONNULL_END
