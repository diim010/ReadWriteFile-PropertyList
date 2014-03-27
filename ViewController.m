//
//  ViewController.m
//  ReadWriteFile-PropertyList
//
//  Created by asadulin on 20.03.14.
//  Copyright (c) 2014 asadulinSoftware. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

//возвращает полный путь к файлу вместе с именем файла
- (NSString *)dataFilePath
{
    NSArray *paths = NSSearchPathForDirectoriesInDomains(
                                NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentsDirectory = [paths objectAtIndex:0];
    return [documentsDirectory stringByAppendingPathComponent:@"MyData.plist"]; 
    
}


- (void)viewDidLoad
{
    [super viewDidLoad];
    
        
    //============= ЧТТЕНИЕ ИЗ ФАЙЛА
    //полный путь к файлу вместе с именем файла
    NSString *filePath = [self dataFilePath];

    //проверяем: существует ли файл по заданному пути
    if ([[NSFileManager defaultManager] fileExistsAtPath:filePath])
    {
        //считываем массив из файла
        NSArray *array = [[NSArray alloc] initWithContentsOfFile:filePath];
         
        
        //перебираем 4 элемента массива (т.к. мы записывали 4 элемента)
        for (int i = 0; i < 4; i++)
        {
            //получаем текст из массива
            UITextField *theField = self.textFields[i];
            NSString* str = array[i];
            theField.text = str;
        }
    }
    
    //========= ПОДПИСКА НА СОБЫТИЕ ПРИ "СВОРАЧИВАНИИ" ПРИЛОЖЕНИЯ
    UIApplication *app = [UIApplication sharedApplication];
    [[NSNotificationCenter defaultCenter]
     addObserver:self
     selector:@selector(applicationWillResignActive:)
     name:UIApplicationWillResignActiveNotification
     object:app];

}

- (void)applicationWillResignActive:(NSNotification *)notification
{
    //======== ЗАПИСЬ МАССИВА СТРОК В ФАЙЛ
    NSString *filePath = [self dataFilePath];
    //создаем массив из NSString, полученный из self.textFields[i].text
    NSArray *array = [self.textFields valueForKey:@"text"];
    [array writeToFile:filePath atomically:YES];
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)buttonPressed:(id)sender
{
    //Заполнить текстовые поля значениями по умолчанию
//    for (int i=0; i<[_textFields count]; i++)
//    {
//        [[_textFields objectAtIndex:i] setText:@"Hello!!"];
//    }
    
    NSLog(@"%@", [self dataFilePath]);
}
@end
