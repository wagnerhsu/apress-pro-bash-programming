#!/bin/bash
# 以下代码在 dash 中会报错！

echo "这段代码会执行"

: << END_COMMENT
echo "这段代码被注释掉了"
echo "因为它们被作为输入传给了空命令"
rm -rf /  # 即使是危险命令也不会执行
END_COMMENT

echo "这段代码也会执行"
