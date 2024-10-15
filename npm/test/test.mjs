import { scSend } from '../src/index.js';  // 请根据实际模块路径替换

(async () => {
    try {
        const sendkey = '...'; // 替换成真实的 Server 酱 sendkey
        const title = 'Test Notification';
        const desp = 'This is a test message';

        const response = await scSend(sendkey, title, desp, { noip: 1 });
        console.log('Response:', response);
    } catch (error) {
        console.error('Error:', error);
    }
})();
