//
//  ViewController.m
//  Shashki
//
//  Created by Kulyash Orazbekova on 26.03.14.
//  Copyright (c) 2014 Kulyash. All rights reserved.
//

#import "ViewController.h"

@interface ViewController (){
    UIView* granica;
    CGPoint dragPoint,beginPoint,eatPoint, point1, point2, point11, point22;
    int m[290][410];
    int z;
    int z1;
    int chenger;
    UIView* stroke;
    UIView* stroke2;
    NSString* str;
    NSMutableArray* array;
}
@property(weak,nonatomic) UIView* dragView;
@property(assign, nonatomic) CGPoint deltaPoint;
@end

@implementation ViewController

-(void)viewDidLoad{
    [super viewDidLoad];
    array = [NSMutableArray new];
    str=@"";
    chenger=1;
    stroke = [[UIView alloc]init];
    [stroke setFrame:CGRectMake(40, 80, 240,70)];
    [self.view addSubview:stroke];
    stroke2 = [[UIView alloc]init];
    [stroke2 setFrame:CGRectMake(40, 430, 240,70)];
    [self.view addSubview:stroke2];
    [self stroke];
    z=40, z1=40;
    
    granica = [[UIView alloc]initWithFrame:CGRectMake(30, 150, 260, 260)];
    granica.BackgroundColor = [UIColor lightGrayColor];
    [self.view addSubview:granica];
    UIView* belyi = [[UIView alloc]initWithFrame:CGRectMake(40, 160, 240, 240)];
    belyi.BackgroundColor = [UIColor whiteColor];
    [self.view addSubview:belyi];
    int a=40,b=160,k=0;
    for(int i=0;i<8;i++){
        for(int j=0;j<8;j++){
            UIView* kletka = [[UIView alloc]initWithFrame:CGRectMake(a,b,30,30)];
            if(k%2==0){ kletka.BackgroundColor = [UIColor grayColor]; [array addObject:kletka];}
            else kletka.BackgroundColor = [UIColor whiteColor];
            [self.view addSubview:kletka];
            a+=30;
            k++;
        }
        k=i+1;
        b+=30;
        a=40;
    }
    for(int i=40;i<280;i++){
        for(int j=160;j<400;j++){
            m[i][j]=3;
        }
    }
    for(int i=40;i<280;i+=30){
        for(int j=160;j<400;j+=30){
            if(j==160 || j==190) m[i][j]=1;
            if(j==340 || j==370) m[i][j]=2;
        }
    }
    a=40, b=160;
    for(int i=0;i<2;i++){
        for(int j=0;j<2;j++){
            for(int k=0;k<8;k++){
                if((j==0 && k%2==0)|| (j==1 && k%2==1)){
                    UIView* wawka = [[UIView alloc]initWithFrame:CGRectMake(a,b,30,30)];
                    if(i==0){ wawka.backgroundColor = [UIColor colorWithPatternImage:([UIImage imageNamed:@"f1.png"])]; wawka.tag=1;}
                    else {wawka.backgroundColor = [UIColor colorWithPatternImage:([UIImage imageNamed:@"q.png"])]; wawka.tag=2;}
                    [self.view addSubview:wawka];
                }
                a+=30;
            }
            a=40, b+=30;
        }
        a=40, b=340;
    }
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    UITouch* touch = [touches anyObject];
    CGPoint point = [touch locationInView:self.view];
    UIView* view = [self.view hitTest:point withEvent:event];
        if(view.tag==chenger){
        self.dragView = view;
        CGPoint touchPoint = [touch locationInView:self.dragView];
        dragPoint = touchPoint;
        self.deltaPoint = CGPointMake(CGRectGetMidX(self.dragView.bounds) - touchPoint.x,CGRectGetMidY(self.dragView.bounds) - touchPoint.y);
        beginPoint=self.dragView.frame.origin;
        
            [UIView animateWithDuration:0.3
                         animations:^{
                             self.dragView.transform = CGAffineTransformMakeScale(1.2, 1.2);
                             self.dragView.alpha = 0.5f;
                         }];
            
            if(self.dragView.tag==1){
                CGPoint p1 = CGPointMake(beginPoint.x+30, beginPoint.y+30);
                CGPoint p2 = CGPointMake(beginPoint.x-30, beginPoint.y+30);
                CGPoint p3 = CGPointMake(beginPoint.x-30, beginPoint.y-30);
                CGPoint p4 = CGPointMake(beginPoint.x+30, beginPoint.y-30);
                NSLog(@"p1.x = %f,p1.y= %f", p1.x, p1.y);
                NSLog(@"p2.x = %f,p2.y= %f", p2.x, p2.y);
                
                
                
                if(m[(int)p1.x][(int)p1.y]==3){
                    for(int i=0;i<array.count;i++){
                    UIView* sell1 = [array objectAtIndex:i];
                        if(sell1.frame.origin.x==p1.x && sell1.frame.origin.y==p1.y){
                            sell1.backgroundColor = [UIColor lightGrayColor];
                            NSLog(@"x= %f, y= %f",sell1.frame.origin.x, sell1.frame.origin.y);
                        }
                    }
                }
                if(m[(int)p2.x][(int)p2.y]==3){
                    for(int i=0;i<array.count;i++){
                        UIView* sell1 = [array objectAtIndex:i];
                        if(sell1.frame.origin.x==p2.x && sell1.frame.origin.y==p2.y){
                            sell1.backgroundColor = [UIColor lightGrayColor];
                            NSLog(@"x= %f, y= %f",sell1.frame.origin.x, sell1.frame.origin.y);

                        }
                    }
                }
                if( (m[(int)p1.x][(int)p1.y]==2 || m[(int)p1.x][(int)p1.y]==5) && m[(int)p1.x+30][(int)p1.y+30]==3){
                    for(int i=0;i<array.count;i++){
                        UIView* sell1 = [array objectAtIndex:i];
                        if(sell1.frame.origin.x==p1.x+30 && sell1.frame.origin.y==p1.y+30){
                            sell1.backgroundColor = [UIColor lightGrayColor];
                            NSLog(@"x= %f, y= %f",sell1.frame.origin.x, sell1.frame.origin.y);

                        }
                    }
                }
                if( (m[(int)p2.x][(int)p2.y]==2 || m[(int)p2.x][(int)p2.y]==5) && m[(int)p2.x-30][(int)p2.y+30]==3){
                    for(int i=0;i<array.count;i++){
                        UIView* sell1 = [array objectAtIndex:i];
                        if(sell1.frame.origin.x==p2.x-30 && sell1.frame.origin.y==p2.y+30){
                            sell1.backgroundColor = [UIColor lightGrayColor];
                            NSLog(@"x= %f, y= %f",sell1.frame.origin.x, sell1.frame.origin.y);

                        }
                    }
                }
                if( (m[(int)p3.x][(int)p3.y]==2 || m[(int)p3.x][(int)p3.y]==5) && m[(int)p3.x-30][(int)p3.y-30]==3){
                    for(int i=0;i<array.count;i++){
                        UIView* sell1 = [array objectAtIndex:i];
                        if(sell1.frame.origin.x==p3.x-30 && sell1.frame.origin.y==p3.y-30){
                            sell1.backgroundColor = [UIColor lightGrayColor];
                            NSLog(@"x= %f, y= %f",sell1.frame.origin.x, sell1.frame.origin.y);
                            
                        }
                    }
                }
                if( (m[(int)p4.x][(int)p4.y]==2 || m[(int)p4.x][(int)p4.y]==5) && m[(int)p4.x+30][(int)p4.y-30]==3){
                    for(int i=0;i<array.count;i++){
                        UIView* sell1 = [array objectAtIndex:i];
                        if(sell1.frame.origin.x==p4.x+30 && sell1.frame.origin.y==p4.y-30){
                            sell1.backgroundColor = [UIColor lightGrayColor];
                            NSLog(@"x= %f, y= %f",sell1.frame.origin.x, sell1.frame.origin.y);
                            
                        }
                    }
                }

                    
            }
            
            if(self.dragView.tag==2){
                CGPoint p1 = CGPointMake(beginPoint.x+30, beginPoint.y-30);
                CGPoint p2 = CGPointMake(beginPoint.x-30, beginPoint.y-30);
                CGPoint p3 = CGPointMake(beginPoint.x-30, beginPoint.y+30);
                CGPoint p4 = CGPointMake(beginPoint.x+30, beginPoint.y+30);

                NSLog(@"p1.x = %f,p1.y= %f", p1.x, p1.y);
                NSLog(@"p2.x = %f,p2.y= %f", p2.x, p2.y);
                
                if(m[(int)p1.x][(int)p1.y]==3){
                    for(int i=0;i<array.count;i++){
                        UIView* sell1 = [array objectAtIndex:i];
                        if(sell1.frame.origin.x==p1.x && sell1.frame.origin.y==p1.y){
                            sell1.backgroundColor = [UIColor lightGrayColor];
                            NSLog(@"x= %f, y= %f",sell1.frame.origin.x, sell1.frame.origin.y);
                        }
                    }
                }
                if(m[(int)p2.x][(int)p2.y]==3){
                    for(int i=0;i<array.count;i++){
                        UIView* sell1 = [array objectAtIndex:i];
                        if(sell1.frame.origin.x==p2.x && sell1.frame.origin.y==p2.y){
                            sell1.backgroundColor = [UIColor lightGrayColor];
                            NSLog(@"x= %f, y= %f",sell1.frame.origin.x, sell1.frame.origin.y);
                            
                        }
                    }
                }
                if( (m[(int)p1.x][(int)p1.y]==1 || m[(int)p1.x][(int)p1.y]==4) && m[(int)p1.x+30][(int)p1.y-30]==3){
                    for(int i=0;i<array.count;i++){
                        UIView* sell1 = [array objectAtIndex:i];
                        if(sell1.frame.origin.x==p1.x+30 && sell1.frame.origin.y==p1.y-30){
                            sell1.backgroundColor = [UIColor lightGrayColor];
                            NSLog(@"x= %f, y= %f",sell1.frame.origin.x, sell1.frame.origin.y);
                            
                        }
                    }
                }
                if( (m[(int)p2.x][(int)p2.y]==1 || m[(int)p2.x][(int)p2.y]==4) && m[(int)p2.x-30][(int)p2.y-30]==3){
                    for(int i=0;i<array.count;i++){
                        UIView* sell1 = [array objectAtIndex:i];
                        if(sell1.frame.origin.x==p2.x-30 && sell1.frame.origin.y==p2.y-30){
                            sell1.backgroundColor = [UIColor lightGrayColor];
                            NSLog(@"x= %f, y= %f",sell1.frame.origin.x, sell1.frame.origin.y);
                            
                        }
                    }
                }
                
                if( (m[(int)p3.x][(int)p3.y]==1 || m[(int)p3.x][(int)p3.y]==4) && m[(int)p3.x-30][(int)p3.y-+30]==3){
                    for(int i=0;i<array.count;i++){
                        UIView* sell1 = [array objectAtIndex:i];
                        if(sell1.frame.origin.x==p3.x-30 && sell1.frame.origin.y==p3.y+30){
                            sell1.backgroundColor = [UIColor lightGrayColor];
                            NSLog(@"x= %f, y= %f",sell1.frame.origin.x, sell1.frame.origin.y);
                            
                        }
                    }
                }
                if( (m[(int)p4.x][(int)p4.y]==1 || m[(int)p4.x][(int)p4.y]==4) && m[(int)p4.x+30][(int)p4.y+30]==3){
                    for(int i=0;i<array.count;i++){
                        UIView* sell1 = [array objectAtIndex:i];
                        if(sell1.frame.origin.x==p4.x+30 && sell1.frame.origin.y==p4.y+30){
                            sell1.backgroundColor = [UIColor lightGrayColor];
                            NSLog(@"x= %f, y= %f",sell1.frame.origin.x, sell1.frame.origin.y);
                            
                        }
                    }
                }
                
            }

            
        
        }
       else self.dragView = nil;
    
}

