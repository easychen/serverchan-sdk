// index.d.ts

/**
 * ScSendOptions 定义了推送函数的可选参数
 */
export interface ScSendOptions {
    /** sctp 专用：标签列表，多个标签使用竖线分隔 */
    tags?: string;
    /** sctp 和非 sctp：消息卡片的简短描述 */
    short?: string;
    /** 非 sctp：是否隐藏调用IP，1为隐藏 */
    noip?: 1;
    /** 非 sctp：推送使用的消息通道，多个通道值用竖线隔开 */
    channel?: string;
    /** 非 sctp：消息抄送的 openid，多个 openid 用逗号或竖线分隔 */
    openid?: string;
}

/**
 * ScSendResponse 定义了推送函数返回的响应结果
 */
export interface ScSendResponse {
    /** 返回的状态码 */
    code: number;
    /** 返回的消息 */
    message: string;
    /** 可选的返回数据 */
    data?: any;
}

/**
 * 调用 Server 酱的推送函数
 * @param sendkey Server 酱的 SendKey
 * @param title 推送的标题
 * @param desp 推送的正文内容，默认为空字符串
 * @param options 推送的额外选项
 * @returns 返回推送结果的 Promise
 */
export function scSend(
    sendkey: string,
    title: string,
    desp?: string,
    options?: ScSendOptions
): Promise<ScSendResponse>;
