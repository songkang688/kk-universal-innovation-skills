---
name: idea-01-oral-patterns
description: >-
  Primary ideation skill #1 (Oral Macro-Pattern Matching, adapted from Microsoft ResearchStudio Idea-Spark).
  Use in Round 1 of a multi-skill innovation loop or when designing a paper-grade network architecture
  innovation by matching real bottlenecks to proven top-venue Oral structural patterns while avoiding
  classic rejection traps.
---

# 主力破局 Skill #1：顶会 Oral 母模式映射法 (`idea-01-oral-patterns`)

> **方法论渊源**：提炼自 `microsoft/ResearchStudio` (`Idea-Spark`) 对近两千篇 ICLR / ICML / NeurIPS / CVPR Oral 高分论文与被拒稿件的实证对比归纳。
> **默认作用对象**：网络结构创新（若用户显式要求训练策略，则映射至训练期结构化监督模式）。

## 核心破局逻辑：先锁瓶颈类型，再配 Oral 母模式，绝不拍脑袋凑模块

低分拒稿论文的通病是“找一个热门算子往基线上硬塞”；顶会 Oral 论文的共性是**“精准指认基线在当前任务上的信息损毁点，并选用恰好匹配该损毁类型的结构母模式”**。

### 第一步：从全网 8 大位点中指认一个「信息损毁/错位瓶颈」
对照 `01_代码理解与全网可创新位点全景图.md`，先回答基线在哪一层把关键信号弄丢或污染了：
- **B1 混叠与不可逆紧缩**：下采样/池化或序列紧缩把亚单元微弱信号或高频边界直接抹平；
- **B2 共模干扰淹没微弱前景**：跨层跳连或主干特征中，大面积背景纹理或全局偏移主导了通道统计量，压制了低对比有效信号；
- **B3 先验盲视与局部短视**：低层细粒度算子缺乏高层全局语义概览，导致同语义对象在不同上下文下响应极性不一致；
- **B4 读写解耦失配**：解码器/预测头的分类打分分支与结构回归分支各自为战，打分时看不见预测结构范围。

### 第二步：从 6 大高命中率结构母模式中选 **唯一 1 个** 破局（严禁多模式混搭）
1. **模式 P1 · 概览先行顶层转向（Overview-First Dynamic Steering）**：先由深层紧凑语义生成可变极性/方向/尺度核参数，反向调制中浅层特征提取，而非单向自底向上盲提。
2. **模式 P2 · 差分共模消噪（Differential Common-Mode Cancellation）**：构造成对互补路径（如双分支注意力或双投影流），通过精确代数相减抵消共模背景噪声残差。
3. **模式 P3 · 守恒型重采样（Moment / Energy-Preserving Resampling）**：改写标准跨步紧缩或插值上采样，显式保留局部块内一阶质心偏移、二阶方差矩或局部凸包结构。
4. **模式 P4 · 子空间正交剥离桥（Orthogonal Subspace Stripping Bridge）**：在编码器→解码器横向连接处，利用高层语义估计冗余背景基向量，将浅层特征投影到正交补空间后再融合。
5. **模式 P5 · 结构感知闭环读出（Structure-Conditioned Closed-Loop Readout）**：打破分类分支与结构回归分支的并排隔离，让打分算子直接聚合预测结构内外区域的上下文证据。
6. **模式 P6 · 因子化极轻全连通核（Kronecker / Rank-Factored Full-Context Operator）**：在权重空间而非激活空间做克罗内克外积或低秩合成，以 `<1%` 参数获得全通道/大感受野交互且零碎核调度开销。

### 第三步：Oral 拒稿防翻车自检（必答三问）
1. **为什么标准卷积自己学不出来？**（必须指出标准算子缺少跨层条件、缺少乘除/正交非线性或受限于固定采样网格。）
2. **第 0 步初始化是否无损？**（确保零初始化门或恒等路径使初始输出与基线一致，同时核对新增参数第 0 步梯度绝不为 0。）
3. **等参数退化对照怎么设？**（例如把动态转向固定为常数核、把正交投影换成同参数普通线性层，证明涨点来自模式本身。）

## 输出衔接
将筛出的 2–3 个模式候选送入 `gate-anti-collision` 与 `gate-reframing-story`，敲定唯一最优方案后编写完整可插拔代码与 12 节 `README.md`。
