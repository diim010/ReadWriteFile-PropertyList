//
//  ViewController.h
//  ReadWriteFile-PropertyList
//
//  Created by asadulin on 20.03.14.
//  Copyright (c) 2014 asadulinSoftware. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController

@property (strong, nonatomic) IBOutletCollection(UITextField) NSArray *textFields;

- (IBAction)buttonPressed:(id)sender;

//возвращает полный путь к файлу вместе с именем файла
- (NSString *)dataFilePath;
@end
