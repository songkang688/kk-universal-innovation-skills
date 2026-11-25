---
name: idea-03-ccfa-gap-chain
description: >-
  Primary ideation skill #3 (Four-Deficit Diagnosis & Problem-Gap-Insight-Method-Evidence Chain, adapted from CCFA-Skills).
  Use in Round 3 of a multi-skill innovation loop to diagnose fundamental capability deficits
  and construct a watertight CCF-A / CVPR argument chain before writing code.
---

# 主力破局 Skill #3：四缺口诊断与严密五环论证法 (`idea-03-ccfa-gap-chain`)

> **方法论渊源**：提炼自 `mikubaka88/CCFA-Skills` (`ccf-idea-optimizer` & `ccf-idea-reviewer`) 的顶会立项五环链条与四大能力缺口诊断法。

## 核心破局逻辑：先定性“为什么做不到”，再对症造算子

很多结构改进无效，是因为**病根定错了**（例如本来是“缺判别信息”，却去改“解码头打分容量”，再怎么改也是在噪声里打转）。本轮必须严格走完“四缺口定性 → 五环锁扣”才允许动笔写代码。

### 第一步：四大能力缺口精准定性（必选其一，不可含糊）
审视当前基线网络尚未解决的任务痛点（且避开前两轮已改位点），判断它到底卡在以下哪一类缺口：
1. **缺口 D1 · 缺跨尺度/长程上下文（Missing Context）**：局部感受野看不清当前响应是真实目标还是高度相似的背景难负例干扰。
2. **缺口 D2 · 缺细粒度判别不变量（Missing Invariant Cue）**：输入发生分布漂移、噪声干扰或跨域变化时，浅中层特征统计量剧烈波动，缺乏对外部扰动鲁棒的结构不变量。
3. **缺口 D3 · 结构读写与监督目标错位（Readout-Objective Misalignment）**：网络内部其实已经编码了正确特征，但末端读出头、跨候选竞争或融合门控的数学形式把正确响应压了下去（如多分支预测竞争失衡、末端激活重标定漂移）。
4. **缺口 D4 · 分辨率与通道容量错配（Capacity-Resolution Bottleneck）**：高分辨率层通道太窄装不下多态语义，或低分辨率层空间网格太粗丢失几何拓扑。

### 第二步：锻造 CCF-A 五环锁扣链（少一环不准写代码）
将想法压缩成严丝合缝的五句话，检查逻辑是否闭环：
- **Problem（任务真痛点）**：在 `<具体场景/子集>` 上，基线出现 `<具体量化现象>`。
- **Gap（现有算子死穴）**：无论是原基线的 `<模块名>` 还是近两年文献中的 `<某顶会方法>`，都隐含了 `<某错误假设>`，导致 `<缺口 D1/D2/D3/D4>`。
- **Insight（反直觉/深层洞察）**：我们注意到 `<任务物理特性或张量统计规律>`，这意味着只要在 `<具体位点>` 满足 `<某数学性质>`，就能在不增加重负担的前提下根除该死穴。
- **Method（单一闭式结构）**：据此提出 `<模块名>`，其核心变换为 `<核心公式>`。
- **Evidence（可证伪证据与同参对照）**：若机制成立，`<主攻子指标>` 应显著超越噪声底，且把核心性质关掉但保留全部参数的 `<同参退化版>` 必定回落。

### 第三步：CCF-A 概念六维自检（满分 100，低于 82 分重想）
按【问题真切度 20 + 新颖非拼接度 25 + 洞察深度 20 + 机制自洽度 20 + 结构极简度 10 + 工程开销友好度 5】快速自评，过关并经 `gate-anti-collision` 核查无撞车后，输出完整代码、`check_self.py` 与 12 节 `README.md`。
