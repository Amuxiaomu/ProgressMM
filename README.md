# ProgressMM
在navigationController添加进度条

- (void)startAnim;

- (void)endAnim;

- (instancetype)initBelowNav;

- (void)removeProgressView;

主要调用上面四个方法

如果把ProgressMM作为属性的话 需要多级添加或者多次执行效果的时候 需要移除,移除
的时候需要 将Progress数据设为nil
