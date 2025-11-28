#!/bin/bash
set -euo pipefail

#!/bin/bash
set -euo pipefail

# ===== Logging Block =====
LOG_FILE="../logs/instance_health_$(date +%F_%H%M%S).log"
exec > >(tee -a "$LOG_FILE") 2>&1
# =========================


echo "Checking EC2 Instance Health (LocalStack Simulation)..."

aws --endpoint-url=http://localhost:4566 ec2 describe-instances | jq '.Reservations[].Instances[] | {InstanceId: .InstanceId, State: .State.Name}'

