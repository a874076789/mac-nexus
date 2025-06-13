#!/bin/bash

green() { echo -e "\033[32m$1\033[0m"; }
yellow() { echo -e "\033[33m$1\033[0m"; }

echo "请选择要执行的步骤："
echo "1) 安装 Homebrew"
echo "2) 安装 Rust"
echo "3) 安装 CMake"
echo "4) 安装 Protobuf"
echo "5) 添加 RISC-V 目标"
echo "6) 安装 Nexus CLI"
echo "7) 全部执行"
read -p "请输入数字（1-7）: " choice

case $choice in
  1)
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
    green "✅ Homebrew 安装完成"
    ;;
  2)
    curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y
    source $HOME/.cargo/env
    green "✅ Rust 安装完成"
    ;;
  3)
    brew install cmake
    green "✅ CMake 安装完成"
    ;;
  4)
    brew install protobuf
    green "✅ Protobuf 安装完成"
    ;;
  5)
    $HOME/.cargo/bin/rustup target add riscv32i-unknown-none-elf
    green "✅ RISC-V 目标添加完成"
    ;;
  6)
    curl https://cli.nexus.xyz/ | sh
    green "✅ Nexus CLI 安装完成"
    ;;
  7)
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
    curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y
    source $HOME/.cargo/env
    brew install cmake
    brew install protobuf
    $HOME/.cargo/bin/rustup target add riscv32i-unknown-none-elf
    curl https://cli.nexus.xyz/ | sh
    green "✅ 所有步骤执行完成"
    ;;
  *)
    yellow "⚠️ 无效输入，退出。"
    ;;
esac
