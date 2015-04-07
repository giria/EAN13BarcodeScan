

#import <AVFoundation/AVFoundation.h>
#import "BarcodeViewController.h"

@interface BarcodeViewController () <AVCaptureMetadataOutputObjectsDelegate>
{
    AVCaptureSession *session;
    AVCaptureDevice *device;
    AVCaptureDeviceInput *input;
    AVCaptureMetadataOutput *output;
    AVCaptureVideoPreviewLayer *prevLayer;
    AVSpeechSynthesizer *sintetitzadorDeVeu; // SINTETIZADOR DE VEU

    UIView *highlightView;
    UILabel *codeLabel;
    UILabel *countryLabel;
    UILabel *alertLabel;
}
@end

@implementation BarcodeViewController


- (NSString * ) getCountry: (int) number
{
    switch (number) {
        case  0 ... 19:	return @" US";   break;
        case  20 ... 29:	return @"Restricted distribution (MO defined)"; break;
        case  30 ... 39:	return @" US"; break;
        case  40 ... 49:	return @"Restricted distribution (MO defined)"; break;
        case  50 ... 59:	return @"Coupons"; break;
        case  60 ... 139:	return @" US"; break;
        case  200 ... 299:	return @"Restricted distribution (MO defined)"; break;
        case  300 ... 379:	return @" France"; break;
        case  380:	return @"Bulgaria" ; break ;
        case  383:	return @"Slovenija" ; break ;
        case  385:	return @"Croatia" ; break ;
        case  387:	return @"BIH (Bosnia-Herzegovina)" ; break ;
        case  389:	return @"Montenegro" ; break ;
        case  400 ... 440:	return @" Germany "; break;
        case  460 ... 469:	return @" Russia"; break;
        case  470:	return @" Kyrgyzstan"; break;
        case  471:	return @" Taiwan"; break;
        case  474:	return @" Estonia"; break;
        case  475:	return @" Latvia"; break;
        case  476:	return @" Azerbaijan"; break;
        case  477:	return @" Lithuania"; break;
        case  478:	return @" Uzbekistan"; break;
        case  479:	return @" Sri Lanka"; break;
        case  480:	return @" Philippines"; break;
        case  481:	return @" Belarus"; break;
        case  482:	return @" Ukraine"; break;
        case  484:	return @" Moldova"; break;
        case  485:	return @" Armenia"; break;
        case  486:	return @" Georgia"; break;
        case  487:	return @" Kazakstan"; break;
        case  488:	return @" Tajikistan"; break;
        case  489:	return @" Hong Kong"; break;
        case  490 ... 499:  return @"Japan"; break;
        case  500 ... 509: return @"United Kingdom"; break;
        case  520 ... 521: return @"Association Greece"; break;
        case  528:	return @" Lebanon"; break;
        case  529:	return @" Cyprus"; break;
        case  530:	return @" Albania"; break;
        case  531:	return @" MAC (FYR Macedonia)"; break;
        case  535:	return @" Malta"; break;
        case  539:	return @" Ireland"; break;
        case  540 ... 549:	return @" Belgium and Luxembourg"; break;
        case  560:	return @" Portugal"; break;
        case  569:	return @" Iceland"; break;
        case  570 ... 579:	return @"Denmark"; break;
        case  590:	return @" Poland"; break;
        case  594:	return @" Romania"; break;
        case  599:	return @" Hungary"; break;
        case  600 ... 601:	return @"South Africa"; break;
        case  603:	return @" Ghana"; break;
        case  604:	return @" Senegal"; break;
        case  608:	return @" Bahrain"; break;
        case  609:	return @" Mauritius"; break;
        case  611:	return @" Morocco"; break;
        case  613:	return @" Algeria"; break;
        case  615:	return @" Nigeria"; break;
        case  616:	return @" Kenya"; break;
        case  618:	return @" Ivory Coast"; break;
        case  619:	return @" Tunisia"; break;
        case  620:	return @" Tanzania"; break;
        case  621:	return @" Syria"; break;
        case  622:	return @" Egypt"; break;
        case  623:	return @" Brunei"; break;
        case  624:	return @" Libya"; break;
        case  625:	return @" Jordan"; break;
        case  626:	return @" Iran"; break;
        case  627:	return @" Kuwait"; break;
        case  628:	return @" Saudi Arabia"; break;
        case  629:	return @" Emirates"; break;
        case  640 ... 649:	return @" Finland"; break;
        case  690 ... 699:	return @" China"; break;
        case  700 ... 709:	return @" Norway"; break;
        case  729:	return @"Israel"; break;
        case  730 ... 739:	return @" Sweden"; break;
        case  740:	return @" Guatemala"; break;
        case  741:	return @" El Salvador"; break;
        case  742:	return @" Honduras"; break;
        case  743:	return @" Nicaragua"; break;
        case  744:	return @" Costa Rica"; break;
        case  745:	return @" Panama"; break;
        case  746:	return @" Republica Dominicana"; break;
        case  750:	return @" Mexico"; break;
        case  754 ... 755:	return @"Canada"; break;
        case  759:	return @"Venezuela"; break;
        case  760 ... 769:	return @"Switzerland"; break;
        case  770 ... 771:	return @"Colombia"; break;
        case  773:	return @" Uruguay"; break;
        case  775:	return @" Peru"; break;
        case  777:	return @" Bolivia"; break;
        case  778 ... 779:	return @" Argentina"; break;
        case  780:	return @" Chile"; break;
        case  784:	return @" Paraguay"; break;
        case  786:	return @" Ecuador"; break;
        case  789 ... 790:	return @" Brasil  "; break;
        case  800 ... 839:	return @" Italy  "; break;
        case  840 ... 849:	return @" Spain  "; break;
        case  850:	return @" Cuba"; break;
        case  858:	return @" Slovakia"; break;
        case  859:	return @" Czech"; break;
        case  860:	 return @" Serbia"; break;
        case  865:	return @" Mongolia"; break;
        case  867:	return @" North Korea"; break;
        case  868 ... 869:	return @" Turkey"; break;
        case  870 ... 879:	return @" Netherlands"; break;
        case  880:	return @"South Korea"; break;
        case  884:	return @" Cambodia"; break;
        case  885:	return @" Thailand"; break;
        case  888:	return @" Singapore"; break;
        case  890:	return @" India"; break;
        case  893:	return @" Vietnam"; break;
        case  896:	return @" Pakistan"; break;
        case  899:	return @" Indonesia"; break;
        case  900 ... 919:	return @" Austria"; break;
        case  930 ... 939:	return @" Australia"; break;
        case  940 ... 949:	return @" New Zealand"; break;
        case  950:	return @" Global Office"; break;
        case  951:	return @" Global Office (EPCglobal)"; break;
        case  955:	return @" Malaysia"; break;
        case  958:	return @" Macau"; break;
        case  960 ... 969:	return @"Global Office (GTIN-8s)"; break;
        case  977:	return @"Serial publications (ISSN)"; break;
        case  978 ... 979:	return @"Bookland (ISBN)"; break;
        case  980:	return @"Refund receipts"; break;
        case  981 ... 984:	return @" coupon identification for common currency areas"; break;
            
        
    }
    return @"error";
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    
    
    
    sintetitzadorDeVeu = [[AVSpeechSynthesizer alloc]init]; // speech
    highlightView = [[UIView alloc] init];
    highlightView.autoresizingMask = UIViewAutoresizingFlexibleTopMargin|UIViewAutoresizingFlexibleLeftMargin|UIViewAutoresizingFlexibleRightMargin|UIViewAutoresizingFlexibleBottomMargin;
    highlightView.layer.borderColor = [UIColor greenColor].CGColor;
    highlightView.layer.borderWidth = 3;
    [self.view addSubview:highlightView];

    codeLabel = [[UILabel alloc] init];
    codeLabel.frame = CGRectMake(0, self.view.bounds.size.height - 40, self.view.bounds.size.width, 40);
    codeLabel.autoresizingMask = UIViewAutoresizingFlexibleTopMargin;
    codeLabel.backgroundColor = [UIColor colorWithWhite:0.15 alpha:0.65];
    codeLabel.textColor = [UIColor whiteColor];
    codeLabel.textAlignment = NSTextAlignmentCenter;
    codeLabel.text = @"(none)";
    
    countryLabel = [[UILabel alloc] init];
    countryLabel.frame = CGRectMake(0, self.view.bounds.size.height - 80, self.view.bounds.size.width , 40);
    countryLabel.autoresizingMask = UIViewAutoresizingFlexibleTopMargin;
    countryLabel.backgroundColor = [UIColor colorWithWhite:0.25 alpha:0.65];
    
    alertLabel = [[UILabel alloc] init];
    alertLabel.frame = CGRectMake(0, self.view.bounds.size.height - 120, self.view.bounds.size.width , 40);
    alertLabel.autoresizingMask = UIViewAutoresizingFlexibleTopMargin;
    alertLabel.backgroundColor = [UIColor redColor];
    alertLabel.textColor = [UIColor whiteColor];
    alertLabel.font = [UIFont boldSystemFontOfSize:24.0f];
    alertLabel.textAlignment = NSTextAlignmentCenter;
    alertLabel.text = @"Toc per escanejar de nou";

    countryLabel.textColor = [UIColor whiteColor];
    countryLabel.textAlignment = NSTextAlignmentCenter;
    countryLabel.text = @"(desconegut)";
    
    
    [self.view addSubview:codeLabel];
    [self.view addSubview: countryLabel];
    [self.view addSubview: alertLabel] ;

    session = [[AVCaptureSession alloc] init];
    device = [AVCaptureDevice defaultDeviceWithMediaType:AVMediaTypeVideo];
    NSError *error = nil;

    input = [AVCaptureDeviceInput deviceInputWithDevice:device error:&error];
    if (input) {
        [session addInput:input];
    } else {
        NSLog(@"Error: %@", error);
    }

    output = [[AVCaptureMetadataOutput alloc] init];
    [output setMetadataObjectsDelegate:self queue:dispatch_get_main_queue()];
    [session addOutput:output];

    output.metadataObjectTypes = [output availableMetadataObjectTypes];

    prevLayer = [AVCaptureVideoPreviewLayer layerWithSession:session];
    prevLayer.frame = self.view.bounds;
    prevLayer.videoGravity = AVLayerVideoGravityResizeAspectFill;
    [self.view.layer addSublayer:prevLayer];
    
    UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(handleTapGesture:)];
    tapGesture.numberOfTapsRequired = 1;
    [self.view addGestureRecognizer:tapGesture];

    [session startRunning];

    [self.view bringSubviewToFront:highlightView];
    [self.view bringSubviewToFront:codeLabel];
    [self.view bringSubviewToFront:countryLabel];
}
- (void)handleTapGesture:(UITapGestureRecognizer *)sender {
    if (sender.state == UIGestureRecognizerStateRecognized) {
        alertLabel.hidden = true;
        countryLabel.text = @"(desconegut)";
        codeLabel.text = @"(cap)";
        [session startRunning];
    }
}

