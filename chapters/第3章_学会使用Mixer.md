# EdgeTX 遥控器教程

## 第三章：学会使用 Mixer

本章目标：掌握一对多、多对一、补偿混控三类常见 Mixer 用法。

---

## 一、先记住通道关系

- Input 与 Mixer 不要求序号对应。
- Mixer 与 Output 按通道号对应（CH1 对 CH1，CH2 对 CH2）。

![Control Flow](https://content.gitbook.com/content/P2t2HC29IiiujobytzG7/blobs/iQcHWwwkwsW7f8j3UnOS/inputflow.jpg)

---

## 二、Mixer 页面核心参数

![Mixes Page](https://content.gitbook.com/content/P2t2HC29IiiujobytzG7/blobs/lhgdh4CGnvC13F374FZ5/color_model_mixes.png)

![Mixes Edit](https://content.gitbook.com/content/P2t2HC29IiiujobytzG7/blobs/ed8EdaWFVE35hl34RSdw/color_model_mixes_edit.png)

核心参数：

- Source
- Weight
- Switch
- Multiplex（常用 Add）

---

## 三、场景 1：一个输入控制多个通道（不配图）

### 例：副翼摇杆控制左右副翼

操作：

1. CH1 添加 Source=Ail。
2. CH6 添加 Source=Ail。
3. 处理反向（负权重或 Output 反向）。
4. 打杆验证左右副翼差动正确。

---

## 四、场景 2：多个输入控制同一舵面逻辑

### 例：三角翼 Elevon（Ail + Ele）

示例逻辑：

- CH1：Ail + Ele
- CH2：Ail - Ele

验证顺序：

- 先验升降同向
- 再验横滚差动
- 再做权重微调

---

## 五、场景 3：升降舵混副翼（Ele → Ail）

目标：打升降时，副翼舵面同步小幅上下动作。

操作：

1. 在副翼通道新增 Source=Ele。
2. 小权重起步（建议 3%~10%）。
3. 左右通道按实际需要设置正负号。
4. 通过固定输入点检查两侧一致性。

---

## 六、场景 4：方向舵混副翼 + 开关控制

目标：打方向舵时混入少量副翼，并能开关启停。

操作：

1. 在副翼通道新增 Source=Rud。
2. 小权重起步（建议 3%~8%）。
3. 设置开关条件（如 SA↑启用，SA↓关闭）。
4. 另一侧副翼通道复制并按需反向。
5. 验证开关开/关两种状态。

---

## 七、本章验收清单

- [ ] 能做双副翼一对多混控
- [ ] 能做 Elevon 多输入混控
- [ ] 能做 Ele→Ail 混控
- [ ] 能做 Rud→Ail 且可开关控制
- [ ] 明确 Mixer/Output 通道号对应关系

---

## 八、本章常见错误

- Mixer 写在 CHx，却去调了 Output 的其他通道。
- 多输入叠加后权重过大导致总舵量超标。
- 正负号方向未分离验证就直接试飞。