# serverchan-sdk

Server酱官方SDK，支持 ESM/CMD ，兼容 Nodejs/Web。使用示例：

```js
import { scSend } from 'serverchan-sdk';
const ret = await scSend('sendkey', 'title', 'description can be markdown', {tags:'服务器报警|图片'})
console.log(ret);
```

options:

```jsonc
{
    /** SC3专用：标签列表，多个标签使用竖线分隔 */
    tags?: string;
    /** SC3和SCT：消息卡片的简短描述 */
    short?: string;
    /** SCT：是否隐藏调用IP，1为隐藏 */
    noip?: 1;
    /** SCT：推送使用的消息通道，多个通道值用竖线隔开 */
    channel?: string;
    /** SCT：消息抄送的 openid，多个 openid 用逗号或竖线分隔 */
    openid?: string;
}
```
