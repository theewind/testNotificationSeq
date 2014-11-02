testNotificationSeq
===================
测试代码：参考：https://github.com/theewind/testNotificationSeq

通过五个UILable子类，添加到view中，然后按钮发送修改颜色和文字的消息，发现执行的顺序是按照添加的顺序执行的。
[[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(changeLableText) name:changeLableTextNofitication object:nil]; 
可以想象，NSNotificationCenter有一个数组存储观察者，然后循环发送。

但是遇到一个问题：如果在某个UILable中sleep(1),比如：1和5，即使2，3，4都没有sleep，也是要等到1和5的sleep都执行后，一起刷新五个lable：
分析：
1 在主线程post消息，然后五个lable几乎同时（不到一个runloop）收到消息，等待下一runloop时刷新界面，但是因为有sleep，所以主线程被阻塞，需执行完1和5的sleep，才会更新所有的UI。
2 子线程post消息，接收消息收更新UI和sleep都在主线程，则效果同上
3 子线程post消息，1和5的sleep在子线程更新UI在sleep之后，2，3，4更新在主线程，则2，3，4先更新，等待子线程sleep之间到以后，更新UI，如果属于同一个子线程，则sleep时间是两个之和
4 子线程post消息，1和5的sleep在子线程更新UI在sleep之前，2，3，4更新在主线程，则2，3，4先更新，1和5先更新UI，然后sleep，并执行之后的操作。

参考网上：http://aartivaz.blogspot.com/2013_01_01_archive.html
What is notification in iOS?
 
The notification mechanism of Cocoa implements one-to-many broadcast of messages based on the Observer pattern. Objects in a program add themselves or other objects to a list of observers of one or more notifications, each of which is identified by a global string (the notification name). The object that wants to notify other objects—the observed object—creates a notification object and posts it to a notification center. The notification center determines the observers of a particular notification and sends the notification to them via a message. The methods invoked by the notification message must conform to a certain single-parameter signature. The parameter of the method is the notification object, which contains the notification name, the observed object, and a dictionary containing any supplemental information.Posting a notification is a synchronous procedure. The posting object doesn’t regain control until the notification center has broadcast the notification to all observers. For asynchronous behavior, you can put the notification in a notification queue; control returns immediately to the posting object and the notification center broadcasts the notification when it reaches the top of the queue.Regular notifications—that is, those broadcast by the notification center—are intraprocess only. If you want to broadcast notifications to other processes, you can use the distributed notification center and its related API.
