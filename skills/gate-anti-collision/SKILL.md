---
name: gate-anti-collision
description: >-
  Shared Gatekeeper Skill A (Dual-Layer Anti-Collision & Literature Scoop-Check Gate, adapted from The-Ideator, ARIS novelty-check, and ResearchStudio Scoop-Check).
  Run before writing code in EVERY round to block duplicate/re-skinned ideas against repository history,
  prior rounds, and published 2024-2026 literature, and to prevent hallucinated citations.
---

# 统一守门 Skill A：双层查重与文献核验门禁 (`gate-anti-collision`)

> **方法论渊源**：融合 `The-Ideator`（本地历史避让四档表）、上交 `ARIS /novelty-check`（六条严格判准）与 `microsoft/ResearchStudio Scoop-Check` + `research-novelty-gate`（四级文献证据制度）。

## 门禁职责
在每一轮主力破局 Skill 提出候选方案后、正式动笔写代码前，必须过本门禁。**任何未通过本门禁的候选直接淘汰重选！**

## 第一关：组内历史与前序轮次零撞车审查（最严红线）
对照 `01_代码理解与全网可创新位点全景图.md` 中的《历史已试方案避让表》以及本批次**前 `1..k-1` 轮已落地的方案账本**，逐项标注重合度：
- **L0 完全正交（放行）**：解决机制、数学算子家族均未出现过。
- **L1 同痛点异机制（放行，需在 README 第 5 节写明对比）**：攻击同一个真实业务痛点（痛点本来就只有那几个），但底层数学路径与插入机理完全不同。
- **L2 同机制换位点/换超参（一票否决！）**：把前几轮或历史方案的同一个算子从 Neck 挪到 Backbone、从 3 级改成 2 级、换个激活函数或改个英文缩写——**一律视为换皮重复，当场毙掉！**
- **L3 旧方案二合一拼接（一票否决！）**：把两套已有方案一前一后拼起来——**当场毙掉！**

## 第二关：学术界近两年顶会文献查新与真实性分级
1. **联网环境操作**：使用搜索工具（Web Search / arXiv / OpenAlex / Semantic Scholar）检索核心算子关键词 + 任务关键词（优先覆盖 2024–2026 CVPR / ICCV / ECCV / NeurIPS / ICLR / ICML / AAAI / TPAMI / IJCV / TIP）：
   - 若发现已有已发表论文在**完全相同的任务上使用了完全相同的算子公式**（100% 撞车），必须主动调整机制做出实质性差异化，绝不照抄。
   - **防误杀原则（ARIS 判准）**：除非能点名指出**具体哪篇已发表论文**在相同设定下做了完全等价的机制，否则不得凭“听起来好像有人做过”的模糊印象自我阉割好点子。
2. **严禁编造文献铁律（四级证据标注）**：
   每套方案 `README.md` 引用的至少 2 篇顶会顶刊依据，必须如实遵守真实性纪律：
   - 核实过真实标题、年份、会议/期刊的：正常列出并写清【借了什么、原文局限、本方案本质差异】；
   - 当前环境离线无法联网核对具体题录细节的：只允许引用你 100% 确知真实存在的经典/代表性工作，若对准确年份或会议卷期有一丝拿不准，**必须在文末显式标注 `[待联网核验]`，绝对禁止编造假论文标题、假作者或假 arXiv 编号！**
