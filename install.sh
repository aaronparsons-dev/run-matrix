#!/bin/bash

# Run Matrix Installer
# Copies platform-specific config files to the right locations

set -e

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
MATRIX_FILE="$SCRIPT_DIR/RUN_MATRIX.md"

usage() {
    echo "Usage: ./install.sh <platform> [target-directory]"
    echo ""
    echo "Platforms:"
    echo "  claude      Install as a Claude Code skill (~/.claude/skills/run-matrix/)"
    echo "  cursor      Copy rule to target project's .cursor/rules/"
    echo "  windsurf    Copy rule to target project's .windsurf/rules/"
    echo "  codex       Copy AGENTS.md to target project root"
    echo "  gemini      Copy GEMINI.md to target project root"
    echo "  copilot     Copy instructions to target project's .github/"
    echo "  all         Copy all platform files to target project"
    echo ""
    echo "Examples:"
    echo "  ./install.sh claude                    # Install skill globally"
    echo "  ./install.sh cursor ~/my-project       # Add rule to a project"
    echo "  ./install.sh all ~/my-project          # Add all platform files to a project"
}

if [ -z "$1" ]; then
    usage
    exit 1
fi

PLATFORM="$1"
TARGET="${2:-.}"

install_claude() {
    SKILL_DIR="$HOME/.claude/skills/run-matrix"
    mkdir -p "$SKILL_DIR"
    cp "$SCRIPT_DIR/.claude/skills/run-matrix/SKILL.md" "$SKILL_DIR/SKILL.md"
    cp "$MATRIX_FILE" "$SKILL_DIR/RUN_MATRIX.md"
    echo "Installed Claude Code skill to $SKILL_DIR"
    echo "Use /run-matrix in any Claude Code session."
}

install_cursor() {
    mkdir -p "$TARGET/.cursor/rules"
    cp "$SCRIPT_DIR/.cursor/rules/run-matrix.md" "$TARGET/.cursor/rules/run-matrix.md"
    cp "$MATRIX_FILE" "$TARGET/RUN_MATRIX.md"
    echo "Installed Cursor rule to $TARGET/.cursor/rules/"
}

install_windsurf() {
    mkdir -p "$TARGET/.windsurf/rules"
    cp "$SCRIPT_DIR/.windsurf/rules/run-matrix.md" "$TARGET/.windsurf/rules/run-matrix.md"
    cp "$MATRIX_FILE" "$TARGET/RUN_MATRIX.md"
    echo "Installed Windsurf rule to $TARGET/.windsurf/rules/"
}

install_codex() {
    cp "$SCRIPT_DIR/AGENTS.md" "$TARGET/AGENTS.md"
    cp "$MATRIX_FILE" "$TARGET/RUN_MATRIX.md"
    echo "Installed AGENTS.md to $TARGET/"
}

install_gemini() {
    cp "$SCRIPT_DIR/GEMINI.md" "$TARGET/GEMINI.md"
    cp "$MATRIX_FILE" "$TARGET/RUN_MATRIX.md"
    echo "Installed GEMINI.md to $TARGET/"
}

install_copilot() {
    mkdir -p "$TARGET/.github"
    cp "$SCRIPT_DIR/.github/copilot-instructions.md" "$TARGET/.github/copilot-instructions.md"
    cp "$MATRIX_FILE" "$TARGET/RUN_MATRIX.md"
    echo "Installed Copilot instructions to $TARGET/.github/"
}

case "$PLATFORM" in
    claude)   install_claude ;;
    cursor)   install_cursor ;;
    windsurf) install_windsurf ;;
    codex)    install_codex ;;
    gemini)   install_gemini ;;
    copilot)  install_copilot ;;
    all)
        cp "$MATRIX_FILE" "$TARGET/RUN_MATRIX.md"
        install_cursor
        install_windsurf
        install_codex
        install_gemini
        install_copilot
        echo ""
        echo "All platform files installed to $TARGET/"
        echo "For Claude Code, run: ./install.sh claude"
        ;;
    *)
        echo "Unknown platform: $PLATFORM"
        usage
        exit 1
        ;;
esac
