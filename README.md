NSNotificationCenter+AutoreleasingObserver
==========================================

##NSNotificationCenter+AutoreleasingObserver

<p>Add observers without forgetting to removing them on dealloc</p>


NSNotificationCenter+AutoreleasingObserver
==========================================

<p>Create a UIButton with a badge on top. Easily customizable.
Your UIButton can be any button you wish to use. The badge on top can display any number or string of any size or length.</p>

<img alt="ScreenShot BarButtonItem" src="https://github.com/mikemtol/UIBarButtonItem-Badge/blob/master/screenshot2.png?raw=true" width="320px"/>


How To Get Started
------------------

#### Installation 

It's quite easy, just download and add "NSNotificationCenter+AutoreleasingObserver.h" and "NSNotificationCenter+AutoreleasingObserver.m" into your xcodeproject.

Don't forget to import the header file wherever you need it :

``` objective-c
#import "NSNotificationCenter+AutoreleasingObserver.h"
```

Usage
------------------
``` objective-c
-(void)ks_autoreleasingAddObserverForName:(NSString*)name			// Notification Name
                                   object:(NSObject *)object		// Object to observe
                                 receiver:(NSObject*)receiver		// Calling object
                                    queue:(NSOperationQueue*)queue	// NSOperationQueue, we can use mainQueue
                               usingBlock:(NotifcationBlock)block;	// Code to execute on event
```


More
----

<p>Any suggestions are welcome
Thank you.</p>

LICENSE
-------
The MIT License (MIT)

Copyright (c) 2015 MikeMTOL

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in
all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
THE SOFTWARE.