- (void)captureOutput:(AVCaptureOutput *)captureOutput didOutputMetadataObjects:(NSArray *)metadataObjects fromConnection:(AVCaptureConnection *)connection
{
    CGRect highlightViewRect = CGRectZero;
    AVMetadataMachineReadableCodeObject *barCodeObject;
    NSString *detectionString = nil;
    NSString *countryValue = nil;
/*
    NSArray *barCodeTypes = @[AVMetadataObjectTypeUPCECode, AVMetadataObjectTypeCode39Code, AVMetadataObjectTypeCode39Mod43Code,
            AVMetadataObjectTypeEAN13Code, AVMetadataObjectTypeEAN8Code, AVMetadataObjectTypeCode93Code, AVMetadataObjectTypeCode128Code,
            AVMetadataObjectTypePDF417Code, AVMetadataObjectTypeQRCode, AVMetadataObjectTypeAztecCode];
   */
     
    NSArray *barCodeTypes = @[AVMetadataObjectTypeEAN13Code];

    for (AVMetadataObject *metadata in metadataObjects) {
        for (NSString *type in barCodeTypes) {
            if ([metadata.type isEqualToString:type])
            {
                //NSLog(@" Metadata Type %@", metadata.type);
                barCodeObject = (AVMetadataMachineReadableCodeObject *)[prevLayer transformedMetadataObjectForMetadataObject:(AVMetadataMachineReadableCodeObject *)metadata];
                highlightViewRect = barCodeObject.bounds;
                detectionString = [(AVMetadataMachineReadableCodeObject *)metadata stringValue];
                NSLog(@"Code: %@", detectionString);
                NSString * country = [detectionString substringWithRange:NSMakeRange(0, 3)];
                //NSLog(@" country %@", country);
                int valor = [country intValue];
                countryValue = [self getCountry:valor];
                NSLog(@" el pais es %@", countryValue );
                
                
                
                [session stopRunning];
                [self.view bringSubviewToFront:alertLabel];
                alertLabel.hidden = false;
                break;
            }
        }
        

        if (detectionString != nil)
        {
            AVSpeechUtterance *utterance = [AVSpeechUtterance speechUtteranceWithString: countryValue];
            [utterance setRate:AVSpeechUtteranceMinimumSpeechRate];
            //[speechSyn pauseSpeakingAtBoundary:AVSpeechBoundaryWord];
            [sintetitzadorDeVeu speakUtterance:utterance];
            
            
            codeLabel.text = detectionString;
            countryLabel.text = countryValue;
            break;
        }
        else
            codeLabel.text = @"(none)";
    }

    highlightView.frame = highlightViewRect;
}



@end