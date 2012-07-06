//
//  CGPDFDocumentCenter.h
//  pdf-decrypt-test
//
//  Created by Vincent Fournié on 04.07.12.
//  Copyright (c) 2012 epyx SA. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CGPDFDocumentProvider.h"

@interface CGPDFDocumentCenter : NSObject

+ (CGPDFDocumentCenter *)sharedCenter;

- (void)registerProvider:(id<CGPDFDocumentProvider>)provider
         forPdfExtension:(NSString *)pdfExtension
          thumbExtension:(NSString *)thumbExtension;

// Will return the default provider if a provider for the provided 'extension' is not found
- (id<CGPDFDocumentProvider>)getProviderForExtension:(NSString *)extension;

@end
