---
name: idea-08-domain-transform
description: >-
  Primary ideation skill #8 (Cross-Representation Domain Transformation: Spectral, Subspace, Graph, Geometry, adapted from Orchestra Creative Thinking).
  Use in Round 8 of a multi-skill innovation loop to break out of standard spatial pixel/grid convolutions
  by mapping features into an alternate mathematical representation where entangled nuisances separate cleanly.
---

# 主力破局 Skill #8：跨表征空间变换法 (`idea-08-domain-transform`)

> **方法论渊源**：提炼自 `Orchestra-Research/AI-Research-SKILLs` (`creative-thinking-for-research` 表征变换框架)：**“在原空间里高度纠缠、非线性难解的问题，换一组正交基或对偶表征空间往往变成简单的线性剥离。”**

## 核心破局逻辑：跳出 $(x, y)$ 常规空域网格，换一套数学坐标系

前 7 轮多半已经在常规二维空域特征图上做足了文章。本轮强制要求：**把某处关键特征变换到非平凡表征域完成核心解耦/交互后，再无损逆变换回原网络流**（严查本仓避让表，避开已试过的同款频域/子空间变体）。

### 四大高价值表征变换域（四选一，严禁拼盘）

1. **傅里叶幅相解耦域（Fourier Phase-Amplitude Domain）**：
   - *数学物理依据*：信号的结构拓扑与空间/时序定位高度凝聚在**相位谱（Phase）**，而全局风格、幅值漂移与低频背景干扰高度集中在**低频幅度谱（Amplitude）**。
   - *结构落点*：在浅中层或跨层融合处做轻量 `fft` / `rfft2`（注意 `fp32` 保护防 `fp16` 溢出），严格保持或对齐相位结构，对幅度谱做自适应校准后再逆变换回原空间。
2. **正交补空间与低秩流形域（Orthogonal Subspace / Low-Rank Clutter Domain）**：
   - *数学物理依据*：大面积规则背景或共模干扰在空间/通道上往往张成一个低秩子空间，而真实判别残差位于其正交补空间或稀疏分量。
   - *结构落点*：无需昂贵 `SVD`（避免慢且梯度不稳的大矩阵奇异值分解），采用**修正 Gram-Schmidt 正交投影**或**双边低秩双线性分解**，在 `check_self.py` 中实测正交幂等误差 `<1e-6`。
3. **跨层级图/超图谱扩散域（Cross-Scale Graph / Hypergraph Spectral Domain）**：
   - *数学物理依据*：非规则拓扑或离散长程关联对象跨越多个层级且无固定矩形边界，常规局部邻域无法刻画同源语义集合。
   - *结构落点*：构造由 $M$ 个紧凑超边/原型节点中介的线性复杂度 $O(N \cdot M)$ 拉普拉斯谱扩散算子，避免 $O(N^2)$ 稠密建图爆炸。
4. **微分几何与结构张量不变量域（Differential / Structure Tensor Domain）**：
   - *数学物理依据*：一阶方向导数场、二阶海森曲率不变量或局部结构张量对加性/乘性基线漂移天然不变，能精准刻画细微边界与局部极值结构。

### 工程红线提醒
- `torch.fft` 与正交归一化在 AMP `fp16` 下必须局部强制 `with torch.cuda.amp.autocast(enabled=False): x.float()` 后转回原 `dtype`，并在 `check_self.py` 中必测 AMP 半精度无 `NaN/Inf`！
- 过齐 `gate-anti-collision`、`gate-reframing-story`、`gate-reviewer2-check` 三道门禁后交付完整包。
