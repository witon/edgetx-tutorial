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
