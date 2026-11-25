---
name: gate-reframing-story
description: >-
  Shared Gatekeeper Skill B (Reframe-Don't-Combine & Top-Venue Story Gate, adapted from Spark-To-Paper ts-idea2story, PaperSpine, and HKUST Supervisor-Skills).
  Run before coding in EVERY round to eliminate A+B Franken-modules and forge a unified,
  single-principle paper contribution story.
---

# 统一守门 Skill B：反 A+B 拼接与顶会故事重构门禁 (`gate-reframing-story`)

> **方法论渊源**：融合 `Spark-To-Paper-Skills` (`ts-idea2story` 问题重构铁律：**"Reframe, don't combine"**)、`PaperSpine`（贡献先行契约）与港科大 `HKUSTDial/Supervisor-Skills`（`idea-evaluator` 十条致命缺陷前置门）。

## 门禁职责
专治大模型最容易犯的**“缝合怪综合征”**（例如“多尺度空洞卷积 + 通道空间双注意力 + 边界对比损失”三合一拼盘，审稿人看一眼标题就直接给 Borderline Reject：“A combination of existing techniques without deeper insight”）。

## 必过四条硬检

1. **名称与一句话测试（The "AND" Smell Test）**
   - 检查你给模块起的名字和一句话介绍：如果名字里不得不带“与 / 联合 / 双重协同（A and B）”且 A 与 B 在数学上没有共用同一个目标泛函或推导源头，**立刻砍掉次要的一半，或者向上提炼出一个统摄两者的单一原理解释！**
2. **十条致命缺陷前置排查（命中任一即打回重写）**
   - [ ] 是否只是在同一份特征上多算一个标量/向量简单加到最终分类 logit 上？（此类改法在大量实测中全在噪声底内！）
   - [ ] 门控或残差缩放因子初始化为 0 时，是否导致上游分支权重在第 0 步梯度也为 0（死门）？
   - [ ] 是否暗中依赖测试集分布调阈值或偷用了推理期拿不到的特权信息而没做学生蒸馏通路？
   - [ ] 计算复杂度是否随高分特征图像素数 $N=H\times W$ 呈 $O(N^2)$ 爆炸？
   - [ ] 是否破坏了预训练骨干权重的核心统计分布导致前几轮崩溃？
3. **与论文主线的契合契约**
   - 明确写出：如果整篇论文已有其他贡献点（如数据集构建或训练策略），本网络结构贡献点与它们在逻辑上如何互补、为何能干净解耦做独立消融？
4. **未训不报虚数铁律（Supervisor-Skills 诚信红线）**
   - 所有尚未跑完整训练的方案，对其精度变化的描述必须明确标注为**“基于机制的可证伪预期”**，严禁伪造实验精度表格！只允许实报 `check_self.py` 真实跑出来的参数量、FLOPs、耗时、显存与数学性质误差。
