#!/usr/bin/env bash
set -euo pipefail

# ==============================================================================
# 可选增强脚本：联网拉取全网高分开源科研创新 Skills 原始上游仓库做本地参考库
# 说明：
#   本包自带的 14 个核心 Skills 已经是完全独立可用的离线精炼版，【不跑本脚本也能直接用】！
#   如果你的服务器网络通畅，想额外把微软 ResearchStudio、上交 ARIS、CCFA-Skills、
#   Light-Science、Orchestra 等开源原仓拉到本地做文献检索脚本或扩展参考，运行本脚本即可。
# ==============================================================================

DEST_ROOT="${1:-${HOME}/.research-skills-upstream}"
mkdir -p "${DEST_ROOT}"

REPOS=(
  "microsoft/ResearchStudio"
  "wanshuiyin/Auto-claude-code-research-in-sleep"
  "mikubaka88/CCFA-Skills"
  "Light0305/Light-Science"
  "Orchestra-Research/AI-Research-SKILLs"
  "ResearAI/DeepScientist"
  "Spark-To-Paper-Skills/spark-to-paper-skills"
  "Bowen12137/cvpr-paper-playbook"
  "xf686/Meet-Reviewer-2"
  "K-Dense-AI/scientific-agent-skills"
)

echo ">>> 将浅克隆 ${#REPOS[@]} 个开源科研 Skills 原仓至：${DEST_ROOT}"

for slug in "${REPOS[@]}"; do
  dir_name="${slug//\//__}"
  target="${DEST_ROOT}/${dir_name}"
  if [[ -d "${target}/.git" ]]; then
    echo "  [已存在，跳过] ${slug}"
  else
    echo "  [正在拉取] https://github.com/${slug}.git ..."
    git clone --depth 1 "https://github.com/${slug}.git" "${target}" || echo "  [警告] ${slug} 拉取超时，可稍后重试（不影响内置14个核心Skills正常使用）"
  fi
done

echo ">>> 上游参考仓库拉取完毕，存放在：${DEST_ROOT}"
