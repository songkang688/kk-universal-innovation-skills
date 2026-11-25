---
name: gate-reviewer2-check
description: >-
  Shared Gatekeeper Skill C (200-Word Reviewer-2 Kill Argument, Formula-to-Code Consistency & Equal-Parameter Ablation Gate, adapted from ARIS, Meet-Reviewer-2, and cvpr-paper-playbook).
  Run after writing code and before finalizing README.md in EVERY round to verify mathematical-code
  consistency, non-zero gradients, and rigorous falsifiable controls.
---

# 统一守门 Skill C：200字一剑封喉自辩与公式代码一致性门禁 (`gate-reviewer2-check`)

> **方法论渊源**：融合上交 `ARIS` (`kill-argument` 200字毙稿攻防)、`xf686/Meet-Reviewer-2`（ICLR 2,956 份真实审稿硬伤库：公式与代码脱节拦截）与 `Bowen12137/cvpr-paper-playbook`（等成本替代消融法则）。

## 门禁职责
在每轮方案代码写完、准备交付 `README.md` 前执行最后一道“魔鬼审稿人”终审，确保交出去的每一套方案代码能跑、公式真对、审稿人挑不出硬伤。

## 三项终审清单（逐项核验）

### 1. 200 字「Reviewer-2 一剑封喉」攻防演练
站在最苛刻、最想拒你稿的顶会 Reviewer 2 视角，用不超过 200 字写出对本方案**最致命的一条质疑**，例如：
- *“你声称涨点来自所提出的正交解耦机制，但会不会只是因为你在跨层连接处多加了一组可训练线性投影参数？”*
- *“你引入的多步迭代算子虽然理论 FLOPs 增幅很小，但频繁的细碎算子内核启动开销是否会让实际 GPU 推理延迟大幅上升？”*

**硬核回应要求**：不准用嘴皮子辩解！必须在代码里真刀真枪配好对应的**等参数退化证伪开关**（如 `--degen_mode 1`，保留完全相同的参数量与投影层数，仅关掉核心正交/动态/跨层机制）并在 `check_self.py` 里实测真实毫秒级时延如实披露！

### 2. 公式 ⇄ PyTorch 代码逐符号核对（杜绝“文不对码”）
逐行对照 `README.md` 第 2 节的数学公式与源码文件的 `forward()`：
- 公式里写的归一化轴（通道维 `dim=1` 还是空间维 `dim=(-2,-1)`）、温度缩放因子、停止梯度算子（`.detach()`）、激活函数、残差相加位置，**必须与代码 100% 严丝合缝一致**！
- 检查优化器参数分组兼容性：新增参数的名字与维度（1D vs ≥2D）在原项目的 `build_optimizer` 中落在哪个组（有无权重衰减、有无特殊学习率倍率），在 `README.md` 中写清楚。

### 3. `check_self.py` 必过 8 项黄金自检清单
确保每套方案目录下的 `check_self.py` 覆盖并跑通以下检查（日志存于 `self_test.log`）：
1. **T1 导入与建模**：无报错构建基线与本方案模型；
2. **T2 开关置 0 逐位等价**：`--enable 0` 与原版基线前向输出最大绝对误差 `0.0`；
3. **T3 开关置 1 初始行为与前反传**：`--enable 1` 正常完成前向、损失计算与 `loss.backward()`，无 `NaN/Inf`；
4. **T4 新增参数 100% 零死梯度**：遍历所有新增 `requires_grad=True` 参数张量，确认第 0/1 步梯度范数严格 `> 0`；
5. **T5 数学核心性质单元检验**：至少 1 项受控输入检验（如正交误差、对称性、边界守恒、等参数对照参数量严格相等 `params_full == params_degen`）；
6. **T6 工程全链路兼容**：AMP 半精度、`deepcopy` / EMA 更新、推理 `fuse()`（若有）、`state_dict` 保存与重载一致；
7. **T7 实测开销账单**：精确统计部署参数量、FLOPs/MACs 以及预热后的真实单步耗时。
