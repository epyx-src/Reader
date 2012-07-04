//
//  CGPDFDocumentProvider.h
//  pdf-decrypt-test
//
//  Created by Vincent Fournié on 04.07.12.
//  Copyright (c) 2012 epyx SA. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol CGPDFDocumentProvider

- (NSString *)extension;

- (CGDataProviderRef)newCGDataProviderWithURL:(NSURL *)docUrl;

@end

@interface DefaultCGPDFDocumentProvider : NSObject <CGPDFDocumentProvider>

@end
