# kk-universal-innovation-skills · 通用深度学习提示词定制与 10 大 Skills 创新工厂

[![Skills: 14 Built-in](https://img.shields.io/badge/Skills-14%20Built--in%20(1%2B10%2B3)-0d6b65?style=flat-square)](#)
[![Dependencies: Zero](https://img.shields.io/badge/Dependencies-Zero%20API%20Keys-b85027?style=flat-square)](#)
[![Agents: Cursor | Claude | Antigravity | Codex](https://img.shields.io/badge/Agents-Cursor%20%7C%20Claude%20%7C%20Antigravity%20%7C%20Codex-2c3d47?style=flat-square)](#)
[![License: MIT](https://img.shields.io/badge/License-MIT-4a5568?style=flat-square)](./LICENSE)

一套 **零项目硬编码、零外部密钥依赖、换台电脑 `git clone` 即用** 的通用深度学习科研创新提示词生成与完整代码落地 Skills 套件（适用于计算机视觉、自然语言处理、多模态学习、时序预测、图神经网络、科学计算等任意 PyTorch / 深度学习仓库）。

本套件将**「两段式高命中科研创新流水线」**封装为 **14 个开箱即用的标准 Skills**（纯本地 Markdown 规约，离线也能 100% 运行，无需任何额外付费 API Key）：

1. **第一阶段（先摸透整体网络结构，生成项目专属提示词）**：由总控技能 `innovation-prompt-architect` 自动通读目标项目源码，追踪输入到输出的完整张量流，无死角扫描**全网络 8 大可创新结构位点**（输入嵌入茎、下采样/序列紧缩、主干编码块、编码器→解码器天然跨层连接桥、上采样/对齐层、跨层级特征融合颈、解码器/预测头与读出交互、条件先验与轻量旁路），排查优化器与混合精度暗礁，盘点历史实验避让表，自动生成专属于当前项目的《代码理解与可创新位点全景图》和《项目专属创新总控提示词》。**未特别指定方向时，默认执行「全网络结构创新」**（也可一句话切换为「零推理开销的训练策略创新」或「结构 + 策略交替循环」）。
2. **第二阶段（10 大正交主力 Skills 轮换，一个一个深度出齐 10 套完整方案）**：默认调度 **10 个切入视角完全正交的主力破局 Skills**，每轮以 1 个主力 Skill 主导、搭配 **3 个统一审查守门 Skills**，**做完一套再做下一套**，连续产出 **10 套零撞车、非拼盘的顶刊顶会级完整方案**（每套均含：无侵入可插拔完整代码 + 开关置 `0` 逐位等价 + 等参数退化证伪对照 + 后台异步快速自检 `check_self.py` + 含论文 Method 草稿与运行命令的 12 节 `README.md`）。

---

## 一、30 秒从 0 安装配置

### 方法 A：Mac / Linux / 远程服务器一键安装（推荐）

```bash
git clone https://github.com/songkang688/kk-universal-innovation-skills.git
cd kk-universal-innovation-skills
bash install.sh
```

> - 默认自动将全部 14 个 Skills 安装到全局目录（`~/.cursor/skills`、`~/.claude/skills`、`~/.gemini/config/skills`、`~/.codex/skills`），装一次后本机所有项目通用。
> - 若只想安装到某个具体代码仓库内：`bash install.sh --project /path/to/your-repo`

### 方法 B：Windows 用户直接复制（免命令行）

将仓库 `skills/` 目录下的 **14 个子文件夹**复制到对应工具目录即可：
- **Cursor**：`C:\Users\<用户名>\.cursor\skills\`（或项目下 `.cursor\skills\`）
- **Claude Code**：`C:\Users\<用户名>\.claude\skills\`
- **Antigravity**：`C:\Users\<用户名>\.gemini\config\skills\`（或项目下 `.agents\skills\`）

*(可选扩展：若网络通畅且希望额外克隆微软 ResearchStudio、上交 ARIS、CCFA-Skills、Light-Science、Orchestra 等开源上游原仓留作本地文献检索脚本与参考，可执行 `bash install_upstream_github.sh`；**不执行也完全不影响内置 14 个 Skills 独立满血运行**。)*

---

## 二、整体工作流程图与 14 个配套 Skills 清单

```
[任意深度学习项目代码库]
         │
         ▼  发送【话术 1】
┌───────────────────────────────────────────────────────────────────┐
│ Stage 1：总控探索与定制提示词生成 (innovation-prompt-architect)     │
│  1. 追踪输入→输出完整张量流，扫描全网 8 大可改结构位点（不漏死角）    │
│  2. 核查优化器分组/AMP/EMA/导出暗礁，建立仓库《历史已试避让表》      │
│  3. 缺省默认锁定【网络结构创新】（若指定训练策略则切零推理开销模式）  │
│  4. 自动在项目下生成 innovation_prompts/ 01全景图 + 02总控词 + 03派单│
└───────────────────────────────────────────────────────────────────┘
         │
         ▼  发送【话术 2】（或直接粘贴刚生成的 03 号派单提示词）
┌───────────────────────────────────────────────────────────────────┐
│ Stage 2：10大主力Skills轮换·串行深度产出10套方案（第 1 轮 → 第 10 轮）│
│  每轮固定流水线：                                                   │
│   [当轮唯一主力破局 Skill (idea-0k)]  ──► 独特视角发散 + 错开网络位点 │
│                  │                                                │
│   [门禁 A: gate-anti-collision]      ──► 查本地历史 & 前k-1轮 & 顶会 │
│   [门禁 B: gate-reframing-story]     ──► 砍除A+B拼盘，定单一数学核心 │
│                  │                                                │
│   [编写完整可插拔代码 + check_self.py] ──► 后台挂空闲GPU/CPU自检不等！│
│                  │                                                │
│   [门禁 C: gate-reviewer2-check]     ──► 200字毙稿自辩+公式代码对齐  │
│   [落盘 12节 README.md]              ──► 立即无缝进入第 k+1 轮！      │
└───────────────────────────────────────────────────────────────────┘
         │
         ▼  10 轮全部收官
[innovations/<日期>/ 下 10 套全绿通过的独立代码包 + 00_优先实验前3名推荐排序.md]
```

### 内置 14 个 Skills 职责速查表

| 分类 | Skill 目录名 | 核心作用与切入角度 | 提炼融合的开源学术体系 |
|---|---|---|---|
| **总控核心** | `innovation-prompt-architect` | 全仓网络结构探索、8 大可创新位点定位、项目专属提示词生成与 10 轮总调度（默认网络结构创新） | 双阶段通用制词与调度体系 |
| **主力 #1** | `idea-01-oral-patterns` | 对照顶会 Oral 论文归纳的创新母模式（概览先行调制、差分共模消噪、守恒重采样等）精准匹配瓶颈 | `microsoft/ResearchStudio` (`Idea-Spark`) |
| **主力 #2** | `idea-02-aris-lens` | 信息瓶颈/归纳偏置/流形动力学/采样相位/算力重分配 **5 透镜并行扇出 + 单核极简铁律** | 上海交大 `ARIS` (`/idea-creator`) |
| **主力 #3** | `idea-03-ccfa-gap-chain` | 四类根本能力缺口定性 + `Problem→Gap→Insight→Method→Evidence` 五环严密锁扣 | `mikubaka88/CCFA-Skills` |
| **主力 #4** | `idea-04-failure-peeling` | 从具体错例连剥三层洋葱直达源码算子崩溃行 + 顶会方法三要素 + 受控张量单元测试 | 浙大彭思达科研方法论 & `Master-cai` |
| **主力 #5** | `idea-05-constraint-relax` | 把基线现有层写成**带隐性约束的数学特例**，精准松弛最伤任务的那 1 条约束（天然初始等价） | `ResearAI/DeepScientist` |
| **主力 #6** | `idea-06-triz-contradiction` | 用 **TRIZ 尺度分离/正交轴向分解/双域解耦归一化** 结构性消解“高维精细表征 vs 低显存时延”矛盾 | `DARE` (`TRIZ Ideation`) |
| **主力 #7** | `idea-07-genealogy-delta` | 梳理部件三代方法演化树，对比「范式跃迁 Moonshot」与「痛点重构 Solid」择优取一 | `Light0305/Light-Science` |
| **主力 #8** | `idea-08-domain-transform` | 跳出常规网格/序列，做**傅里叶幅相、Gram-Schmidt 正交补空间、超图谱扩散或几何不变量变换** | `Orchestra-Research/AI-Research-SKILLs` |
| **主力 #9** | `idea-09-science-collider` | 引入同构**第一性原理算子**（除法增益控制、卡尔曼共轭精度融合、Sinkhorn 最优传输、近端展开） | `open-collider` & `K-Dense` |
| **主力 #10** | `idea-10-gene-recombine` | 拆解近两年顶会前沿算子的「核心算子+成立前提+崩溃边界」基因，内生重推导单算子 | `AutoResearch-Idea` & `Paper-insight` |
| **守门 A** | `gate-anti-collision` | 拦截与本仓历史方案、前 `k-1` 轮方案换马甲撞车；检索核实近两年顶会真文献，严禁编造论文 | `The-Ideator` + `ARIS` + `Scoop-Check` |
| **守门 B** | `gate-reframing-story` | 严禁 `A + B + C` 模块拼盘，排查死门控/简单末层偏置等十条硬伤，锁死单一贡献故事线 | `Spark-To-Paper` + `Supervisor-Skills` |
| **守门 C** | `gate-reviewer2-check` | 200 字审稿人一剑封喉自辩、README 公式与 `forward()` 逐行核对、强制配**等参数退化证伪开关** | `ARIS` + `Meet-Reviewer-2` + `cvpr-playbook` |

---

## 三、开箱即用：两步复制即跑的标准话术

在 AI 编程工具中打开你的目标项目根目录，按顺序发送下面两段提示词即可：

### 第一步：探索全网结构，生成专属于当前项目的提示词（未指定时默认网络结构创新）

```text
请调用 innovation-prompt-architect 技能，先完整探索当前仓库的整体网络结构、张量数据流、训练/优化器细节和已有实验记录，把输入层、主干编码器、跨层连接、上下采样、特征融合、解码器/预测头等所有能创新的地方全部找出来（按默认做【网络结构创新】）。在项目下生成：
1. innovation_prompts/01_代码理解与全网可创新位点全景图.md
2. innovation_prompts/02_项目专属_网络结构创新总控提示词.md
3. innovation_prompts/03_10大Skills逐个出10套创新点_派单提示词.md
注意不要修改原仓库任何已有文件，不要跑训练。
```

*(提示：如果想做**不改推理结构的训练策略创新**，把括号里改为 `这次指定做【训练策略创新】` 即可；如果想做**网络结构 A + 训练策略 B 交替出方案**，改为 `同时生成网络结构 A 与训练策略 B 两份提示词` 即可。)*

### 第二步：启动 10 大 Skills 逐个深度产出 10 套完整创新点

等第一步生成完 3 份文档后，直接在当前对话（或新建干净对话窗口释放最大上下文）发送：

```text
请读取并严格按照 innovation_prompts/01_代码理解与全网可创新位点全景图.md、02_项目专属_网络结构创新总控提示词.md 和 03_10大Skills逐个出10套创新点_派单提示词.md 开始执行！

要求：
1. 依次使用 10 个主力想创新点 Skills（idea-01 到 idea-10），一轮只以 1 个主力 Skill 为主，搭配 gate-anti-collision、gate-reframing-story、gate-reviewer2-check 三个守门 Skills，总共出 10 套互不撞车的顶刊顶会级网络结构创新方案。
2. 深度思考，一个一个做，做完一套再做下一套，不要合并敷衍！每套都要结合近两年顶会思想与当前任务的真实瓶颈，覆盖网络不同位点。
3. 每套交付完整可插拔代码、等参数证伪对照开关、check_self.py 自检脚本和完整 12 节 README.md（写清楚训练和评测命令，正式实验我自己跑，不要跑慢训练！）。
4. 节省时间：每套写完后把 check_self.py 挂在后台异步跑自检（有空闲显卡用显卡，没空卡用多线程 CPU），挂上去不要干等，立刻继续写下一套方案，等 10 套全部写完再回头核对所有自检日志全绿，并输出 00_10套创新方案总览与优先实验排序.md。现在开始第 1 套，中途不要停！
```

---

## 四、实用建议

1. **为什么坚持“先出专属提示词，再跑 10 轮创新”？**
   先把项目的层号、张量形状、优化器参数分组、预训练权重加载机制固化进 `01` 和 `02` 文档，后续哪怕分多个窗口接力出 10 套、20 套方案，AI 都不会写出破坏原有训练链路或重复撞车的代码。
2. **多卡服务器可顺手指定自检空闲卡**
   如果服务器上有空闲 GPU，可在第二步话术末尾注明可用的空闲 GPU 编号，单次前反传 + 混合精度 + 耗时实测几秒钟即可跑完。
3. **拿到 10 套方案后如何挑选优先开训？**
   直接查看收尾生成的 `00_10套创新方案总览与优先实验排序.md`，优先训练**单步耗时增幅小、针对验证集头号误差根因、且同入口 `--enable 0` 基线在相同训练轮次（Same Epoch）下可严格公平对齐**的前 2–3 套方案。
4. **中断无缝接力**
   由于每套方案均在 `innovations/` 下独立建包落盘，若中途断线或上下文写满，只需开新对话发送：`请读取 innovation_prompts/ 下三份文档并扫描 innovations/ 下已完成的方案防撞车，直接从第 K 轮继续出完剩余方案` 即可无缝续跑。

## License

MIT License
