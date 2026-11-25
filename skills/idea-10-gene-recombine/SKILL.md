---
name: idea-10-gene-recombine
description: >-
  Primary ideation skill #10 (Top-Venue Operator Gene Decomposition & Breakdown-Boundary Re-derivation, adapted from AutoResearch-Idea & Paper-insight-skill).
  Use in Round 10 of a multi-skill innovation loop to decompose recent 2024-2026 top-venue operators
  into atomic mechanism genes and re-derive a unified operator tailored to the baseline's remaining blind spot.
---

# 主力破局 Skill #10：顶会算子基因拆解与崩溃边界重推导法 (`idea-10-gene-recombine`)

> **方法论渊源**：提炼自 `AutoResearch-Idea`（机制基因拆解：`Core Operator + Holding Assumption + Breakdown Boundary`）与 `Paper-insight-skill`（顶会机制剥离与跨任务落地）。

## 核心破局逻辑：拆基因、找边界、重推导——绝不做生硬“缝合怪”

到了第 10 轮，前 9 轮已经覆盖了大量经典切入点。本轮专门利用**近两年（2024–2026）CV/ML 顶会最新代表作的“机制基因拆解与崩溃边界互补重推导”**来收官，确保第 10 套依然具备极高的新颖度与顶会辨识度！

### 第一步：盘点剩余盲区 + 检索/召回 2–3 篇 2024–2026 顶会前沿算子
1. 先看一眼前 9 轮的防撞车账本：全网 8 大位点里，还有哪个关键位点（例如 Zone 8 轻量窄旁路基础模型锚定、Zone 6/7 跨级免 NMS 交互、或本任务最独特的未解盲区）还没被触及？
2. 针对该盲区，联网检索（若离线则调用已确证的 2024–2026 CVPR/ICCV/ECCV/NeurIPS/ICLR 经典工作，未核实的标 `[待联网核验]`），拆解出每篇论文的**三元机制基因**：
   - **Gene-Op（核心算子）**：它真正起作用的最小计算单元是什么？（剥掉原论文里凑工作量的辅助模块。）
   - **Gene-Assump（成立前提）**：它在原论文任务（如 ImageNet 居中大图分类、自然场景常规分割）上为什么有效？
   - **Gene-Break（崩溃边界）**：直接把它原封不动搬到我们当前仓库的任务上，会在哪个边界条件下崩溃或超预算？

### 第二步：执行「边界互补重推导」（非 A+B 串联！）
- **严禁做法（缝合怪）**：先过一遍论文 A 的模块，输出再喂给论文 B 的模块（参数翻倍、延迟叠加、审稿人一眼判 incremental A+B）。
- **正确做法（单算子内生融合）**：用第二条物理/统计约束直接**改写第一条算子内部的核生成函数、注意力归一化核或特征投影内积**，使其合并为**单一不可分割的新算子**，恰好修补 `Gene-Break` 崩溃边界！
- *内生融合思路示意*：将高效分块算子的低复杂度计算拓扑与差分算子的共模噪声抵消核在单次矩阵乘加内直接合并，而非串接两个独立模块；或构造极窄部署旁路在训练期线性对齐冻结预训练大模型的语义流形（推理期零大模型开销）。

### 第三步：收官核验与 10 套总评衔接
完成本套方案的代码、异步 `check_self.py` 自检、三道门禁审核与 12 节 `README.md` 后，检查全部 10 轮方案的防撞车账本与自检日志，协助主控技能汇总生成 `00_10套创新方案总览与优先上卡排序.md`。
