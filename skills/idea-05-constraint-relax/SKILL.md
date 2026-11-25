---
name: idea-05-constraint-relax
description: >-
  Primary ideation skill #5 (Baseline-as-Special-Case & Implicit Constraint Relaxation, adapted from ResearAI DeepScientist).
  Use in Round 5 of a multi-skill innovation loop to formulate an existing baseline layer as a
  mathematically constrained special case and relax the exact constraint hurting task performance.
---

# 主力破局 Skill #5：基线特例化与隐性约束松弛法 (`idea-05-constraint-relax`)

> **方法论渊源**：提炼自 `ResearAI/DeepScientist` (`idea` 73KB 核心方法论)：**“最优雅的顶会创新，不是在基线外面挂新零件，而是证明基线现有算子只是某个更一般数学族在苛刻隐性约束下的退化特例，然后精准松弛那条拖后腿的约束。”**

## 为什么这个方法极度适合出硬核网络结构？
1. **天然满足零侵入与初始化等价**：当松弛参数初始化在退化点时，新模块在数学上**100% 严格退化回原基线算子**！预训练权重一滴不漏全盘继承。
2. **天然自带完美的等参数/退化消融故事**：论文公式极其漂亮——基线是 $\lambda=0$（或各向同性、均一权重、静态核）的特例，我们释放了哪一个自由度，为什么这个自由度恰好对应本任务的物理自由度。

## 标准四步推演法

### 第一步：挑出原网络中一个关键“死板算子”（避开前 4 轮已改位置）
去源码里找那些写死成固定规则的地方，例如：
- 固定步长与固定对称权重的卷积 / 池化 / 双线性插值；
- 颈部跨尺度融合里完全对等、不分清浊的无条件拼接 `torch.cat([F_high, F_low], dim=1)` 或逐元素相加；
- 归一化层（BN/LN）对整张图前景与背景一视同仁求均值方差；
- 多级细化块或残差连接中固定标量权重 `x + f(x)`（忽视像素级/网格级特征置信度方差）；
- 检测/分割头中所有空间位置共用同一套静态分类超平面或各向同性感受野。

### 第二步：写出该算子的「隐性约束清单」
把该基线算子写成带约束的数学式，列出它暗中强加了哪 3 条死约束（例如：① 空间各向同性约束；② 亮暗极性单侧约束；③ 前景背景同分布约束；④ 跨层均一信任度约束；⑤ 固定整数网格采样约束）。

### 第三步：精准松弛 **唯一 1 条** 最伤本任务的约束
- 问自己：哪一条隐性约束在本任务场景下被严重违背？
- 只松弛这一条约束，将其升级为有界、稳定、低开销的可微参数化形式（如用低秩条件参数、双边权重、方向导数基、精度加权共轭更新等），其余约束保持不动以控制复杂度与过拟合风险。
- **死梯度预防检查**：若在退化点处下游分支权重全为 0 会导致上游条件生成器梯度为 0，必须采用非对称初始化（一端零初始化保等价，另一端正交/小非零初始化保梯度畅通），并在 `check_self.py` 中严测第 0 步全参数梯度非零！

### 第四步：过三道门禁并交付完整包
经 `gate-anti-collision`、`gate-reframing-story`、`gate-reviewer2-check` 核验后，输出完整代码、后台异步自检与 12 节 `README.md`。
