# BOBUtils
常用方法等收集，添加扩展类，工具类方法，拥有很多方便快捷功能 ^_^

## 方便快捷设置属性值

1、为按钮新增title属性：
     ```
    UIButton *testButton = [[UIButton alloc]init];
    testButton.title = @"按钮标题";
    ```
2、避免崩溃，极大的增强APP的兼容性：（运行时重写title点语法：Unbutton（添加），UIlabel，UItextfield，UItextView）
    UILabel等 赋值类型不匹配不会崩溃：从后台获取数据类型不匹配时正常运行。
    ```
    #pragma mark - 重写text属性
   - (NSString *)text {
    return objc_getAssociatedObject(self, @selector(text));
   }

   - (void)setText:(NSString *)text {
    NSString *tempText = (text==nil||[text isKindOfClass:[NSNull class]]?@"":text);
    if ([tempText isKindOfClass:[NSNumber class]]) {
        tempText = [NSString stringWithFormat:@"%@",tempText];
    } else if (![tempText isKindOfClass:[NSString class]]) {
        tempText = @"";
    }
    objc_setAssociatedObject(self, @selector(text), tempText, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
   }
   ```
3、快速设置UiView 位置大小属性（所以UI控件包含Frame属性时）：
   ```
   快速设置宽度为50：
    testButton.width = 50;

   系统方法：
    CGRect frame = self.frame;
    frame.width = 50;
    testButton.frame = frame;
    ```
