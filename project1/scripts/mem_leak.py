#!/usr/bin/env python3
import time

leaked_memory = []
while True:
    leaked_memory.append(' ' * 1024 * 1024)  # Allocating 1MB in each iteration
    time.sleep(1)
