---
name: idea-02-aris-lens
description: >-
  Primary ideation skill #2 (5-Lens Parallel Fan-Out & Single-Core Simplicity Iron Law, adapted from SJTU ARIS).
  Use in Round 2 of a multi-skill innovation loop to diverge across five distinct analytical lenses
  and enforce the strict single-core simplicity rule without secondary patch modules.
---

# 主力破局 Skill #2：五维分析透镜扇出与单核极简法 (`idea-02-aris-lens`)

> **方法论渊源**：提炼自上海交大 `wanshuiyin/Auto-claude-code-research-in-sleep` (ARIS `/idea-creator`) 的 **Phase 1.5 多透镜并行扇出** 与 **单核极简铁律（Single-Core Simplicity Rule）**。

## 核心铁律（违者直接重来）
> **“如果你必须再加第二个辅助模块、额外门控或附加损失，这个方案才显得有新意——那说明你做的是包装拼凑，而不是创新。”**
> 本轮产出的网络结构必须**全身上下只有一个核心算子改动**，干净利落。

## 标准执行步骤

### 第一步：五维分析透镜强制并行发散（Parallel Lens Fan-Out）
禁止顺着上轮思路往下滑。必须针对本项目的真实代码（避开第 1 轮已改位点），分别戴上以下 **5 副完全不同的眼镜**各写 1 个独立构想（共 5 个微草案）：

1. **透镜 L1 · 信息论瓶颈透镜（Information Bottleneck）**：网络哪一处通道压缩或特征相加（`Add` / `Concat+1x1`）把高熵判别信息与高幅无用冗余混在了一起？如何改写融合规则实现信息保真？
2. **透镜 L2 · 归纳偏置错配透镜（Inductive Bias Mismatch）**：标准固定算子假设信号“局部平稳、各向同性、边界离散”，而当前任务数据（如非刚性拓扑、长程关联、多尺度连续变化、模糊过渡带）违反了哪一条？对应的专属算子是什么？
3. **透镜 L3 · 梯度与流形动力学透镜（Gradient & Manifold Pathology）**：在多分支或“预训练主干 + 微调模块”结构中，哪条支路的梯度被压制、哪组预训练特征流形在微调时坍缩或漂移？结构上如何做流形锚定或梯度解耦？
4. **透镜 L4 · 采样对齐与相位几何透镜（Sampling & Phase Geometry）**：不同层级特征（如多尺度层间或离散 Token 与连续坐标之间）在跨层交互时是否存在半步相位偏移或峰值信息丢失？
5. **透镜 L5 · 算力空间重分配透镜（Compute Reallocation）**：网络是否把 80% 算力浪费在平滑背景或低频区域，而在关键决策边界算力不足？如何在**不触发稀疏碎核延迟**的前提下重分配表征容量？

### 第二步：单核剔骨筛选
对上述 5 个微草案逐一执行“剔骨刀”测试：
- 删掉所有跟前序轮次或仓库历史方案同类的草案；
- 剩下的草案中，问自己：**“如果拿掉所有花哨修饰，只留最核心的 20 行 PyTorch 张量运算，它本身够不够硬核、够不够写出一组漂亮公式？”**
- 选出纯度最高的那 **1 个**。

### 第三步：自检防伪设计
- 明确写出该单核模块插入的具体层号与输入输出形状；
- 设计一个**等参数退化开关**（保持完全相同的线性投影参数，仅关闭该核心机制），连同完整代码、`check_self.py` 与 12 节 `README.md` 一并落盘。
