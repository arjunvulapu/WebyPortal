//
//  OrdersTableViewCell.m
//  WebyPortal
//
//  Created by Apple on 28/03/19.
//  Copyright © 2019 Apple. All rights reserved.
//

#import "OrdersTableViewCell.h"

@implementation OrdersTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    _bgView.layer.cornerRadius=5;
    _bgView.clipsToBounds=YES;
    
    _order_id.layer.cornerRadius=5;
    _order_id.clipsToBounds=YES;
    
    _ordertime_2_border.layer.cornerRadius=5;
    _ordertime_2_border.clipsToBounds=YES;
    _ordertime_2_border.layer.borderWidth=1;
    _ordertime_2_border.layer.borderColor=[UIColor grayColor].CGColor;
    
    _order_price.layer.cornerRadius=5;
    _order_price.clipsToBounds=YES;
    _order_price.layer.borderWidth=1;
    _order_price.layer.borderColor=[UIColor grayColor].CGColor;
    
    _viewDetailsbtn.layer.cornerRadius=5;
    _viewDetailsbtn.clipsToBounds=YES;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (IBAction)viewDetailsBtnAction:(id)sender {
    if(self.detailsView){
        self.detailsView();
    }
}
@end
