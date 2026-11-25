#!/usr/bin/env bash
set -euo pipefail

# ==============================================================================
# Universal Innovation Skills — 一键零门槛安装脚本
# 支持客户端：Cursor / Claude Code / Antigravity / Codex / 任意项目本地目录
# 用法：
#   1. 全局安装（推荐，所有项目通用）：
#      bash install.sh
#   2. 安装到某个具体代码仓库内（随项目带走）：
#      bash install.sh --project /path/to/your-repo
#   3. 仅预览将要安装的位置（不写入磁盘）：
#      bash install.sh --dry-run
# ==============================================================================

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
SRC_SKILLS_DIR="${SCRIPT_DIR}/skills"

DRY_RUN=0
PROJECT_PATH=""

while [[ $# -gt 0 ]]; do
  case "$1" in
    --dry-run)
      DRY_RUN=1
      shift
      ;;
    --project)
      PROJECT_PATH="${2:-}"
      if [[ -z "${PROJECT_PATH}" ]]; then
        echo "错误：--project 后需跟目标项目目录路径"
        exit 1
      fi
      shift 2
      ;;
    -h|--help)
      sed -n '4,14p' "$0"
      exit 0
      ;;
    *)
      echo "未知参数：$1（使用 --help 查看用法）"
      exit 1
      ;;
  esac
done

install_to_target() {
  local target_dir="$1"
  local label="$2"
  echo ">>> 正在配置 [${label}] -> ${target_dir}"
  if [[ "${DRY_RUN}" -eq 1 ]]; then
    for skill_path in "${SRC_SKILLS_DIR}"/*; do
      [[ -d "${skill_path}" ]] || continue
      echo "    [DRY-RUN] 将复制 $(basename "${skill_path}") -> ${target_dir}/$(basename "${skill_path}")"
    done
    return
  fi

  mkdir -p "${target_dir}"
  local count=0
  for skill_path in "${SRC_SKILLS_DIR}"/*; do
    [[ -d "${skill_path}" ]] || continue
    local skill_name
    skill_name="$(basename "${skill_path}")"
    rm -rf "${target_dir}/${skill_name}"
    cp -R "${skill_path}" "${target_dir}/${skill_name}"
    count=$((count + 1))
  done
  echo "    已成功安装 ${count} 个 Skills 到 ${target_dir}"
}

echo "============================================================"
echo "  Universal Innovation Skills Suite (1总控 + 10主力 + 3守门)"
echo "============================================================"

if [[ -n "${PROJECT_PATH}" ]]; then
  mkdir -p "${PROJECT_PATH}"
  ABS_PROJECT="$(cd "${PROJECT_PATH}" && pwd)"
  install_to_target "${ABS_PROJECT}/.cursor/skills" "项目级 Cursor"
  install_to_target "${ABS_PROJECT}/.agents/skills" "项目级 Antigravity / 通用 Agent"
  install_to_target "${ABS_PROJECT}/.claude/skills" "项目级 Claude Code"
else
  install_to_target "${HOME}/.cursor/skills" "全局 Cursor"
  install_to_target "${HOME}/.claude/skills" "全局 Claude Code"
  install_to_target "${HOME}/.gemini/config/skills" "全局 Antigravity"
  install_to_target "${HOME}/.codex/skills" "全局 Codex"
fi

echo ""
echo "============================================================"
echo "安装完成！包含以下 14 个即插即用 Skills："
echo "  - 总控探索制词：innovation-prompt-architect"
echo "  - 10大主力破局：idea-01-oral-patterns ... idea-10-gene-recombine"
echo "  - 3大审查门禁 ：gate-anti-collision, gate-reframing-story, gate-reviewer2-check"
echo ""
echo "下一步：打开你的深度学习项目根目录，查看 README.md 复制第一句启动话术即可开跑！"
echo "============================================================"