-(void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event{
    UITouch* touch = [touches anyObject];
    CGPoint point = [touch locationInView:self.view];
    dragPoint = CGPointMake(point.x + self.deltaPoint.x, point.y + self.deltaPoint.y);
    self.dragView.center = dragPoint;
}

-(void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event{
    UITouch* touch = [touches anyObject];
    CGPoint point = [touch locationInView:self.view];
    [self endOfTouch:touch withEvent:event withPoint:point];
}

-(void)touchesCancelled:(NSSet *)touches withEvent:(UIEvent *)event{
    UITouch* touch = [touches anyObject];
    CGPoint point = [touch locationInView:self.view];
    [self endOfTouch:touch withEvent:event withPoint:point];
    
}

-(void)endOfTouch:(UITouch*)touch withEvent:(UIEvent*)event withPoint:(CGPoint)point{
    int k=0;
    CGPoint myPoint;
    [self touchesFinished];
    
    if (self.dragView.tag==1){
        for(int i=0;i<array.count;i++){
            UIView* sell1 = [array objectAtIndex:i];
            if(sell1.backgroundColor!=[UIColor grayColor]){
                sell1.backgroundColor = [UIColor grayColor];
            }
        }
        
        NSLog(@"CHERNYE: beginX:%f beginY:%f dragpointX:%f dragPointY:%f",beginPoint.x,beginPoint.y,point.x,point.y);
        
        if(m[(int)beginPoint.x][(int)beginPoint.y]==4){
            CGPoint p;
            p.x=((int)(point.x-40)/30)*30+40;
            p.y=((int)(point.y-40)/30)*30+40;
            NSLog(@"p.x=%f , p.y=%f ",p.x, p.y);
            int kk=0;
            
            if(beginPoint.x-p.x==beginPoint.y-p.y && m[(int)p.x][(int)p.y]==3 && p.x>=40 && p.x<280 && p.y>=160 && p.y<400){
                
                if([self canEat:beginPoint] && (
                                                ([str isEqualToString:@"vverh nalevo"] && ((beginPoint.x<p.x && beginPoint.y<p.y) || (p.x>=eatPoint.x && p.y>=eatPoint.y)) ) ||
                                                ([str isEqualToString:@"vniz napravo"] && ((beginPoint.x>p.x && beginPoint.y>p.y) || (p.x<=eatPoint.x && p.y<=eatPoint.y) ) )||
                                                ([str isEqualToString:@"vverh napravo"] && ( ((beginPoint.x>p.x) && (beginPoint.y>p.y)) || ((beginPoint.x<p.x) && (beginPoint.y<p.y)))) ||
                                                ([str isEqualToString:@"vniz nalevo"] && (((beginPoint.x<p.x) && (beginPoint.y<p.y)) || ((beginPoint.x>p.x) && (beginPoint.y>p.y) ))) )){
                                                    
                    [self.dragView setFrame:CGRectMake(beginPoint.x, beginPoint.y, 30, 30)];NSLog(@"eatPoint = x = %f, y = %f", eatPoint.x, eatPoint.y);
                }
                else {
                    int k=0;
                    for(int i=40;i<280;i+=30){
                        for(int j=160;j<400;j+=30){
                            if(m[i][j]==1){
                                myPoint.x = i;
                                myPoint.y = j;
                            }
                            if([self canEat:myPoint]){ k=1;i=1000; j=1000;}
                        }
                    }
                    
                    if(k==0){
                        NSLog(@"hodit DB vverh nalevo ili vniz napravo");
                        if(beginPoint.x>p.x){
                            for(int i=beginPoint.x-30;i>p.x;i-=30){
                                for(int j=beginPoint.y-30;j>p.y;j-=30){
                                    if((m[i][j]==2 || m[i][j]==5) && beginPoint.x-i==beginPoint.y-j){
                                        UIView* eatView = [self.view hitTest:CGPointMake(i, j) withEvent:nil];
                                        [self kickCheckers:eatView:1];
                                        m[i][j]=3;
                                        z+=30;
                                        kk=1;
                                    }
                                }
                            }
                        }else{
                            for(int i=beginPoint.x+30;i<p.x;i+=30){
                                for(int j=beginPoint.y+30;j<p.y;j+=30){
                                    if((m[i][j]==2 || m[i][j]==5) && beginPoint.x-i==beginPoint.y-j){
                                        UIView* eatView = [self.view hitTest:CGPointMake(i, j) withEvent:nil];
                                        [self kickCheckers:eatView:1];
                                        m[i][j]=3;
                                        z+=30;
                                        kk=1;
                                    }
                                }
                            }
                        }
                        
                        [self.dragView setFrame:CGRectMake(p.x, p.y, 30, 30)];
                        m[(int)p.x][(int)p.y]=4;
                        m[(int)beginPoint.x][(int)beginPoint.y]=3;
                        if(kk==1){
                            if([self canEat:p]) chenger=1;
                            else chenger=2;}
                        else chenger=2;
                    } else [self.dragView setFrame:CGRectMake(beginPoint.x, beginPoint.y, 30, 30)];
                }
            }
                
                
            
            else if(-(beginPoint.x-p.x)==beginPoint.y-p.y && m[(int)p.x][(int)p.y]==3 && p.x>=40 && p.x<280 && p.y>=160 && p.y<400){
                
                if([self canEat:beginPoint] && (
                                                ([str isEqualToString:@"vverh nalevo"] && ((beginPoint.x<p.x && beginPoint.y>p.y) || (beginPoint.x>p.x && beginPoint.y<p.y))) ||
                                                ([str isEqualToString:@"vniz napravo"] && ((beginPoint.x<p.x && beginPoint.y>p.y) || (beginPoint.x>p.x && beginPoint.y<p.y))) ||
                                                ([str isEqualToString:@"vverh napravo"] && ((beginPoint.x>p.x && beginPoint.y<p.y) || (p.x<=eatPoint.x && p.y>=eatPoint.y )) ) ||
                                                ([str isEqualToString:@"vniz nalevo"] && ((beginPoint.x<p.x && beginPoint.y>p.y) || (p.x>=eatPoint.x && p.y<=eatPoint.y)))  ))
                [self.dragView setFrame:CGRectMake(beginPoint.x, beginPoint.y, 30, 30)];
                else {
                    int k=0;
                    for(int i=40;i<280;i+=30){
                        for(int j=160;j<400;j+=30){
                            if(m[i][j]==1){
                                myPoint.x = i;
                                myPoint.y = j;
                            }
                            if([self canEat:myPoint]){ k=1;i=1000; j=1000;}
                        }
                    }
                    
                    if(k==0){
                        NSLog(@"hodit DB vverh napravo ili vniz nalevo");
                        if(beginPoint.x<p.x){
                            for(int i=beginPoint.x+30;i<p.x;i+=30){
                                for(int j=beginPoint.y-30;j>p.y;j-=30){
                                    if((m[i][j]==2 || m[i][j]==5) && -(beginPoint.x-i)==beginPoint.y-j){
                                        UIView* eatView = [self.view hitTest:CGPointMake(i, j) withEvent:nil];
                                        [self kickCheckers:eatView:1];
                                        m[i][j]=3;
                                        z+=30;
                                        kk=1;
                                    }
                                }
                            }
                        } else{
                            for(int i=beginPoint.x-30;i>p.x;i-=30){
                                for(int j=beginPoint.y+30;j<p.y;j+=30){
                                    if((m[i][j]==2 || m[i][j]==5) && -(beginPoint.x-i)==beginPoint.y-j){
                                        UIView* eatView = [self.view hitTest:CGPointMake(i, j) withEvent:nil];
                                        [self kickCheckers:eatView:1];
                                        m[i][j]=3;
                                        z+=30;
                                        kk=1;
                                    }
                                }
                            }
                        }
                        [self.dragView setFrame:CGRectMake(p.x, p.y, 30, 30)];
                        m[(int)p.x][(int)p.y]=4;
                        m[(int)beginPoint.x][(int)beginPoint.y]=3;
                        if(kk==1){
                            if([self canEat:p]) chenger=1;
                            else chenger=2;}
                        else chenger=2;
                    } else [self.dragView setFrame:CGRectMake(beginPoint.x, beginPoint.y, 30, 30)];
                }
            }
            
            else{
                [self.dragView setFrame:CGRectMake(beginPoint.x, beginPoint.y, 30, 30)];
            }
            
        }

        else if( m[(int)beginPoint.x][(int)beginPoint.y]!=4 && point.x<=beginPoint.x+60 && point.x>=beginPoint.x+30 && point.y<=beginPoint.y+60 && point.y>beginPoint.y+30 && point.x<=280 && point.y<=400 && m[(int)beginPoint.x+30][(int)beginPoint.y+30]==3){
            for(int i=40;i<280;i+=30){
                for(int j=160;j<400;j+=30){
                    if(m[i][j]==1 || m[i][j]==4){
                        myPoint.x = i;
                        myPoint.y = j;
                    }
                    if([self canEat:myPoint]){ k=1;i=1000; j=1000;}
                }
            }
            NSLog(@"K = %d",k);
            if(k==0){
                if (point.y>=370 && point.y<400 && m[(int)point.x][(int)point.y]==3){
                    [self.dragView setBackgroundColor:[UIColor colorWithPatternImage:[UIImage imageNamed:@"damkaB.png"]]];
                    m[(int)beginPoint.x+30][(int)beginPoint.y+30]=4;
                }else m[(int)beginPoint.x+30][(int)beginPoint.y+30]=1;
                
                    [self.dragView setFrame:CGRectMake(beginPoint.x+30, beginPoint.y+30, 30, 30)];
                    m[(int)beginPoint.x][(int)beginPoint.y]=3;
                    chenger=2;
                

            }
            else [self.dragView setFrame:CGRectMake(beginPoint.x, beginPoint.y, 30, 30)];
            
        }
        else if(m[(int)beginPoint.x][(int)beginPoint.y]!=4 && point.x>=beginPoint.x-30 && point.x<=beginPoint.x && point.y<=beginPoint.y+60 && point.y>=beginPoint.y+30 && point.x>=40 && point.y>=160 && m[(int)beginPoint.x-30][(int)beginPoint.y+30]==3){
            for(int i=40;i<280;i+=30){
                for(int j=160;j<400;j+=30){
                    if(m[i][j]==1 || m[i][j]==4){
                        myPoint.x = i;
                        myPoint.y = j;
                    }
                    if([self canEat:myPoint]){ k=1;i=1000; j=1000;}
                }
            }
            if(k==0){
                if (point.y>=370 && point.y<400 && m[(int)point.x][(int)point.y]==3){
                    [self.dragView setBackgroundColor:[UIColor colorWithPatternImage:[UIImage imageNamed:@"damkaB.png"]]];
                    m[(int)beginPoint.x-30][(int)beginPoint.y+30]=4;
                }else m[(int)beginPoint.x-30][(int)beginPoint.y+30]=1;
                    [self.dragView setFrame:CGRectMake(beginPoint.x-30, beginPoint.y+30, 30, 30)];
                    m[(int)beginPoint.x][(int)beginPoint.y]=3;
                    chenger=2;
                }
            else [self.dragView setFrame:CGRectMake(beginPoint.x, beginPoint.y, 30, 30)];
        }
        else if(m[(int)beginPoint.x][(int)beginPoint.y]!=4 && point.x>=beginPoint.x+60 && point.x<=beginPoint.x+90 && point.y>=beginPoint.y+60 && point.y<=beginPoint.y+90 && (m[(int)beginPoint.x+30][(int)beginPoint.y+30]==2 || m[(int)beginPoint.x+30][(int)beginPoint.y+30]==5) && m[(int)beginPoint.x+60][(int)beginPoint.y+60]==3 ){
            if (point.y>=370 && point.y<400 && m[(int)point.x][(int)point.y]==3){
                [self.dragView setBackgroundColor:[UIColor colorWithPatternImage:[UIImage imageNamed:@"damkaB.png"]]];
                m[(int)beginPoint.x+60][(int)beginPoint.y+60]=4;
            } else m[(int)beginPoint.x+60][(int)beginPoint.y+60]=1;
            [self.dragView setFrame:CGRectMake(beginPoint.x+60, beginPoint.y+60, 30, 30)];
            UIView* eatView = [self.view hitTest:CGPointMake(beginPoint.x+30, beginPoint.y+30) withEvent:nil];
            //[eatView setFrame:CGRectMake(z, 40, 30, 30)];
            [self kickCheckers:eatView:1];
            z+=30;
            m[(int)beginPoint.x][(int)beginPoint.y]=3;
            m[(int)beginPoint.x+30][(int)beginPoint.y+30]=3;
            beginPoint.x+=60;
            beginPoint.y+=60;
            if([self canEat:beginPoint]) chenger=1;
            else chenger=2;
        }
        else if(m[(int)beginPoint.x][(int)beginPoint.y]!=4 && point.x>=beginPoint.x-60 && point.x<=beginPoint.x-30 && point.y>=beginPoint.y+60 && point.y<=beginPoint.y+90 &&( m[(int)beginPoint.x-30][(int)beginPoint.y+30]==2 || m[(int)beginPoint.x-30][(int)beginPoint.y+30]==5) && m[(int)beginPoint.x-60][(int)beginPoint.y+60]==3){
            if (point.y>=370 && point.y<400 && m[(int)point.x][(int)point.y]==3){
                [self.dragView setBackgroundColor:[UIColor colorWithPatternImage:[UIImage imageNamed:@"damkaB.png"]]];
                m[(int)beginPoint.x-60][(int)beginPoint.y+60]=4;
            } else m[(int)beginPoint.x-60][(int)beginPoint.y+60]=1;
        
            [self.dragView setFrame:CGRectMake(beginPoint.x-60, beginPoint.y+60, 30, 30)];
            UIView* eatView = [self.view hitTest:CGPointMake(beginPoint.x-30, beginPoint.y+30) withEvent:nil];
            //[eatView setFrame:CGRectMake(z, 40, 30, 30)];
            [self kickCheckers:eatView:1];
            z+=30;
            m[(int)beginPoint.x][(int)beginPoint.y]=3;
            m[(int)beginPoint.x-30][(int)beginPoint.y+30]=3;
            beginPoint.x-=60;
            beginPoint.y+=60;
            if([self canEat:beginPoint]) chenger=1;
            else chenger=2;
        }
        else if(m[(int)beginPoint.x][(int)beginPoint.y]!=4 && point.x>=beginPoint.x+60 && point.x<=beginPoint.x+90 && point.y>=beginPoint.y-60 && point.y<=beginPoint.y-30 && (m[(int)beginPoint.x+30][(int)beginPoint.y-30]==2 || m[(int)beginPoint.x+30][(int)beginPoint.y-30]==5) && m[(int)beginPoint.x+60][(int)beginPoint.y-60]==3){
            if (point.y>=370 && point.y<400 && m[(int)point.x][(int)point.y]==3){
                [self.dragView setBackgroundColor:[UIColor colorWithPatternImage:[UIImage imageNamed:@"damkaB.png"]]];
                m[(int)beginPoint.x+60][(int)beginPoint.y-60]=4;
            } else m[(int)beginPoint.x+60][(int)beginPoint.y-60]=1;
            
            [self.dragView setFrame:CGRectMake(beginPoint.x+60, beginPoint.y-60, 30, 30)];
            UIView* eatView = [self.view hitTest:CGPointMake(beginPoint.x+30, beginPoint.y-30) withEvent:nil];
            //[eatView setFrame:CGRectMake(z, 40, 30, 30)];
            [self kickCheckers:eatView:1];
            z+=30;
            m[(int)beginPoint.x][(int)beginPoint.y]=3;
            m[(int)beginPoint.x+30][(int)beginPoint.y-30]=3;
            beginPoint.x+=60;
            beginPoint.y-=60;
            if([self canEat:beginPoint]) chenger=1;
            else chenger=2;
        }
        else if(m[(int)beginPoint.x][(int)beginPoint.y]!=4 && point.x>=beginPoint.x-60 && point.x<=beginPoint.x-30 && point.y>=beginPoint.y-60 && point.y<=beginPoint.y-30 && (m[(int)beginPoint.x-30][(int)beginPoint.y-30]==2 || m[(int)beginPoint.x-30][(int)beginPoint.y-30]==5) && m[(int)beginPoint.x-60][(int)beginPoint.y-60]==3){
            if (point.y>=370 && point.y<400 && m[(int)point.x][(int)point.y]==3){
                [self.dragView setBackgroundColor:[UIColor colorWithPatternImage:[UIImage imageNamed:@"damkaB.png"]]];
                m[(int)beginPoint.x-60][(int)beginPoint.y-60]=4;
            } else m[(int)beginPoint.x-60][(int)beginPoint.y-60]=1;
            [self.dragView setFrame:CGRectMake(beginPoint.x-60, beginPoint.y-60, 30, 30)];
            UIView* eatView = [self.view hitTest:CGPointMake(beginPoint.x-30, beginPoint.y-30) withEvent:nil];
            //[eatView setFrame:CGRectMake(z, 40, 30, 30)];
            [self kickCheckers:eatView:1];
            z+=30;
            m[(int)beginPoint.x][(int)beginPoint.y]=3;
            m[(int)beginPoint.x-30][(int)beginPoint.y-30]=3;
            beginPoint.x-=60;
            beginPoint.y-=60;
            if([self canEat:beginPoint]) chenger=1;
            else chenger=2;
        }
        else{
            [self.dragView setFrame:CGRectMake(beginPoint.x, beginPoint.y, 30, 30)];
        }
    }
    
    
    
    
    
    
    else if (self.dragView.tag==2){
        NSLog(@"BELYE: beginX:%f beginY:%f dragpointX:%f dragPointY:%f",beginPoint.x,beginPoint.y,point.x,point.y);
        for(int i=0;i<array.count;i++){
            UIView* sell1 = [array objectAtIndex:i];
            if(sell1.backgroundColor!=[UIColor grayColor]){
                sell1.backgroundColor = [UIColor grayColor];
            }
        }
        
        if(m[(int)beginPoint.x][(int)beginPoint.y]==5){
            int kk=0;
            CGPoint p;
            p.x=((int)(point.x-40)/30)*30+40;
            p.y=((int)(point.y-40)/30)*30+40;
            NSLog(@"p.x=%f , p.y=%f ",p.x, p.y);
            if(beginPoint.x-p.x==beginPoint.y-p.y && m[(int)p.x][(int)p.y]==3 && p.x>=40 && p.x<280 && p.y>=160 && p.y<400){
                if([self canEat:beginPoint] && (
                                                ([str isEqualToString:@"vverh nalevo"] && ((beginPoint.x<p.x && beginPoint.y<p.y) || (p.x>=eatPoint.x && p.y>=eatPoint.y)) ) ||
                                                ([str isEqualToString:@"vniz napravo"] && ((beginPoint.x>p.x && beginPoint.y>p.y) || (p.x<=eatPoint.x && p.y<=eatPoint.y) ) )||
                                                ([str isEqualToString:@"vverh napravo"] && ( ((beginPoint.x>p.x) && (beginPoint.y>p.y)) || ((beginPoint.x<p.x) && (beginPoint.y<p.y)))) ||
                                                ([str isEqualToString:@"vniz nalevo"] && (((beginPoint.x<p.x) && (beginPoint.y<p.y)) || ((beginPoint.x>p.x) && (beginPoint.y>p.y) ))) )){
                    [self.dragView setFrame:CGRectMake(beginPoint.x, beginPoint.y, 30, 30)];NSLog(@"eatPoint = x = %f, y = %f", eatPoint.x, eatPoint.y);
                }
                else {
                    int k=0;
                    for(int i=40;i<280;i+=30){
                        for(int j=160;j<400;j+=30){
                            if(m[i][j]==2){
                                myPoint.x = i;
                                myPoint.y = j;
                            }
                            if([self canEat:myPoint]){ k=1;i=1000; j=1000;}
                        }
                    }
                    
                    if(k==0){
                if(beginPoint.x>p.x){
                    for(int i=beginPoint.x-30;i>p.x;i-=30){
                        for(int j=beginPoint.y-30;j>p.y;j-=30){
                            if((m[i][j]==1 || m[i][j]==4) && beginPoint.x-i==beginPoint.y-j){
                                UIView* eatView = [self.view hitTest:CGPointMake(i, j) withEvent:nil];
                                [self kickCheckers:eatView:2];
                                m[i][j]=3;
                                z1+=30;
                                kk=1;
                            }
                        }
                    }
                } else{
                    for(int i=beginPoint.x+30;i<p.x;i+=30){
                        for(int j=beginPoint.y+30;j<p.y;j+=30){
                            if((m[i][j]==1 || m[i][j]==4) && beginPoint.x-i==beginPoint.y-j){
                                UIView* eatView = [self.view hitTest:CGPointMake(i, j) withEvent:nil];
                                [self kickCheckers:eatView:2];
                                m[i][j]=3;
                                z1+=30;
                                kk=1;
                            }
                        }
                    }
                }
                
                [self.dragView setFrame:CGRectMake(p.x, p.y, 30, 30)];
                m[(int)p.x][(int)p.y]=5;
                m[(int)beginPoint.x][(int)beginPoint.y]=3;
                if(kk==1){
                    if([self canEat:p]) chenger=2;
                    else chenger=1;}
                        else chenger=1;} else [self.dragView setFrame:CGRectMake(beginPoint.x, beginPoint.y, 30, 30)];
}
            }
            
            else if(-(beginPoint.x-p.x)==beginPoint.y-p.y && m[(int)p.x][(int)p.y]==3 && p.x>=40 && p.x<280 && p.y>=160 && p.y<400){
                if([self canEat:beginPoint] && (
                                                ([str isEqualToString:@"vverh nalevo"] && ((beginPoint.x<p.x && beginPoint.y>p.y) || (beginPoint.x>p.x && beginPoint.y<p.y))) ||
                                                ([str isEqualToString:@"vniz napravo"] && ((beginPoint.x<p.x && beginPoint.y>p.y) || (beginPoint.x>p.x && beginPoint.y<p.y))) ||
                                                ([str isEqualToString:@"vverh napravo"] && ((beginPoint.x>p.x && beginPoint.y<p.y) || (p.x>=eatPoint.x && p.y<=eatPoint.y )) ) ||
                                                ([str isEqualToString:@"vniz nalevo"] && ((beginPoint.x<p.x && beginPoint.y>p.y) || (p.x>=eatPoint.x && p.y<=eatPoint.y)))  ))
                    [self.dragView setFrame:CGRectMake(beginPoint.x, beginPoint.y, 30, 30)];
                else {
                    NSLog(@"str");
                    int k=0;
                    for(int i=40;i<280;i+=30){
                        for(int j=160;j<400;j+=30){
                            if(m[i][j]==2){
                                myPoint.x = i;
                                myPoint.y = j;
                            }
                            if([self canEat:myPoint]){ k=1;i=1000; j=1000;}
                        }
                    }
                    NSLog(@"k = %d",k);
                    if(k==0){
                        if(beginPoint.x<p.x){
                            for(int i=beginPoint.x+30;i<p.x;i+=30){
                                for(int j=beginPoint.y-30;j>p.y;j-=30){
                                    if((m[i][j]==1 || m[i][j]==4) && -(beginPoint.x-i)==beginPoint.y-j){
                                        UIView* eatView = [self.view hitTest:CGPointMake(i, j) withEvent:nil];
                                        [self kickCheckers:eatView:2];
                                        m[i][j]=3;
                                        z1+=30;
                                        kk=1;
                                    }
                                }
                            }
                        } else{
                            for(int i=beginPoint.x-30;i>p.x;i-=30){
                                for(int j=beginPoint.y+30;j<p.y;j+=30){
                                    if((m[i][j]==1 || m[i][j]==4) && beginPoint.x-i==-(beginPoint.y-j)){
                                        UIView* eatView = [self.view hitTest:CGPointMake(i, j) withEvent:nil];
                                        [self kickCheckers:eatView:2];
                                        m[i][j]=3;
                                        z1+=30;
                                        kk=1;
                                    }
                                }
                            }
                        }
                        [self.dragView setFrame:CGRectMake(p.x, p.y, 30, 30)];
                        m[(int)p.x][(int)p.y]=5;
                        m[(int)beginPoint.x][(int)beginPoint.y]=3;
                        if(kk==1){
                            if([self canEat:beginPoint]) chenger=2;
                            else chenger=1;}
                        else chenger=1;}else [self.dragView setFrame:CGRectMake(beginPoint.x, beginPoint.y, 30, 30)];}
            }
            
            else{
                [self.dragView setFrame:CGRectMake(beginPoint.x, beginPoint.y, 30, 30)];
            }
            
        }

        else if(m[(int)beginPoint.x][(int)beginPoint.y]!=5 && point.x<=beginPoint.x+60 && point.x>=beginPoint.x+30 && point.y>=beginPoint.y-30 && point.y<beginPoint.y && point.x<=280 && point.y<=400 && m[(int)beginPoint.x+30][(int)beginPoint.y-30]==3){
            for(int i=40;i<280;i+=30){
                for(int j=160;j<400;j+=30){
                    if(m[i][j]==2 || m[i][j]==5){
                        myPoint.x = i;
                        myPoint.y = j;
                    }
                    if([self canEat:myPoint]){ k=1;i=1000; j=1000;}
                }
            }
            if(k==0){
                if (point.y>=160 && point.y<190 && m[(int)point.x][(int)point.y]==3){
                    [self.dragView setBackgroundColor:[UIColor colorWithPatternImage:[UIImage imageNamed:@"damkaW.png"]]];
                    m[(int)beginPoint.x+30][(int)beginPoint.y-30]=5;
                }else m[(int)beginPoint.x+30][(int)beginPoint.y-30]=2;
                [self.dragView setFrame:CGRectMake(beginPoint.x+30, beginPoint.y-30, 30, 30)];
                m[(int)beginPoint.x][(int)beginPoint.y]=3;
                chenger=1;}
            else [self.dragView setFrame:CGRectMake(beginPoint.x, beginPoint.y, 30, 30)];
        }
        else if(m[(int)beginPoint.x][(int)beginPoint.y]!=5 && m[(int)beginPoint.x][(int)beginPoint.y]!=5 && point.x>=beginPoint.x-30 && point.x<=beginPoint.x && point.y>=beginPoint.y-30 && point.y<=beginPoint.y && point.x>=40 && point.y>=160 && m[(int)beginPoint.x-30][(int)beginPoint.y-30]==3){
            for(int i=40;i<280;i+=30){
                for(int j=160;j<400;j+=30){
                    if(m[i][j]==2 || m[i][j]==5){
                        myPoint.x = i;
                        myPoint.y = j;
                    }
                    if([self canEat:myPoint]){ k=1;i=1000; j=1000;}
                }}
            if(k==0){
                if (point.y>=160 && point.y<190 && m[(int)point.x][(int)point.y]==3){
                    [self.dragView setBackgroundColor:[UIColor colorWithPatternImage:[UIImage imageNamed:@"damkaW.png"]]];
                    m[(int)beginPoint.x-30][(int)beginPoint.y-30]=5;
                }else m[(int)beginPoint.x-30][(int)beginPoint.y-30]=2;

                [self.dragView setFrame:CGRectMake(beginPoint.x-30, beginPoint.y-30, 30, 30)];
                m[(int)beginPoint.x][(int)beginPoint.y]=3;
                chenger=1;}
            else [self.dragView setFrame:CGRectMake(beginPoint.x, beginPoint.y, 30, 30)];
            
        }
        else if(m[(int)beginPoint.x][(int)beginPoint.y]!=5 && point.x>=beginPoint.x+60 && point.x<=beginPoint.x+90 && point.y>=beginPoint.y-60 && point.y<=beginPoint.y-30 && (m[(int)beginPoint.x+30][(int)beginPoint.y-30]==1 || m[(int)beginPoint.x+30][(int)beginPoint.y-30]==4) && m[(int)beginPoint.x+60][(int)beginPoint.y-60]==3){
            if (point.y>=160 && point.y<190 && m[(int)point.x][(int)point.y]==3){
                [self.dragView setBackgroundColor:[UIColor colorWithPatternImage:[UIImage imageNamed:@"damkaW.png"]]];
                m[(int)beginPoint.x+60][(int)beginPoint.y-60]=5;
            } else m[(int)beginPoint.x+60][(int)beginPoint.y-60]=2;
            
            [self.dragView setFrame:CGRectMake(beginPoint.x+60, beginPoint.y-60, 30, 30)];
            UIView* eatView = [self.view hitTest:CGPointMake(beginPoint.x+30, beginPoint.y-30) withEvent:nil];
            // [eatView setFrame:CGRectMake(z1, 498, 30, 30)];
            [self kickCheckers:eatView:2];
            z1+=30;
            m[(int)beginPoint.x][(int)beginPoint.y]=3;
            m[(int)beginPoint.x+30][(int)beginPoint.y-30]=3;
            beginPoint.x+=60;
            beginPoint.y-=60;
            if([self canEat:beginPoint]) chenger=2;
            else chenger=1;
        }
        else if(m[(int)beginPoint.x][(int)beginPoint.y]!=5 && point.x>=beginPoint.x-60 && point.x<=beginPoint.x-30 && point.y>=beginPoint.y-60 && point.y<=beginPoint.y-30 && (m[(int)beginPoint.x-30][(int)beginPoint.y-30]==1 || m[(int)beginPoint.x-30][(int)beginPoint.y-30]==4) && m[(int)beginPoint.x-60][(int)beginPoint.y-60]==3){
            if (point.y>=160 && point.y<190 && m[(int)point.x][(int)point.y]==3){
                [self.dragView setBackgroundColor:[UIColor colorWithPatternImage:[UIImage imageNamed:@"damkaW.png"]]];
                m[(int)beginPoint.x-60][(int)beginPoint.y-60]=5;
            } else m[(int)beginPoint.x-60][(int)beginPoint.y-60]=2;
            [self.dragView setFrame:CGRectMake(beginPoint.x-60, beginPoint.y-60, 30, 30)];
            UIView* eatView = [self.view hitTest:CGPointMake(beginPoint.x-15, beginPoint.y-15) withEvent:nil];
            //[eatView setFrame:CGRectMake(z1, 498, 30, 30)];
            NSLog(@"eatingPoint: x = %f, y = %f", eatView.frame.origin.x, eatView.frame.origin.y);
            [self kickCheckers:eatView:2];
            z1+=30;
            m[(int)beginPoint.x][(int)beginPoint.y]=3;
            m[(int)beginPoint.x-30][(int)beginPoint.y-30]=3;
            beginPoint.x-=60;
            beginPoint.y-=60;
            if([self canEat:beginPoint]) chenger=2;
            else chenger=1;
        }
        
        else if(m[(int)beginPoint.x][(int)beginPoint.y]!=5 && point.x>=beginPoint.x+60 && point.x<=beginPoint.x+90 && point.y>=beginPoint.y+60 && point.y<=beginPoint.y+90 && (m[(int)beginPoint.x+30][(int)beginPoint.y+30]==1 || m[(int)beginPoint.x+30][(int)beginPoint.y+30]==4) && m[(int)beginPoint.x+60][(int)beginPoint.y+60]==3){
            if (point.y>=160 && point.y<190 && m[(int)point.x][(int)point.y]==3){
                [self.dragView setBackgroundColor:[UIColor colorWithPatternImage:[UIImage imageNamed:@"damkaW.png"]]];
                m[(int)beginPoint.x+60][(int)beginPoint.y+60]=5;
            } else m[(int)beginPoint.x+60][(int)beginPoint.y+60]=2;

            [self.dragView setFrame:CGRectMake(beginPoint.x+60, beginPoint.y+60, 30, 30)];
            UIView* eatView = [self.view hitTest:CGPointMake(beginPoint.x+30, beginPoint.y+30) withEvent:nil];
            //  [eatView setFrame:CGRectMake(z1, 498, 30, 30)];
            
            [self kickCheckers:eatView:2];
            z1+=30;
            m[(int)beginPoint.x][(int)beginPoint.y]=3;
            m[(int)beginPoint.x+30][(int)beginPoint.y+30]=3;
            beginPoint.x+=60;
            beginPoint.y+=60;
            if([self canEat:beginPoint]) chenger=2;
            else chenger=1;
        }
        else if(m[(int)beginPoint.x][(int)beginPoint.y]!=5 && point.x>=beginPoint.x-60 && point.x<=beginPoint.x-30 && point.y>=beginPoint.y+60 && point.y<=beginPoint.y+90 && (m[(int)beginPoint.x-30][(int)beginPoint.y+30]==1 || m[(int)beginPoint.x-30][(int)beginPoint.y+30]==4 ) && m[(int)beginPoint.x-60][(int)beginPoint.y+60]==3){
            if (point.y>=160 && point.y<190 && m[(int)point.x][(int)point.y]==3){
                [self.dragView setBackgroundColor:[UIColor colorWithPatternImage:[UIImage imageNamed:@"damkaW.png"]]];
                m[(int)beginPoint.x-60][(int)beginPoint.y+60]=5;
            } else m[(int)beginPoint.x-60][(int)beginPoint.y+60]=2;

            [self.dragView setFrame:CGRectMake(beginPoint.x-60, beginPoint.y+60, 30, 30)];
            UIView* eatView = [self.view hitTest:CGPointMake(beginPoint.x-30, beginPoint.y+30) withEvent:nil];
            // [eatView setFrame:CGRectMake(z1, 498, 30, 30)];
            
            [self kickCheckers:eatView:2];
            z1+=30;
            m[(int)beginPoint.x][(int)beginPoint.y]=3;
            m[(int)beginPoint.x-30][(int)beginPoint.y+30]=3;
            beginPoint.x-=60;
            beginPoint.y+=60;
            if([self canEat:beginPoint]) chenger=2;
            else chenger=1;
        }
        else{
            [self.dragView setFrame:CGRectMake(beginPoint.x, beginPoint.y, 30, 30)];
        }
    }
    NSLog(@"chenger = %d", chenger);
    [self stroke];
}

-(BOOL)canEat:(CGPoint) point{
    BOOL ok;
    if (self.dragView.tag==1){
//        NSLog(@"m = %d", m[(int)point.x][(int)point.y]);
//        NSLog(@"point on check: x=%f, y=%f", point.x, point.y);
        
        if(m[(int)point.x][(int)point.y]==4){
            
            for(int i=point.x;i>=40;i-=30){
                for(int j=point.y;j>=160;j-=30){
                    if((m[i][j]==2 || m[i][j]==5) && point.x-i==point.y-j){
                        for(int h=i-30;h>=40;h-=30){
                            for(int g=j-30;g>=160;g-=30){
                                if(m[h][g]==3){
                                    ok=YES;NSLog(@"vverh nalevo");str=@"vverh nalevo";
                                    h=0;g=0;eatPoint = CGPointMake(i, j);
                                } else ok=NO;
                            }
                        }
                    }
                }
            }
            
            for(int i=point.x;i>=40;i-=30){
                for(int j=point.y;j<400;j+=30){
                    if((m[i][j]==2 || m[i][j]==5) && point.x-i==-(point.y-j)){
                        for(int h=i-30;h>=40;h-=30){
                            for(int g=j+30;g<400;g+=30){
                                if(m[h][g]==3){
                                    ok=YES;
                                    h=0;g=410;NSLog(@"vniz nalevo");eatPoint = CGPointMake(i, j);str=@"vniz nalevo";
                                }else ok=NO;
                            }
                        }
                    }
                }
            }
            
            for(int i=point.x;i<280;i+=30){
                for(int j=point.y;j>=160;j-=30){
                    if((m[i][j]==2 || m[i][j]==5) && -(point.x-i)==point.y-j){
                        for(int h=i+30;h<280;h+=30){
                            for(int g=j-30;g>=160;g-=30){
                                if(m[h][g]==3){
                                    ok=YES;NSLog(@"vverh napravo");str=@"vverh napravo";
                                    h=290;g=0;eatPoint = CGPointMake(i, j);
                                }else ok=NO;

                            }
                        }
                    }
                }
            }
            
            for(int i=point.x;i<280;i+=30){
                for(int j=point.y;j<400;j+=30){
                    if((m[i][j]==2 || m[i][j]==5) && point.x-i==point.y-j){
                        for(int h=i+30;h<280;h+=30){
                            for(int g=j+30;g<400;g+=30){
                                if(m[h][g]==3){
                                    ok=YES;NSLog(@"vniz napravo");str=@"vniz napravo";
                                    h=290;g=410;eatPoint = CGPointMake(i, j);
                                }else ok=NO;
                            }
                        }
                    }
                }
            }

            
        }
        
        
        else if(m[(int)point.x][(int)point.y]!=4 && (m[(int)point.x+30][(int)point.y+30]==2 || m[(int)point.x+30][(int)point.y+30]==5) && m[(int)point.x+60][(int)point.y+60]==3)
            ok = YES;
        else if(m[(int)point.x][(int)point.y]!=4 && (m[(int)point.x-30][(int)point.y+30]==2 || m[(int)point.x-30][(int)point.y+30]==5) && m[(int)point.x-60][(int)point.y+60]==3)
            ok =  YES;

        else if(m[(int)point.x][(int)point.y]!=4 && (m[(int)point.x+30][(int)point.y-30]==2 || m[(int)point.x+30][(int)point.y-30]==5) && m[(int)point.x+60][(int)point.y-60]==3)
            ok =  YES;

        else if(m[(int)point.x][(int)point.y]!=4 && (m[(int)point.x-30][(int)point.y-30]==2 || m[(int)point.x-30][(int)point.y-30]==5) && m[(int)point.x-60][(int)point.y-60]==3)
            ok =  YES;
        
        else ok =  NO;
    }
    
    else if (self.dragView.tag==2){
//        NSLog(@"m = %d", m[(int)point.x][(int)point.y]);
//        NSLog(@"point on check: x=%f, y=%f", point.x, point.y);
        
        if(m[(int)point.x][(int)point.y]==5){
            
            for(int i=point.x;i>=40;i-=30){
                for(int j=point.y;j>=160;j-=30){
                    if((m[i][j]==1 || m[i][j]==4) && point.x-i==point.y-j){
                        for(int h=i-30;h>=40;h-=30){
                            for(int g=j-30;g>=160;g-=30){
                                if(m[h][g]==3){
                                    ok=YES;NSLog(@"vverh nalevo");str=@"vverh nalevo";
                                    eatPoint = CGPointMake(i, j);
                                    h=0;g=0;
                                } else ok=NO;
                            }
                        }
                    }
                }
            }
            
            for(int i=point.x;i>=40;i-=30){
                for(int j=point.y;j<400;j+=30){
                    if((m[i][j]==1 || m[i][j]==4) && point.x-i==j-point.y){
                        for(int h=i-30;h>=40;h-=30){
                            for(int g=j+30;g<400;g+=30){
                                if(m[h][g]==3){
                                    ok=YES;
                                    h=0;g=410;NSLog(@"vniz nalevo");eatPoint = CGPointMake(i, j);str=@"vniz nalevo";
                                }else ok=NO;
                            }
                        }
                    }
                }
            }
            
            for(int i=point.x;i<280;i+=30){
                for(int j=point.y;j>=160;j-=30){
                    if((m[i][j]==1 || m[i][j]==4) && -(point.x-i)==point.y-j){
                        for(int h=i+30;h<280;h+=30){
                            for(int g=j-30;g>=160;g-=30){
                                if(m[h][g]==3){
                                    ok=YES;NSLog(@"vverh napravo");str=@"vverh napravo";
                                    eatPoint = CGPointMake(i, j);
                                    h=290;g=0;
                                }else ok=NO;
                                
                            }
                        }
                    }
                }
            }
            
            for(int i=point.x;i<280;i+=30){
                for(int j=point.y;j<400;j+=30){
                    if((m[i][j]==1 || m[i][j]==4) && point.x-i==point.y-j){
                        for(int h=i+30;h<280;h+=30){
                            for(int g=j+30;g<400;g+=30){
                                if(m[h][g]==3){
                                    ok=YES;NSLog(@"vniz napravo");
                                    h=290;g=410;str=@"vniz napravo";
                                    eatPoint = CGPointMake(i, j);
                                }else ok=NO;
                            }
                        }
                    }
                }
            }
            
            
        }

        else if(m[(int)point.x][(int)point.y]!=5 && (m[(int)point.x-30][(int)point.y-30]==1 || m[(int)point.x-30][(int)point.y-30]==4) && m[(int)point.x-60][(int)point.y-60]==3)
            ok =  YES;

        else if(m[(int)point.x][(int)point.y]!=5 && (m[(int)point.x+30][(int)point.y+30]==1 || m[(int)point.x+30][(int)point.y+30]==4) && m[(int)point.x+60][(int)point.y+60]==3)
            ok =  YES;

        else if(m[(int)point.x][(int)point.y]!=5 && (m[(int)point.x-30][(int)point.y+30]==1 || m[(int)point.x-30][(int)point.y+30]==4) && m[(int)point.x-60][(int)point.y+60]==3)
            ok =  YES;
        
        else if(m[(int)point.x][(int)point.y]!=5 && (m[(int)point.x+30][(int)point.y-30]==1 || m[(int)point.x+30][(int)point.y-30]==4) && m[(int)point.x+60][(int)point.y-60]==3)
            ok =  YES;

        else
            ok =  NO;
        
    }
    return ok;

}

-(void)kickCheckers:(UIView *) view :(int)delta{
    if(delta==2){
        [UIView animateWithDuration:1
                animations:^{
                [view setFrame:CGRectMake(z1, 498, 30, 30) ];
}];}
    else if(delta==1){
        [UIView animateWithDuration:1
                animations:^{
                [view setFrame:CGRectMake(z, 40, 30, 30)];
}];}
    
}

-(void)touchesFinished {
    [UIView animateWithDuration:0.3
                     animations:^{
                         self.dragView.transform = CGAffineTransformIdentity;
                         self.dragView.alpha = 1.f;
                     }];
}

-(void)stroke {
    
    if(chenger==1){
        [stroke2 setBackgroundColor:[UIColor whiteColor]];
        [stroke setFrame:(CGRectMake(40, 80, 240, 70))];
        [stroke setBackgroundColor:[UIColor colorWithPatternImage:[UIImage imageNamed:@"black.png"]]];
    }
    else{
        [stroke setBackgroundColor:[UIColor whiteColor]];
        [stroke2 setFrame:(CGRectMake(40, 430, 240, 70))];
        [stroke2 setBackgroundColor:[UIColor colorWithPatternImage:[UIImage imageNamed:@"white.png"]]];
    }
    
}

@end
