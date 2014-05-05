//
//  HDRChineseConvertPy.m
//  hdrdemo3
//
//  Created by wei sm on 14-5-6.
//  Copyright (c) 2014年 bf. All rights reserved.
//

#import "HDRChineseConvertPy.h"

@implementation HDRChineseConvertPy

#include <stdlib.h>
#include <stdio.h>
#include <string.h>
#include "glib.h"

gchar getpychar(guchar uword0 , guchar uword1)
{
    gchar pychar;
    
    int i1 = (short)(uword0 - '/0');
    int i2 = (short)(uword1 - '/0');
    
    int tmp = i1 * 256 + i2;
    
    if(tmp >= 45217 && tmp <= 45252) pychar = 'A';
    else if(tmp >= 45253 && tmp <= 45760) pychar = 'B';
    else if(tmp >= 45761 && tmp <= 46317) pychar = 'C';
    else if(tmp >= 46318 && tmp <= 46825) pychar = 'D';
    else if(tmp >= 46826 && tmp <= 47009) pychar = 'E';
    else if(tmp >= 47010 && tmp <= 47296) pychar = 'F';
    else if(tmp >= 47297 && tmp <= 47613) pychar = 'G';
    else if(tmp >= 47614 && tmp <= 48118) pychar = 'H';
    else if(tmp >= 48119 && tmp <= 49061) pychar = 'J';
    else if(tmp >= 49062 && tmp <= 49323) pychar = 'K';
    else if(tmp >= 49324 && tmp <= 49895) pychar = 'L';
    else if(tmp >= 49896 && tmp <= 50370) pychar = 'M';
    else if(tmp >= 50371 && tmp <= 50613) pychar = 'N';
    else if(tmp >= 50614 && tmp <= 50621) pychar = 'O';
    else if(tmp >= 50622 && tmp <= 50905) pychar = 'P';
    else if(tmp >= 50906 && tmp <= 51386) pychar = 'Q';
    else if(tmp >= 51387 && tmp <= 51445) pychar = 'R';
    else if(tmp >= 51446 && tmp <= 52217) pychar = 'S';
    else if(tmp >= 52218 && tmp <= 52697) pychar = 'T';
    else if(tmp >= 52698 && tmp <= 52979) pychar = 'W';
    else if(tmp >= 52980 && tmp <= 53640) pychar = 'X';
    else if(tmp >= 53689 && tmp <= 54480) pychar = 'Y';
    else if(tmp >= 54481 && tmp <= 55289) pychar = 'Z';
    else pychar = ' ';
    
    return pychar;
}

gchar *getpystring(const gchar *in)
{
    gsize inlen , olen , i , j = 0;
    gchar *gword = g_convert(in , strlen(in)
                             , "gb2312" , "utf8" , &inlen , &olen , NULL);
    
    guchar *uword = (guchar*)gword;
    gchar *out = (gchar*)malloc(olen);
    
    memset(out , 0 , olen);
    
    for(i = 0 ; i < olen ; i++){
        if(uword[i] >= 0xa1){
            if(uword[i] != 0xa3){
                out[j++] = getpychar(uword[i] , uword[i + 1]);
                i ++;
            }
        }else{
            out[j++] = (gchar)uword[i];
        }
    }
    
    return out;
    
}

+ (NSString *)chineseCharConvertToPy:(NSString *)chineseChar
{
    NSString *py = getpystring(chineseChar);
    return py;
}

@end
