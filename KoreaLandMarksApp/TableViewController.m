//
//  TableViewController.m
//  KoreaLandMarksApp
//
//  Created by Jeff Jeong on 2019. 6. 25..
//  Copyright © 2019년 Tuentuenna. All rights reserved.
//

#import "TableViewController.h"
#import "TableViewCell.h"
#import "DetailViewController.h"

@interface TableViewController ()

@end

@implementation TableViewController

// 뷰가 로드 되었을때
- (void)viewDidLoad {
    [super viewDidLoad];
    
    // 테이블 뷰 각 항목의 높이 설정 
    self.tableView.rowHeight = 130;
    
    // 리소스 경로를 가져온다.
    NSString *path = [[NSBundle mainBundle] pathForResource:@"LandMarks" ofType:@"plist"];
    
    // 리소스의 딕셔너리를 가져온다.
    NSDictionary *dict = [[NSDictionary alloc] initWithContentsOfFile:path];
    
    // 해당 딕셔너리를 뮤터블 배열과 연결시킨다.
    dataSelect = dict[@"Places"];
    
    // setBackBarButtonItem 함수
    // 뒤로가기 버튼을 설정한다.
    [[self navigationItem] setBackBarButtonItem:[[UIBarButtonItem alloc] initWithTitle:@"" style:UIBarButtonItemStylePlain target:nil action:nil]];
    
    
} // (void)viewDidLoad

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {

    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    // 배열의 카운트를 반환한다.
    return dataSelect.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    //
    TableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];
    
    // Configure the cell...
    NSDictionary *dict = dataSelect[indexPath.row];
    
    // 딕셔너리에 있던 속성들에 값을 넣어 화면에 보여준다.
    cell.cellTitle.text = dict[@"Title"];
    cell.cellAddress.text = dict[@"Address"];
    cell.cellImage.image = [UIImage imageNamed:dict[@"Image"]];
    
    return cell;
}


/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/


#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
// 뷰가 네비게이트 될때
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
    
    // 네비게이션 segue 의 identifier 가 showDetail 이면
    if ([[segue identifier] isEqualToString:@"showDetail"]){
        
        // 디테일 뷰 컨트롤러를 가져온다.
        DetailViewController *detailView = [segue destinationViewController];
        
        // 테이블 뷰에서 선택된 인덱스 경로를 가져온다.
        NSIndexPath *myIndexPath = [self.tableView indexPathForSelectedRow];
        
        // 테이블 뷰에서 선택된 인덱스에 해당하는 딕셔너리를 가져온다.
        NSDictionary *dict = dataSelect[myIndexPath.row];
        
        // 디테일뷰에 선언된 배열에 테이블 뷰에서 선택된 요소를 넣는다.
        detailView.detailModel = @[dict[@"Title"]];
        
    }
    
}


@end
