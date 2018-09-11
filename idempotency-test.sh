ansible-playbook -i $WORK_DIR/hosts $1 >test.output 2>&1 --vault-password-file mypassword || true
if grep -q 'changed=0.*unreachable=0.*failed=0' test.output; then
  echo "Playbook $1 is idempotent."
else
  echo "Playbook $1 failed idempotency test:"
  cat test.output
  exit 1
fi
