---
name: idea-04-failure-peeling
description: >-
  Primary ideation skill #4 (Concrete Failure-Case Peeling & CV Three-Element Method Design, adapted from ZJU Peng Sida & Master-cai).
  Use in Round 4 of a multi-skill innovation loop to trace concrete failure modes back to the exact
  tensor breakdown operation and design operators with strict CV method rigor.
---

# 主力破局 Skill #4：具体错例剥洋葱与顶会方法三要素法 (`idea-04-failure-peeling`)

> **方法论渊源**：提炼自浙大彭思达科研方法论（`research-ideation` 四种选题闸门）与 `Master-cai/Research-Paper-Writing-Skills` 的顶会方法节三要素铁律。

## 核心破局逻辑：不谈宏大概念，死磕一类具体错例直达张量算子层

审稿人最讨厌虚浮的“增强多尺度语义表征能力”；审稿人最买账的是：**“针对这类具体失效模式（如预测边界外扩偏松、过渡带假阳性冗余、密集邻近样本粘连漏判），我们在源码第 X 行追到了张量为什么算错，并针对性重设计了该步算子。”**

### 第一步：选定一类具体错例，连剥三层洋葱
从项目已有实验现象或结构分析中挑出一类**最具体、前 3 轮尚未正面解决的错例**，连问三次“为什么”：
- **第 1 层（表象层）**：模型预测输出具体错在哪？（如：范围偏松/偏小、弱信号漏判、跨层重复竞争、边界模糊或高幅干扰误判。）
- **第 2 层（特征层）**：进末端头之前的那一层特征张量上发生了什么？（如：响应峰值偏离真值中心、前景边缘与邻近背景特征余弦高度相似、粗层与细层各自只捕获局部片段。）
- **第 3 层（算子根因层）**：源码里哪一行具体运算造成了这种特征退化？（如：固定步长采样偏离了极值点、无条件归一化或直接拼接混入了背景统计量、相邻单元之间缺乏一致性传播通路。）

### 第二步：用「顶会方法三要素」严谨构造算子
设计的新结构模块必须严格对齐以下三要素，缺一不可：
1. **具象动机（Concrete Motivation）**：能画出一张直观的 `Toy Example / 错例张量对比示意图`——左边画基线算子为什么把响应散开或混淆，右边画新算子如何聚拢或剥离。
2. **严格张量流（Exact Tensor Flow）**：每一步变换的输入维度、核尺寸、归一化轴、广播维度、数值稳定项（如 `eps=1e-6` 防 `fp16` 溢出）全部精确到矩阵/张量下标，禁止用含糊的文字描述代替算式。
3. **可验证结构性质（Verifiable Mathematical Property）**：新算子必须至少具备一条**无需跑完整训练、光在 `check_self.py` 里喂受控合成张量就能当场验证的数学性质**（例如：常数输入残差严格为 0、亚单元平移质心精确守恒、极性翻转响应对称、跨边界传播自动截断等）！

### 第三步：把「受控合成张量验证」写进 `check_self.py`
在本轮编写 `check_self.py` 时，除了常规的前向/反传/零死梯度/开销测试外，**必须额外加 1–2 项针对上述数学性质的单元测试（Property Test）**，把实测误差（如 `<1e-5`）写进 `README.md` 第 2、3 节，让论文说服力拉满！
