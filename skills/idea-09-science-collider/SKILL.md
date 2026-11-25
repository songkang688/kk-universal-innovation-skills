---
name: idea-09-science-collider
description: >-
  Primary ideation skill #9 (Cross-Disciplinary Mathematical & Physical Operator Collision, adapted from open-collider & K-Dense).
  Use in Round 9 of a multi-skill innovation loop to import closed-form mathematical, physical,
  signal-processing, or neurobiological operators that match the physical generative mechanism of the task.
---

# 主力破局 Skill #9：跨学科物理与数学算子碰撞法 (`idea-09-science-collider`)

> **方法论渊源**：提炼自 `open-collider`（远域结构同构碰撞）与 `K-Dense-AI/scientific-agent-skills`（第一性原理科学建模）。

## 核心破局逻辑：用第一性原理闭式算子替代黑盒 MLP 拟合

当两个不同科学领域面对**数学同构（Structurally Isomorphic）**的难题时，成熟基础学科往往早已有极优美的闭式解或守恒律，而深度学习基线还在用粗糙的 `Conv+ReLU` 硬凑。把经过数十年检验的科学算子转化为**轻量可微算子层**，论文不仅数学格调极高，而且归纳偏置极准！

### 第一步：建立「任务痛点 ⇄ 跨学科同构算子」精确映射（严禁牵强附会）
先检查前 8 轮尚未使用的机制，从下述同构算子库（或你针对当前具体学科任务推导的物理方程）中选一个**数学同构度 100% 严密**的算子：

1. **神经科学增益模型 · 多环除法增益控制（Divisive Gain Control）**：
   - *适用同构痛点*：同一输入内同时存在极端高幅值离群响应（高动态范围）与极微弱低幅值目标信号，线性算子要么高幅饱和，要么弱信号被淹没。
   - *算子机制*：$y = \frac{x^n}{\sigma^n + (\mathcal{G}_s * |x|^n)}$，自动压缩极端动态范围同时放大局部微弱对比信号。
2. **统计估计与控制论 · 卡尔曼/信息滤波共轭精度融合（Kalman Precision-Weighted Fusion）**：
   - *适用同构痛点*：多级细化、多尺度融合或多模态交互中，各分支可靠性随样本局部区域动态变化，而原网络用固定系数相加，或不确定度估计缺少闭式共轭约束。
   - *算子机制*：显式预测对数精度（逆方差），按高斯共轭后验公式 $\tau_{\text{post}} = \tau_0 + \tau_1, \; \mu_{\text{post}} = \tau_{\text{post}}^{-1}(\tau_0 \mu_0 + \tau_1 \mu_1)$ 逐级单调收缩后验方差。
3. **计算最优传输 · 对数域 Sinkhorn-Knopp 等分/重心匹配（Entropic Optimal Transport）**：
   - *适用同构痛点*：多原型分类、跨层查询匹配或特征归属分配中，贪心 Softmax 导致少数主原型垄断样本（表征坍缩），漏掉长尾子簇。
   - *算子机制*：3–5 步无参数对数域 Sinkhorn 行列归一化，强制满足边际均衡约束或最优传输重心读出。
4. **逆问题与变分优化 · 近端软阈值/ISTA 展开网络（Deep Unrolled Proximal Splitting）**：
   - *适用同构痛点*：需要从含杂波特征中分离稀疏纯净有效信号，常规光滑激活函数（GELU/SiLU）在背景区残留非零微幅噪声导致假阳性响应。
   - *算子机制*：展开 2–3 步闭式梯度步 + 可学习近端死区软收缩算子，让背景微弱噪声精确截断为零。
5. **偏微分方程与守恒传输 · 各向异性反应—扩散或能量守恒状态演化**：
   - *适用同构痛点*：具有明确连续演化规律、方向性传播或能量/概率守恒约束的结构化预测任务。

### 第二步：拒绝“套壳伪科学”检验
- **铁律**：物理/数学公式里的每一个符号，必须在你的 PyTorch `forward()` 代码里真刀真枪算出来，**绝对不允许 README 里写一套微分方程，代码里其实只是 `nn.Conv2d` 加 `Sigmoid`！**
- 在 `check_self.py` 中必须设计一项专门验证该科学定律的数值检验（如动态范围压缩比、后验方差严格单调递减、秩外残差或边际守恒误差），过三道门禁后完整交付。
