#!/usr/bin/env bash

# SPDX-FileCopyrightText: (c) 2025-2026 The Secureblue Authors
#
# SPDX-License-Identifier: Apache-2.0

set -euo pipefail

systemctl unmask sshd.service
systemctl enable sshd.service

systemctl unmask sshd.socket
systemctl enable sshd.socket

systemctl unmask sshd-keygen.target
systemctl enable sshd-keygen.target

# sshd-unix-local.socket and sshd-vsock.socket only exist at runtime so we can
# unmask them but cannot enable them at build-time.
systemctl unmask sshd-unix-local.socket
systemctl ummask sshd-vsock.socket

chmod 600 /etc/NetworkManager/system-connections/static.nmconnection
