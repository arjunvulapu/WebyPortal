
#import "OrdersListViewController.h"
#import "OrdersTableViewCell.h"
#import "OrderDetailViewController.h"
@interface OrdersListViewController ()
{
    NSMutableArray *ordersList;

}
@end

@implementation OrdersListViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
   _emptyLbl.hidden=YES;
    ordersList=[[NSMutableArray alloc] init];
        NSString *urlStr=[NSString stringWithFormat:@"%@/all/0",ORDERS];
           [self makePostCallForPage2:urlStr withParams:@{} withRequestCode:11];
    _centerView.layer.cornerRadius=_centerView.frame.size.height/2;
    _centerView.clipsToBounds=YES;
    _centerView.layer.borderWidth=1;
    _centerView.layer.borderColor=[UIColor grayColor].CGColor;
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;    //count of section
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return ordersList.count;    //count number of row from counting array hear cataGorry is An Array
}



- (UITableViewCell *)tableView:(UITableView *)tableView
         cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *MyIdentifier = @"OrdersTableViewCell";
    
    OrdersTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:MyIdentifier];
    NSDictionary *dic =[ordersList objectAtIndex:indexPath.row];
    NSString *htmlString = [dic valueForKey:@"address"];
    NSMutableAttributedString *attributedString = [[NSMutableAttributedString alloc]
                                                   initWithData: [htmlString dataUsingEncoding:NSUnicodeStringEncoding]
                                                   options: @{ NSDocumentTypeDocumentAttribute: NSHTMLTextDocumentType }
                                                   documentAttributes: nil
                                                   error: nil
                                                   ];
    cell.order_address.attributedText = attributedString;
    NSString *htmlString2 = [dic valueForKey:@"products_view"];
    NSMutableAttributedString *attributedString2 = [[NSMutableAttributedString alloc]
                                                   initWithData: [htmlString2 dataUsingEncoding:NSUnicodeStringEncoding]
                                                   options: @{ NSDocumentTypeDocumentAttribute: NSHTMLTextDocumentType }
                                                   documentAttributes: nil
                                                   error: nil
                                                   ];
    cell.order_products.attributedText = attributedString2;
    cell.order_id.text=[NSString stringWithFormat:@"%@",[dic valueForKey:@"id"]];
    cell.ordertime_1.text=[NSString stringWithFormat:@"%@",[dic valueForKey:@"delivery_time"]];
    cell.ordertime_2.text=[NSString stringWithFormat:@"%@",[dic valueForKey:@"date"]];
    [cell.order_price setTitle:[NSString stringWithFormat:@"%@",[dic valueForKey:@"total_price"]] forState:UIControlStateNormal];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
}
-(void)tableView:(UITableView *)tableView willDisplayCell:(OrdersTableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath{
//    _tableviewheight.constant=_ordersListTable.contentSize.height;
    [self addcellAnimation: cell];
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    return UITableViewAutomaticDimension;
    
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    OrderDetailViewController *vc = [self.storyboard instantiateViewControllerWithIdentifier:@"OrderDetailViewController"];
   // vc.ResultDict =[projectsList objectAtIndex:indexPath.row];
    [self.navigationController  pushViewController:vc animated:YES];
    
}
/*
 #pragma mark - Navigation
 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
 // Get the new view controller using [segue destinationViewController].
 // Pass the selected object to the new view controller.
 }
 */
-(void)parseResult:(id)result withCode:(int)reqeustCode{
    if(reqeustCode==11){
        ordersList=result;
        _ordersListTable.reloadData;
        if(ordersList.count==0){
            _emptyLbl.hidden=NO;
        }else{
            _emptyLbl.hidden=YES;
            
        }
    }
}
- (IBAction)pendingOrdersBtnAction:(id)sender {
    ordersList=[[NSMutableArray alloc] init];
    NSString *urlStr=[NSString stringWithFormat:@"%@/0/0",ORDERS];
    [self makePostCallForPage2:urlStr withParams:@{} withRequestCode:11];
}

- (IBAction)ordersListBtnAction:(id)sender {
    ordersList=[[NSMutableArray alloc] init];
    NSString *urlStr=[NSString stringWithFormat:@"%@/all/0",ORDERS];
    [self makePostCallForPage2:urlStr withParams:@{} withRequestCode:11];
}

//- (void)scrollViewDidScroll:(UIScrollView *)scrollView; {
//
//    CGFloat offset = scrollView.contentOffset.y;
//    NSLog(@"offset %f",offset);
//    if(offset>_topView.frame.size.height-20){
//        if(!_topView.isHidden){
//        _topView.hidden=YES;
//       // _tableviewheight.constant=self.view.frame.size.height-80;
//
//        }
//    }else{
//        if(_topView.isHidden){
//        _topView.hidden=NO;
//            _tableviewheight.constant=_ordersListTable.contentSize.height;
//        }
//    }
//
//}


@end
