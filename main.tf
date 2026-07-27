data "external" "slow_delay" {
  program = ["bash", "-c", <<EOT
    sleep 53
    echo '{ "result": "done" }'
EOT
  ]
}

# data "external" "cpu_burn" {
#   program = ["bash", "-c", <<EOT
#     # Burn CPU for ~30 seconds using arithmetic in a tight loop
#     end=$(( $(date +%s) + 30 ))
#     count=0
#     while [ $(date +%s) -lt $end ]; do
#       count=$(( count + 1 ))
#       x=$(( count * count * 31337 ))
#     done
#     echo "{ \"result\": \"burned $count cycles\" }"
# EOT
#   ]
# }

output "delay_result" {
  value = data.external.slow_delay.result
}

# output "cpu_burn_result" {
#   value = data.external.cpu_burn.result
# }

resource "null_resource" "name" {

}
