---
name: idea-07-genealogy-delta
description: >-
  Primary ideation skill #7 (Method Genealogy Tree & Moonshot-vs-Solid Delta Ideation, adapted from Light-Science).
  Use in Round 7 of a multi-skill innovation loop to map the lineage of operators for a target
  component, contrast paradigm-shift vs. structural-refactor candidates, and select the sharpest delta.
---

# 主力破局 Skill #7：方法谱系演进与双轨增量推演法 (`idea-07-genealogy-delta`)

> **方法论渊源**：提炼自 `Light0305/Light-Science` (`light-idea-generation` + `idea_genealogy`) 的**演化谱系树（Evidence Root → Lineage Limit → Mechanism Delta）**与**分层风险对冲构思法**。

## 核心破局逻辑：站在近三年方法演化树的顶端找“下一代自然演进位”

顶会审稿人在看 Related Work 和 Method 时，脑子里有一棵演化树（第 1 代怎么做 → 第 2 代怎么改 → 2025 最新一代做到哪一步、还留了什么尾巴）。如果我们的结构正好落在**这棵演化树的“下一代逻辑必然节点”**上，审稿人会立刻觉得顺理成章且贡献扎实！

### 第一步：选定一个尚未深挖的网络关键部件，画出三代演化谱系
挑出本网络中前 6 轮未重点重构的一个核心部件（如跨尺度金字塔融合、一对一免 NMS 头部交互、解码器精细化级联、浅层抗噪茎等），梳理其三代谱系：
- **Gen-1（传统基线做法）**：当前仓库代码正在用的经典结构是什么？它的底层假设是什么？
- **Gen-2（常规改进路线与本仓已试死胡同）**：大家通常怎么改它（如加普通 SE/CBAM、加可变形卷积、加简单门控），为什么在本任务上饱和或失效？
- **Gen-3（2024–2026 顶会前沿节点）**：最近两年顶会在这个部件上推到了哪一步？它在面对我们任务的特殊难点时，还剩最后哪一口气没喘上来？

### 第二步：生成「Moonshot 范式跃迁」与「Solid 深度重构」双轨候选再二选一
针对 Gen-3 留下的断层，同时构思两个不同激进程度的方案：
1. **候选 A · Moonshot（全新数学范式替换）**：推翻该部件原有的前馈卷积堆叠，改用展开式变分优化（Deep Unrolling）、状态空间扫描、图拉普拉斯扩散或最优传输匹配等全新读出/融合范式（注意严控在 2–4 步轻量闭式迭代内，保证速度达标）。
2. **候选 B · Solid（原部件痛点精准重构）**：保留该部件原有的高效骨架，但将其内部失效的核心算子（如死梯度不确定度、无向特征混合、分类定位盲隔离）替换为数学性质严格可证的共轭/对称/耦合算子。

**择优裁决**：对比 A 和 B——如果 A 能在不超 10% 开销红线且零碎核延迟的前提下干净闭环，优先选 A 冲高创新性；如果 A 需要复杂近似导致时延暴涨或难以收敛，则果断选 B 做深做透！

### 第三步：必答 Light-Science 立项五问
在写代码前逐条确认：① 证据根在哪？② 核心机制增量（Mechanism Delta）是否只有一处而非拼盘？③ 最小判别对照是什么？④ 最可能翻车的风险点在哪？⑤ 推理与训练真实耗时比是否可控？全部过关并经三道守门 Skills 审核后落地完整代码包与文档。
