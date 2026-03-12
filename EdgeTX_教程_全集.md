\n\n---\n\n
# EdgeTX 遥控器教程

## 第一章：从设置一架最简单的飞机开始

本章目标：完成一套可操作、可验证、可安全上电的基础模型配置。

---

## 一、先做安全准备

- 调试阶段不接电机；如果已接电调，必须拆下螺旋桨。
- 固定模型机身，避免舵面突发动作造成伤害。
- 油门摇杆保持最低位。
- 周围留出舵机动作空间，防止卡舵。

---

## 二、准备设备与基础接线

需要准备：

- EdgeTX 遥控器
- 对应协议接收机
- 舵机（建议先接 1~4 路）
- 稳定供电（BEC/接收机电源）

基础接线建议：

- 先接最基本控制通道（油门、横滚、俯仰、偏航对应通道）。
- 先追求“有响应”，后续再精修方向与行程。

---

## 三、新建一个最小可用模型

![Manage Models](https://content.gitbook.com/content/P2t2HC29IiiujobytzG7/blobs/r1eIDSuro3qG5s2gWF1x/ManageModels1.png)

![New Model Options](https://content.gitbook.com/content/P2t2HC29IiiujobytzG7/blobs/X92hye7XOJwTfpvPufni/new_model_options.png)

进入 **Manage Models**：

1. 新建模型。
2. 选择 **Blank Model**。
3. 命名模型（例如：Trainer-01）。
4. 暂不添加复杂混控与逻辑。

---

## 四、摇杆与旋钮校准（不配图）

进入路径：

- 模型主界面
- **Radio Settings（无线电设置）**
- **Hardware（硬件）**
- **Calibration（校准）**

校准步骤：

1. 所有摇杆、旋钮、滑块先回中或静止。
2. 按提示开始校准。
3. 两个摇杆完整走满行程（上下左右）。
4. 旋钮和滑块从最小到最大走一遍，再回常用位。
5. 保存并退出。

---

## 五、绑定接收机（关键前置）

![Internal RF](https://content.gitbook.com/content/P2t2HC29IiiujobytzG7/blobs/i4sSSIZkMFfRaszCL8qs/internalrf.png)

进入 **Model Setup → Internal/External RF** 后执行：

1. 选择正在使用的 RF 模块（Internal 或 External）。
2. 选择正确协议。
3. 设置 Receiver Number（协议需要时）。
4. 遥控器进入 Bind。
5. 接收机上电并进入绑定模式。
6. 绑定成功后退出 Bind，重启接收机复核。

常见协议参考：

- ExpressLRS（CRSF）
- FrSky ACCST / ACCESS（XJT / ISRM / R9）
- Multi-Protocol Module（MPM）
- 厂商私有协议（按厂商说明）

---

## 六、在通道监视页验证输入响应

![Channel Monitor](https://content.gitbook.com/content/P2t2HC29IiiujobytzG7/blobs/VRHB9FSyl4N8lDEe7WRc/channelmonitor.png)

进入 **Channel Monitor**：

- 打杆时确认通道数值变化正确。
- 先确认“有响应、方向逻辑正确”，再进行舵机精调。

---

## 七、舵机方向、行程与中立位初调

![Outputs](https://content.gitbook.com/content/P2t2HC29IiiujobytzG7/blobs/Y5uLcf7KYYDdphbk8J3C/color_model_output.png)

![Output Edit](https://content.gitbook.com/content/P2t2HC29IiiujobytzG7/blobs/HjYqnl7vJXwZRmO9tkHu/color_model_outputs_edit.png)

进入 **Outputs**：

- **Inverted**：方向反了就反向。
- **Subtrim**：把舵面调到基础中立。
- **Min / Max**：先给出基础安全范围，详细一致性调整放到第二章。

---

## 八、设置油门保护与启动检查

![Throttle](https://content.gitbook.com/content/P2t2HC29IiiujobytzG7/blobs/yMUT2euJlR2tVnCbTx8s/throttle.png)

![Pre-start Checks](https://content.gitbook.com/content/P2t2HC29IiiujobytzG7/blobs/2t7lSEGs1gdet9quYu3S/color_model_pre-start_checks.png)

![Special Functions](https://content.gitbook.com/content/P2t2HC29IiiujobytzG7/blobs/nfX875KWaKEddeCFqN0z/specialfunctions.png)

- 在 **Throttle** 页面确认油门源与方向。
- 在 **Pre-start Checks** 开启油门与开关检查。
- 在 **Special Functions** 设置油门锁（Throttle Cut），并验证可用。

---

## 九、本章验收清单

- [ ] 调试阶段未装桨（或未接电机）
- [ ] 模型已新建并命名
- [ ] 摇杆与旋钮校准完成
- [ ] 接收机绑定成功
- [ ] 通道监视页响应正常
- [ ] 舵机方向正确
- [ ] 油门检查与油门锁已验证

本章完成后，进入第二章：参数调整与机械保护。\n\n---\n\n
# EdgeTX 遥控器教程

## 第二章：参数调整与机械保护

本章目标：在进入复杂混控前，先把“手感参数”和“机械边界参数”分清并调对。

---

## 一、Input 与 Output 的分工

### Input（手感层）

Input 负责“你打杆时的感觉”。

典型参数：
- Weight
- Expo
- 输入曲线

### Output（结构层）

Output 负责“舵机/机构实际能到哪里，以及怎么到那里”。

典型参数：
- Inverted
- Subtrim
- Min / Max
- Curve（输出曲线）

![Control Flow](https://content.gitbook.com/content/P2t2HC29IiiujobytzG7/blobs/iQcHWwwkwsW7f8j3UnOS/inputflow.jpg)

---

## 二、Output：先把中立位调一致

![Outputs](https://content.gitbook.com/content/P2t2HC29IiiujobytzG7/blobs/Y5uLcf7KYYDdphbk8J3C/color_model_output.png)

![Output Edit](https://content.gitbook.com/content/P2t2HC29IiiujobytzG7/blobs/HjYqnl7vJXwZRmO9tkHu/color_model_outputs_edit.png)

操作步骤：

1. 摇杆回中。
2. 检查左右对应舵面中立是否一致。
3. 用 Subtrim 小步修正到一致。

---

## 三、Output：终点调整到设计目标位置

目标不是“仅不顶死”，而是“达到设计舵角且左右一致”。

以左右副翼为例：

- 中立点一致
- 上偏终点一致
- 下偏终点一致

操作步骤：

1. 先定目标舵角。
2. 调整 Min / Max，使双向终点达到设计值。
3. 左右通道对称收敛。

---

## 四、Output：必要时用 Curve 做全程一致性修正

适用场景：

- 中立和终点已一致，但中间段响应不同步。

做法：

1. 先完成中立与终点一致。
2. 再在 Output 为对应通道设置 Curve。
3. 用 25% / 50% / 75% 输入点对比左右舵面一致性并微调。

---

## 五、Input：最后调权重（Weight）与手感

![Inputs](https://content.gitbook.com/content/P2t2HC29IiiujobytzG7/blobs/q8uywGgMRalvllV2IVoO/color_model_inputs.png)

![Input Edit](https://content.gitbook.com/content/P2t2HC29IiiujobytzG7/blobs/7Ox05EupW3Dt13YBi0UV/color_model_input_edit.png)

原则：

- 结构参数在 Output 收敛后，再调 Input 手感。
- Weight 负责灵敏度，不负责机械限位。

---

## 六、本章调参顺序（硬规则）

1. 方向（Inverted）
2. 中立（Subtrim）
3. 终点（Min / Max）
4. 输出曲线（Curve，必要时）
5. 输入手感（Weight / Expo）

---

## 七、检查清单

- [ ] 左右对应舵面中立一致
- [ ] 左右对应舵面双向终点一致
- [ ] 达到设计舵角
- [ ] 无机械干涉、无异常抖动
- [ ] 油门锁有效（动力机型）

本章完成后，进入第三章：学会使用 Mixer。\n\n---\n\n
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
- 正负号方向未分离验证就直接试飞。\n\n---\n\n
# EdgeTX 遥控器教程

## 第四章：逻辑开关（Logical Switch）实战

本章目标：把“条件”写成逻辑开关，并接到 Mixer / Special Function，形成可验证的控制策略。

---

## 一、逻辑开关是什么

逻辑开关是虚拟开关（True / False）。
它不是物理拨杆，而是由条件计算得到的状态。

你可以理解为：

- 输入条件（开关位置、摇杆、遥测值）
- 逻辑计算（AND / OR / 比较阈值）
- 输出逻辑开关（L01、L02...）
- 用于触发功能（Mixer / Special Function / Flight Mode）

![Logical Switches 页面](https://content.gitbook.com/content/P2t2HC29IiiujobytzG7/blobs/JcYDfGtI4FVB2MIRFntL/colorlcd_model_ls.png)

![Logical Switches 编辑页面](https://content.gitbook.com/content/P2t2HC29IiiujobytzG7/blobs/LKRz9PeNhsX2XUoQvJKC/colorlcd_model_ls_edit.png)

---

## 二、最简单场景：多个开关组合

### 场景 1：SA↑ 且 SB↓ 才触发 L01

目标：两个物理开关同时满足时，L01 才为 ON。

操作路径：

- Model Settings → Logical Switches → 选择 L01 → Edit

设置建议：

- Func: AND
- V1: SA↑
- V2: SB↓

验证：

- SA↑ + SB↓ → L01 ON
- 其他组合 → L01 OFF

---

## 三、组合进阶：2段开关 × 3段开关 = 6种状态

核心思路：

- 两段开关（2种状态）
- 三段开关（3种状态）
- 总状态数 = 2 × 3 = 6

可以建立 6 个逻辑开关（示例）：

- L01：SA↑ AND SB↑
- L02：SA↑ AND SB-
- L03：SA↑ AND SB↓
- L04：SA↓ AND SB↑
- L05：SA↓ AND SB-
- L06：SA↓ AND SB↓

这样可将“组合状态”变成6个清晰的逻辑信号，再分别对应不同功能状态。

> 注：飞行模式（Flight Modes）的完整配置会在后续章节详细讲；本章先建立逻辑开关组合能力。

---

## 四、把逻辑开关接到动作

### 场景 2：L01 触发 Special Function（语音/提示）

操作路径：

- Model Settings → Special Functions

常见做法：

1. 新建一行 Special Function
2. Trigger 选择 L01
3. Function 选择 Play Track / Play Value
4. 设置 Repeat 间隔（避免连续刷屏）

![Special Functions 页面](https://content.gitbook.com/content/P2t2HC29IiiujobytzG7/blobs/nfX875KWaKEddeCFqN0z/specialfunctions.png)

### 场景 3：L01 控制某条 Mixer 的启停

操作路径：

- Model Settings → Mixes → 目标混控行 → Switch

做法：

- 将 Switch 从物理开关改为 L01
- L01 成立时混控生效；L01 不成立时混控关闭

> 本节无官方对应截图，建议按以上路径逐步操作。

---

## 五、阈值场景（直观且高频）

### 场景 4：低电压告警

目标：电压低于阈值时触发告警。

操作路径：

- Logical Switches：建立 L10（比较函数 a<x）
- Special Functions：用 L10 触发 Play Value / Play Track

建议：

1. L10 的 Func 设为 a<x
2. V1 选电压遥测源（VFAS / RxBt 等）
3. V2 设告警阈值（按电池体系设定）
4. 在 Special Functions 配置播报与重复间隔

### 场景 5：油门阈值保护

目标：油门低于阈值时，某功能才允许触发。

示例逻辑：

- L11：Thr < 阈值
- L12：L11 AND SA↑

然后将 L12 用于目标动作开关条件。

---

## 六、延时与保持（防误触）

在 Logical Switches 编辑页可用：

- Delay：满足条件后延迟触发
- Duration：触发后保持时长

适用场景：

- 条件抖动导致误触发
- 告警边界反复进出导致频繁开关

---

## 七、本章验收清单

- [ ] 能完成一个双开关 AND 逻辑
- [ ] 能完成 2段×3段 的 6 状态逻辑分解
- [ ] 能把逻辑开关接到 Special Function
- [ ] 能把逻辑开关接到 Mixer 条件
- [ ] 能做低电压阈值告警
- [ ] 能正确使用 Delay / Duration 防误触

---

## 八、本章常见问题

- 逻辑开关 ON 了，但没接动作（看起来“没效果”）
- 遥测源选错，阈值判断异常
- 未设置播报间隔，触发后语音刷屏
- 多条件一次全上，缺少单条件验证，导致难排错\n\n---\n\n
# EdgeTX 遥控器教程

## 第五章：飞行模式与全局变量（GV）

本章目标：学会用开关激活飞行模式、确认当前激活模式，并用 GV 管理不同模式下的手感与舵面默认位置。

---

## 一、飞行模式的作用

飞行模式不只是“手感切换”，还可以实现“舵面默认位置切换”。

典型作用分两类：

1. 手感变化（如 Weight / Expo）
2. 舵面默认位置变化（如不同模式下升降舵默认位置不同）

场景应用举例：

### 场景 1：特技飞机（航线飞行 / 特技飞行）

这个场景的核心是：同一架特技机在不同任务下，操控目标不同。

- 航线飞行：小舵量、手感柔和，便于轨迹控制
- 特技飞行：大舵量、动作快，便于完成机动动作

这个场景主要体现“手感参数按模式切换”的价值。

### 场景 2：DLG（发射 / 爬升 / 飞行 / 降落）

DLG 的阶段目标可以明确为：

- 发射：通过升降舵拉杆，让飞机出手后由平飞姿态转入抬头并尽快建立向上轨迹
- 爬升：追求阻力最小、轨迹最直
- 飞行：根据任务选择“下降率最小 / 升阻比最高”或“尽量快”
- 降落：打开刹车，并保持可灵活控制

这类机型通常会同时用到“手感切换 + 舵面默认位置切换”。

![Flight Modes 页面](https://content.gitbook.com/content/P2t2HC29IiiujobytzG7/blobs/OBLJQXRlFP1lfJefvzNw/color_model_fm.png)

---

## 二、怎样用开关激活某个飞行模式

操作路径：

- Model Settings → Flight Modes

设置规则：

- FM0 是默认模式（其他模式未激活时生效）
- FM1~FM8 通过 Switch 条件激活

示例（三段开关 SA）：

- FM1：SA↑（Takeoff）
- FM2：SA-（Cruise）
- FM3：SA↓（Landing）

![Flight Mode 编辑页](https://content.gitbook.com/content/P2t2HC29IiiujobytzG7/blobs/0mLKZAdKe74137IKckJY/color_model_fm_edit.png)

---

## 三、怎样确认当前激活的是哪个飞行模式

1. 在 Flight Modes 页面看当前高亮模式
2. 在主界面看当前模式名称（已命名时）

---

## 四、为什么 GV 是飞行模式的核心

不用 GV：每个模式都改固定参数，后期难维护。  
用 GV：逻辑结构不变，只切参数值。

一句话：

- 逻辑不变
- 参数按模式切换

GV 常用在：

- Input 的 Weight / Expo 参数
- Mixer 的混控比例
- 输出相关补偿量

> 在 Input 参数页，Weight / Offset / Curve % 可直接引用 GV。

![Global Variables 页面](https://content.gitbook.com/content/P2t2HC29IiiujobytzG7/blobs/353vyfORBKtRcr3KPjRg/color_model_GVs.png)

![Global Variable 编辑页](https://content.gitbook.com/content/P2t2HC29IiiujobytzG7/blobs/S01xT30y0fczZLXj48qw/GVE.png)

---

## 五、练习：新增“松杆平飞倾向 / 松杆低头倾向”模式（详细步骤）

练习目标：

- 在已有基础模型上新增一个模式
- 切换后实现两种不同松杆倾向：平飞倾向 / 低头倾向

---

### 第1步：准备与命名

1. 进入 `Model Settings → Flight Modes`。
2. 找到当前用于常规飞行的模式（例如 FM2）。
3. 新增两个可对比模式（例如 FM4、FM5），命名为：
   - FM4：Level（平飞倾向）
   - FM5：NoseDn（低头倾向）

要求：模式名称简短清晰，主界面能一眼识别。

---

### 第2步：分配开关位置

1. 在 FM4 的 `Switch` 设置对应开关位置（例如 SC↑）。
2. 在 FM5 的 `Switch` 设置另一个开关位置（例如 SC↓）。
3. 保留一个中间位置给原常规模式（例如 SC-）。

要求：三个位置互不冲突，切换逻辑明确。

---

### 第3步：准备参数通道（用 GV 管理）

1. 进入 `Model Settings → Global Variables`。
2. 选一个未占用 GV（例如 GV3），命名为 `EPB`（Elevator Bias）。
3. 约定含义：
   - GV3 > 0：更偏向抬头
   - GV3 = 0：中性
   - GV3 < 0：更偏向低头

建议先把 GV3 的范围设小一些，便于安全调试。

---

### 第4步：把 GV 接入升降舵相关参数

路径参考（按你的模型结构二选一）：

- `Model Settings → Inputs → Elevator 输入行`
- 或 `Model Settings → Mixes → Elevator 对应混控行`

操作要点：

1. 找到升降舵相关的可调参数（偏置/补偿量所在位置）。
2. 把固定数值改为 GV3 引用。
3. 保持其他核心逻辑不变（不要同时改多个无关参数）。

> 如果你的当前模板把升降舵偏置写在 Mixer，就在 Mixer 引 GV；写在 Input 就在 Input 引 GV。

---

### 第5步：给 FM4 / FM5 赋不同 GV 值

回到 `Global Variables` 页面，给 GV3 设模式值（示例）：

- FM4（Level）：GV3 = 0 或小正值
- FM5（NoseDn）：GV3 = 小负值

调参原则：

- 从小值开始，逐步加大差异
- 不要第一次就给大幅度

---

### 第6步：地面验证（必须做）

1. 固定机体，确认安全。
2. 切到 FM4，观察升降舵默认位置变化是否符合“平飞倾向”。
3. 切到 FM5，观察是否出现“低头倾向”。
4. 来回切换 5~10 次，确认无异常跳变、无反向。

通过标准：

- 模式识别正确
- 舵面变化方向正确
- 切换过程平顺

---

### 第7步：飞行验证与收敛

1. 先短时间验证 FM4 与 FM5 的趋势是否符合预期。
2. 每次仅微调一个参数（只改 GV3 数值）。
3. 记录每次改动与结果，逐步收敛。

建议：

- 若出现过度低头/抬头，先减小 GV3 绝对值。
- 不要同时改 Expo、Weight、GV3，避免定位困难。

---

验收：

- 切到“平飞倾向”模式，松杆后更易保持平飞趋势。
- 切到“低头倾向”模式，松杆后更易出现下俯趋势。
- 调参过程可复现、可解释。

---

## 六、本章验收清单

- [ ] 能说明飞行模式的作用（手感 + 舵面默认位置）
- [ ] 能用开关激活多个飞行模式
- [ ] 能确认当前激活模式
- [ ] 能在 Input/Mixer 参数里引用 GV
- [ ] 能设置不同模式的 GV 值
- [ ] 能完成普通固定翼三阶段配置
- [ ] 能完成 DLG 四阶段框架配置
- [ ] 能完成“松杆平飞/低头倾向”练习

---

## 七、本章常见问题

- 模式切换了，但参数未引用 GV，效果不明显
- 只改手感，不设置舵面默认位置
- 模式命名不清，识别困难
- 一次改太多参数，难定位问题\n\n---\n\n
# EdgeTX 遥控器教程

## 第六章：一步一步设置一架简单DLG

本章目标：先完成 `Output → Logical Switches → Flight Modes` 三层框架并验证切模，再按通道逐个落地（左副翼 → 右副翼 → 升降舵 → 方向舵）。
每次只加一条、验证一条，确保配置可复现、可回退。

六模式：`Zoom / Launch / Speed / Cruise / Thermal / Brake`

---

## 一、先设置 Output（机械层先收敛）

路径：`Model Settings → Outputs`

![Outputs 页面](https://content.gitbook.com/content/P2t2HC29IiiujobytzG7/blobs/Y5uLcf7KYYDdphbk8J3C/color_model_output.png)

![Outputs 编辑页](https://content.gitbook.com/content/P2t2HC29IiiujobytzG7/blobs/HjYqnl7vJXwZRmO9tkHu/color_model_outputs_edit.png)

### 1.1 通道定义

- CH1：左副翼
- CH2：右副翼
- CH3：升降舵
- CH4：方向舵

### 1.2 每个通道先完成四项

1. 中位点（Subtrim）
2. 最大值/最小值（Max / Min）
3. 正反（Inverted）
4. 终点一致性检查

### 1.3 左副翼曲线匹配（重点）

目标：让左右副翼在全行程（25/50/75/100%）尽量一致。  
做法：在左副翼通道加入输出曲线，逐点校正，与右副翼轨迹对齐。

### 1.4 本步验收

- 中位一致
- 双向终点一致
- 方向正确
- 无机械干涉/顶死

---

## 二、设置逻辑开关（先搭判定层）

路径：`Model Settings → Logical Switches`

![Logical Switches 页面](https://content.gitbook.com/content/P2t2HC29IiiujobytzG7/blobs/JcYDfGtI4FVB2MIRFntL/colorlcd_model_ls.png)

![Logical Switches 编辑页](https://content.gitbook.com/content/P2t2HC29IiiujobytzG7/blobs/LKRz9PeNhsX2XUoQvJKC/colorlcd_model_ls_edit.png)

本例使用 3 个开关：

1. **两段回弹开关**：按住 = Launch；松开 = 其他模式
2. **飞行主开关（3段）**：上 = Zoom；中 = 正常飞行组；下 = 刹车组
3. **飞行组内模式开关（3段）**：仅在飞行主开关位于中间时生效，上/中/下分别对应 Speed/Cruise/Thermal

### 2.1 逻辑开关定义

- **L01（Speed）**  
  飞行主开关 = 中，且飞行组内模式开关 = 上，且两段回弹开关 = 松开

- **L02（Cruise）**  
  飞行主开关 = 中，且飞行组内模式开关 = 中，且两段回弹开关 = 松开

- **L03（Thermal）**  
  飞行主开关 = 中，且飞行组内模式开关 = 下，且两段回弹开关 = 松开

- **L04（Brake）**  
  飞行主开关 = 下，且两段回弹开关 = 松开

- **Launch 条件**  
  两段回弹开关 = 按住（优先级最高）

### 2.2 本步验收（只验逻辑）

- 飞行主开关在中位且回弹开关松开时，组内三段开关能唯一触发 L01/L02/L03
- 飞行主开关切到下位且回弹开关松开时，L04 触发
- 回弹开关按住时，直接进入 Launch
- 无冲突、无互斥逻辑同时成立

---

## 三、设置 Flight Modes（再验切模）

路径：`Model Settings → Flight Modes`

![Flight Modes 页面](https://content.gitbook.com/content/P2t2HC29IiiujobytzG7/blobs/OBLJQXRlFP1lfJefvzNw/color_model_fm.png)

![Flight Mode 编辑页](https://content.gitbook.com/content/P2t2HC29IiiujobytzG7/blobs/0mLKZAdKe74137IKckJY/color_model_fm_edit.png)

### 3.1 模式命名

- Zoom（默认）
- Launch
- Speed
- Cruise
- Thermal
- Brake

### 3.2 绑定关系

- Launch → 回弹开关按住（直接绑定）
- Speed → L01
- Cruise → L02
- Thermal → L03
- Brake → L04
- Zoom → 默认模式（兜底）

### 3.3 本步验收（关键）

- Launch 按住即进、松开即退
- 正常飞行组三模式可稳定切换
- 刹车组在 Launch 松开时进入 Brake
- 无冲突、无多模式同时触发

---

## 四、按通道逐个配置 Mixer（每次只加一条）

路径：`Model Settings → Mixes`

![Mixes 页面](https://content.gitbook.com/content/P2t2HC29IiiujobytzG7/blobs/lhgdh4CGnvC13F374FZ5/color_model_mixes.png)

![Mixes 编辑页](https://content.gitbook.com/content/P2t2HC29IiiujobytzG7/blobs/ed8EdaWFVE35hl34RSdw/color_model_mixes_edit.png)

### 4.1 CH1 左副翼（示范通道）

**第1条：Ail 行**
- Source = Ail
- Weight = `+GV3`（副翼大小舵）
- Offset = `GV1`（襟翼下放量）
- Multiplex = Add

先验证：
- 只打 Ail，左副翼方向与幅度正确
- 切模式时左副翼响应差异可见

**第2条：Brk 行**
- Source = Brk
- Weight = 起步值（后调）
- Multiplex = Add

再验证：
- 拉 Brk 时左副翼刹车动作正确
- 与 Ail 叠加不异常

---

### 4.2 CH2 右副翼（同流程）

**第1条：Ail 行**
- Source = Ail
- Weight = `-GV3`（注意负号）
- Offset = `GV1`
- Multiplex = Add

先验证：
- 只打 Ail，右副翼与左副翼方向关系正确

**第2条：Brk 行**
- Source = Brk
- Weight = 起步值（后调）
- Multiplex = Add

再验证：
- 拉 Brk 时双副翼刹车动作正确
- 左右一致性正常

---

### 4.3 CH3 升降舵（两条）

**第1条：Ele 主控行**
- Source = Ele
- Weight = `GV4`（升降大小舵）
- Offset = `GV2`（升降舵偏移）

先验证：
- 只打 Ele，方向正确
- 模式切换下响应可复现

**第2条：襟翼/刹车补偿行**
- Source = Flp 或 Brk（按当前模板）
- Weight = `GV5`（升降舵混控襟翼值）

再验证：
- 拉 Brk/Flp 时补偿方向正确
- 不引入突变

---

### 4.4 CH4 方向舵（一条起步）

**第1条：Rud 主控行**
- Source = Rud
- Weight = 固定值起步（后续按需要再变量化）

验证：
- 只打 Rud，方向与幅度正确
- 各模式下无异常跳变

---

## 五、GV 纳入统一管控

路径：`Model Settings → Global Variables`

![Global Variables 页面](https://content.gitbook.com/content/P2t2HC29IiiujobytzG7/blobs/353vyfORBKtRcr3KPjRg/color_model_GVs.png)

![Global Variable 编辑页](https://content.gitbook.com/content/P2t2HC29IiiujobytzG7/blobs/S01xT30y0fczZLXj48qw/GVE.png)

### 5.1 GV 定义（固定）

- GV1：襟翼下放量
- GV2：升降舵偏移值
- GV3：副翼大小舵
- GV4：升降舵大小舵
- GV5：升降舵混控襟翼值

### 5.2 GV 接入位置

- GV1 → CH1/CH2 的 Ail 行 Offset
- GV2 → CH3 的 Ele 行 Offset
- GV3 → CH1/CH2 的 Ail 行 Weight（右侧负号）
- GV4 → CH3 的 Ele 行 Weight
- GV5 → CH3 的补偿行 Weight

### 5.3 本步验收

- 切模式时参数差异可见
- 不改混控结构，仅改 GV 即可调参
- 每次改单一 GV，结果可复现

---

## 六、模式飞行语义 + 地面验证 + 首飞收敛

### 6.1 模式飞行语义

- Zoom：垂直爬升
- Launch：出手后抬头
- Speed：高速穿越
- Cruise：常规飞行
- Thermal：盘气流/最低下降率
- Brake：刹车进近与可控减速

### 6.2 地面验证

1. 模式切换正确
2. 舵面方向正确
3. 舵面默认位置符合模式预期
4. 切换无跳变、无干涉

### 6.3 首飞调参原则

- 一次只改一个变量
- 一次只调一个模式
- 每次记录“模式-现象-改动”

---

## 本章验收清单

- [ ] Output 四通道完成机械收敛
- [ ] 逻辑开关与模式切换验证通过
- [ ] CH1~CH4 按“逐条新增 + 逐条验证”完成
- [ ] GV1~GV5 全部接入到位
- [ ] 地面验证通过，首飞可执行
\n\n---\n\n
# EdgeTX 遥控器教程

## 第七章：增强功能应用（定时器 / 回传传感器 / 数值播报）

本章目标：在前六章“可飞、可调”的基础上，补齐实战常用增强功能：
- 可控计时（开始/停止/重置）
- 回传监控（重点：接收机电压）
- 按键播报关键数值（定时器/高度）

配图原则：仅使用与当前步骤准确对应的官方界面图；不准确则不配。

---

## 一、定时器应用（详细步骤）

### 场景目标
实现以下功能：
1. 按一次发射回弹开关，Timer1 开始计时
2. 再按一次发射回弹开关，Timer1 停止计时
3. 支持重置：
   - 配置方式：Special Functions 重置
   - 操作路径：Telemetry 页面手动重置（不新增配置）

### 路径
- `Model Settings → Model Setup → Timer 1/2/3`
- `Model Settings → Logical Switches`
- `Model Settings → Special Functions`
- `Model Settings → Telemetry`

![Timer 配置页](https://content.gitbook.com/content/P2t2HC29IiiujobytzG7/blobs/TelpwMzxaQVheDG7GI2T/timers.png)

### 第1步：建立“按一下翻转一次”的逻辑

#### 1）建立发射按键触发条件
路径：`Model Settings → Logical Switches`

操作：
1. 选择一条空逻辑开关（例如 L01）。
2. 功能选择“检测开关动作/边沿触发”类型（按当前固件显示名称）。
3. 输入源选择发射回弹开关“按下动作”。
4. 保存。

结果：每按一次发射开关，L01 触发一次脉冲。

#### 2）建立翻转保持状态（Toggle）
路径：`Model Settings → Logical Switches`

操作：
1. 选择下一条空逻辑开关（例如 L02）。
2. 功能选择“Toggle / Flip-Flop / 状态翻转”类型（按固件显示名称）。
3. 触发输入选择 L01。
4. 保存。

结果：
- 第一次按发射开关：L02 OFF → ON
- 第二次按发射开关：L02 ON → OFF
- 之后每按一次都在 ON/OFF 间切换

### 第2步：Timer1 绑定翻转状态（实现启停）
路径：`Model Settings → Model Setup → Timer 1/2/3`

操作：
1. 进入 Timer1 编辑页。
2. Timer Mode 选择可由开关控制的模式（按你的机型流程选择）。
3. Switch/Trigger 绑定 L02（翻转状态）。
4. 保持默认累计计时方向（向上计时）。
5. 保存。

结果：
- L02=ON：Timer1 计时
- L02=OFF：Timer1 停止

### 第3步：增加重置方式 A（Special Functions）
路径：`Model Settings → Special Functions`

![Special Functions 页面](https://content.gitbook.com/content/P2t2HC29IiiujobytzG7/blobs/nfX875KWaKEddeCFqN0z/specialfunctions.png)

操作：
1. 新建一条 Special Function。
2. 触发条件选择“重置动作”（建议独立触发，不与发射启停复用）。
3. Function 选择 `Reset`。
4. Reset 目标选择 `Timer1`。
5. 保存并启用。

结果：触发该动作时，Timer1 清零。

### 第4步：重置方式 B（仅路径说明，不新增配置）
路径：`Model Settings → Telemetry`

说明：
- 需要手动重置时，可在 Telemetry 页面执行 Reset。
- 这是操作路径，不是新增配置项。

### 地面验证（必须做）
1. 上电后 Timer1 初始为停止。
2. 按一次发射开关，Timer1 开始计时。
3. 再按一次发射开关，Timer1 停止计时。
4. 连续按 6~10 次，确认每次稳定翻转。
5. 触发 Special Function 重置，确认 Timer1 归零。
6. 在 Telemetry 页面执行手动重置，确认同样可归零。
7. 确认“启停逻辑”和“重置逻辑”互不干扰。

### 本节验收
- [ ] 已实现“按一下开始、再按一下停止”
- [ ] 已配置 Special Functions 的 Timer1 重置
- [ ] 已掌握 Telemetry 页面手动重置路径
- [ ] 连续测试稳定，无误触发、无冲突

---

## 二、回传传感器应用（详细步骤）

### 场景目标
完成“接收机电压（RxBt）低压告警”基础配置并验证可用。

### 路径
`Model Settings → Telemetry`

![Telemetry 页面](https://content.gitbook.com/content/P2t2HC29IiiujobytzG7/blobs/AVc1xFjxHvFeVoHRuNIz/color_model_telemetry.png)

### 第1步：发现传感器
操作：
1. 进入 Telemetry 页面。
2. 执行 `Discover New`。
3. 等待传感器列表更新后停止发现。

检查点：列表中能看到 RxBt（接收机电压）等关键项。

### 第2步：清理列表
操作：
1. 删除重复项。
2. 删除无效项（长期不刷新或明显无效）。
3. 保留关键项：RxBt、RSSI/LQ、VFAS（若有）、高度类（若有）。

### 第3步：设置 RxBt 低压条件
操作：
1. 确认 RxBt 数值刷新稳定。
2. 在 Telemetry / 逻辑条件链路中设置“RxBt < 阈值”。
3. 阈值先用保守值，后续按实飞再微调。

### 第4步：地面验证
1. 观察 RxBt 实时值。
2. 模拟接近低压阈值状态。
3. 确认低压条件可触发。
4. 数值恢复后，确认告警条件可恢复。
5. 重复 2~3 次，排除误报/漏报。

### 本节验收
- [ ] 已完成传感器发现与清理
- [ ] RxBt 数值刷新稳定
- [ ] 已建立 RxBt 低压条件
- [ ] 触发与恢复验证通过

---

## 三、数值播报应用（Play Value）

### 场景目标
实现两个按键播报例子：
1. 按键播放定时器数值
2. 按键播放飞行高度

### 路径
`Model Settings → Special Functions`

![Special Functions 页面](https://content.gitbook.com/content/P2t2HC29IiiujobytzG7/blobs/nfX875KWaKEddeCFqN0z/specialfunctions.png)

### 3.1 例子一：按键播放定时器

#### 第1步：确认 Timer1 可用
路径：`Model Settings → Model Setup → Timer 1/2/3`

操作：确认 Timer1 可正常计时。

#### 第2步：新增播报功能
路径：`Model Settings → Special Functions`

操作：
1. 选一条空白 Special Function。
2. Trigger 选择“播报按键动作”。
3. Function 选择 `Play Value`。
4. Value 选择 `Timer1`。
5. Repeat 选择 `1x`（按一次播一次）。
6. 保存并启用。

#### 第3步：地面验证
1. 让 Timer1 先运行几秒。
2. 按播报按键。
3. 确认播报当前 Timer1 数值。

本例验收：
- [ ] 按键可触发 Timer1 播报
- [ ] 播报值与屏幕一致

### 3.2 例子二：按键播放飞行高度

#### 第1步：确认高度传感器可用
路径：`Model Settings → Telemetry`

操作：确认 Alt（或等效高度传感器）存在且刷新正常。

#### 第2步：新增高度播报功能
路径：`Model Settings → Special Functions`

操作：
1. 选一条空白 Special Function。
2. Trigger 选择“播报按键动作”。
3. Function 选择 `Play Value`。
4. Value 选择 `Alt`（或你的高度传感器项）。
5. Repeat 选择 `1x`。
6. 保存并启用。

#### 第3步：地面验证
1. 在可观察高度值变化的条件下测试。
2. 按播报按键。
3. 确认播报当前高度值。

本例验收：
- [ ] 按键可触发高度播报
- [ ] 播报值与 Telemetry 显示一致

### 本节注意事项
1. 两个播报建议用不同按键，避免误触发。
2. 若同一按键复用多个功能，要检查触发冲突。
3. 播报项保持“少而关键”，避免飞行中语音干扰。

---

## 本章总验收清单

- [ ] Timer1 已实现“按一下开始、再按一下停止”
- [ ] Timer1 已实现 Special Functions 重置
- [ ] 已掌握 Telemetry 手动重置路径
- [ ] RxBt 低压场景已跑通（触发/恢复正常）
- [ ] 已实现按键播报 Timer1
- [ ] 已实现按键播报高度
- [ ] 全部地面联测通过
\n\n---\n\n
# EdgeTX 遥控器教程

## 第八章：Lua脚本应用——记录多次飞行时间（最简实战）

在 EdgeTX 中，Lua 脚本可以扩展遥控器能力。用户不仅可以使用现成脚本，也可以编写自己的脚本，实现符合自己模型与飞行习惯的功能。

可以用 Lua 脚本来做的场景举例如下：

1. **记录多次飞行时间**  
   通过同一触发开关实现“开始/停止/保存一条记录”，连续记录多次飞行时长，并在脚本页面查看历史列表。

2. **一键语音读数（高度/电压/时间）**  
   在飞行过程中，通过按键触发语音播报关键数值，减少低头看屏幕的频率。  
   例如：按一下播报当前高度；按一下播报接收机电压；按一下播报当前计时值。  
   这类脚本适合飞行中需要快速获取关键信息、但又不希望频繁切页面的场景。

3. **调机辅助（统一输入、观察多舵面输出）**  
   将“输入量”和“多个舵面输出量”放在同一页面实时显示，帮助快速判断一致性与偏差。  
   例如：用同一个滑动杆给左右副翼输入相同舵量，脚本同步显示左右输出及差值，再按“中点→最大最小→曲线”顺序调整，使左右副翼在 25% / 50% / 75% / 100% 输入点都尽量一致。  
   这样可以减少来回切菜单与纯目测误差，提高调机效率。

本章先聚焦一个最小可用案例：**记录多次飞行时间**。先把脚本安装、加载、使用、验证这条链路跑通。

配图原则：
- 找到准确对应页面才配图
- 没有准确图就不配图，只写清楚步骤

---

## 一、准备工作

### 1.1 脚本文件
本章使用两个脚本（功能相同，界面适配不同）：
- 彩屏：`lap_logger_color.lua`
- 黑白屏：`lap_logger_bw.lua`

### 1.2 放置路径
将脚本复制到 SD 卡目录：
- `/SCRIPTS/TELEMETRY/`

### 1.3 修改触发开关
打开脚本文件，修改：

```lua
local TRIGGER_SWITCH = "L32"
```

改成你的实际触发开关（建议使用逻辑开关脉冲）。

---

## 二、加载脚本（按遥控器类型）

> 说明：Telemetry 传感器页面不是脚本加载入口。

### 2.1 黑白屏遥控器
路径：`Model Settings → Telemetry → [PAGE>] → Display`

操作：
1. 选择一个 Display 页（1~4）
2. 类型选择 `Script`
3. 脚本选择 `lap_logger_bw.lua`
4. 返回主界面并切到该脚本显示页

![Display Script Configuration（黑白屏）](https://content.gitbook.com/content/P2t2HC29IiiujobytzG7/blobs/AUMMDUwVZJUA5n7ptJcn/bwtel6.png)

### 2.2 彩屏遥控器
路径：`Screen Settings → Setup Widgets`

操作：
1. 选择一个显示区域
2. 选择脚本类小部件
3. 指向 `lap_logger_color.lua`
4. 返回主界面查看脚本页面

> 该步骤在不同主题/固件版本下界面差异较大，暂不强配图，避免误导。

---

## 三、脚本使用逻辑

同一个触发开关反复操作：
1. 第1次按下：开始计时（RUN）
2. 第2次按下：停止计时并保存第1条记录（STOP）
3. 第3次按下：开始第2次计时
4. 第4次按下：停止并保存第2条记录
5. 持续重复，列表会不断增加（最新在上）

---

## 四、验证

1. 进入脚本页面，确认初始为 STOP
2. 按一次触发开关，确认进入 RUN 并开始计时
3. 再按一次，确认停止并新增第1条记录
4. 再做两次按键，确认出现第2条记录
5. 连续重复 5~10 轮，确认每轮都“开始→停止→保存”
6. 核对列表顺序（最新在上）

---

## 五、常见问题排查

### 5.1 脚本看不到
- 路径错误（必须在 `/SCRIPTS/TELEMETRY/`）
- 文件后缀错误（必须是 `.lua`）

### 5.2 按开关没反应
- `TRIGGER_SWITCH` 与实际开关不一致
- 逻辑开关未正确输出脉冲

### 5.3 有计时但不保存
- 只执行了“开始”，未执行“停止”
- 脚本在“停止动作”时保存记录

### 5.4 列表异常
- 开关抖动导致重复触发
- 建议改用稳定逻辑开关脉冲作为触发源

---

## 六、本章验收清单

- [ ] 已正确放置 Lua 脚本文件
- [ ] 已完成触发开关配置
- [ ] 已按对应遥控器类型完成脚本加载
- [ ] 已实现“按一下开始、再按一下停止并保存”
- [ ] 已实现连续多次记录
- [ ] 已能在界面查看历史列表
- [ ] 已完成验证

---

### 后续扩展（下一步）

调机辅助的核心思路是：
用同一个滑动杆给左右副翼通道输入相同舵量，同时观察两个舵面的实际位置，按“中点→最大最小→曲线”顺序逐项收敛，并在 25% / 50% / 75% / 100% 输入点复测一致性。