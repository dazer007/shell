## jenkins job 的快速恢复
    当重新安装jenkins的时候，我们选择直接安装到linux主机。
    这里就牵扯job备份的和恢复的问题，我们直接copy config.xml就行了，别的配置都可以丢弃。
    方式1：把 config copy 到新jenkins 里面，从本地加载配置。
    方式2：1不生效，我们 新建job 必须和之前的类型一模一样，然后把 config.xml复制回去。亲测
    其他的插件都自己重新安装
    