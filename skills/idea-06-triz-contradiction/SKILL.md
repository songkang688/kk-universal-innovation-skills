---
name: idea-06-triz-contradiction
description: >-
  Primary ideation skill #6 (TRIZ Engineering Contradiction Resolution, adapted from DARE Ideation Catalog).
  Use in Round 6 of a multi-skill innovation loop to formulate competing accuracy-efficiency or
  invariance-sensitivity trade-offs as formal TRIZ contradictions and resolve them structurally.
---

# 主力破局 Skill #6：TRIZ 精度—效率与表征矛盾消解法 (`idea-06-triz-contradiction`)

> **方法论渊源**：提炼自工程发明理论 `TRIZ` 与 `DARE` 科研构思策略库——拒绝平庸的“折中妥协（Trade-off）”，专门通过**空间分离、尺度分离、条件分离或对偶变换**同时满足两个表面互斥的指标要求。

## 核心破局逻辑：专打“顾此失彼”的死结

在深度学习网络设计中，凡是别人只能靠“调权重折中”或“暴力堆显存”的地方，都是最佳顶会创新富矿！

### 第一步：在当前网络中锁定一对尖锐的「工程/表征矛盾对」
结合 `01_代码理解与全网可创新位点全景图.md`（避开前 5 轮已用机制），找出本项目中存在“按下葫芦浮起瓢”的矛盾对：
- **矛盾 C1（高维精细细节 vs 显存与时延爆炸）**：微弱细节或精细边界极需高分辨率/长序列细粒度计算，但直接在高维张量上跑稠密大核或全局注意力会让 FLOPs 和显存翻倍。
- **矛盾 C2（长程全局上下文 vs 局部锐利边界保持）**：大跨度结构关联需要大感受野聚合，但常规大池化或平滑聚合会抹糊细小结构与精确边界。
- **矛盾 C3（跨域分布不变性 vs 微弱判别信号敏感性）**：若用强归一化消除域间统计偏移，容易顺手把低幅值的真实弱信号也抹平；若保留原始幅值，又对分布偏移脆弱。
- **矛盾 C4（训练期强表征容量 vs 推理期极简低延迟）**：训练阶段需要充足多分支容量捕获复杂分布，而部署阶段要求极低延迟与小参数。

### 第二步：调用 TRIZ 四大结构分离算子消解矛盾（不妥协！）
严禁采用 `0.5 * A + 0.5 * B` 这种无聊加权折中！必须从以下四种结构消解术中选一种彻底破局：
1. **尺度与系数分离（Scale-Coefficient Decoupling）**：把沉重的非线性上下文推理全部放到紧缩粗尺度（如 `1/2` 或 `1/4` 尺度）完成，输出局部仿射/引导变换系数，再与高分辨率细粒度引导特征做逐点闭式合成，兼得“粗尺度极速算力 + 高分锐利细节”。
2. **正交轴向分解（Orthogonal Axial Factorization）**：将高维稠密交互拆解为契合数据几何结构（如正交空间轴、径向+角向、或时间轴+特征轴）的可分离一维核或前缀扫描，以线性开销拿到全局感受野。
3. **训练—推理解耦重参数化 / 嵌套切片（Structural Reparameterization / Matryoshka Nesting）**：训练期展开多分支或嵌套多容量出口联合优化，推理期精确代数折叠为单层算子或按需裁剪子网络，实现训练强表征、推理零冗余。
4. **背景统计与前景响应解耦归一化（Background-Anchored Normalization）**：仅在低响应背景子集估计归一化统计量或白化协方差去校准全局特征，既消除跨域背景漂移，又完整保留有效前景的相对跳变。

### 第三步：在 `README.md` 与 `check_self.py` 中量化“双赢”
必须在自检中同时实测**计算开销（参数/FLOPs/真实 ms 时延）**与**边界/信号保持性质**，证明没有落入“账面 FLOPs 低但显卡调度反而更慢”的伪轻量陷阱。过三道守门 Skills 后完整落盘。
