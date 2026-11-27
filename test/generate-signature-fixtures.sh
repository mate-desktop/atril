#!/bin/sh
set -eu

# Regenerate signed PDF fixtures used by testDigitalSignatures.py.

SCRIPT_DIR=$(CDPATH= cd -- "$(dirname -- "$0")" && pwd)
WORK_DIR="$SCRIPT_DIR/.siggen"
NSS_DIR="$WORK_DIR/nssdb"

rm -rf "$WORK_DIR"
mkdir -p "$NSS_DIR"

certutil -N -d "sql:$NSS_DIR" --empty-password

openssl req -x509 -newkey rsa:2048 -keyout "$WORK_DIR/key.pem" -out "$WORK_DIR/cert.pem" \
    -days 365 -nodes -subj "/CN=Atril Test Signer/O=MATE/C=US"

openssl pkcs12 -export -out "$WORK_DIR/signer.p12" -inkey "$WORK_DIR/key.pem" \
    -in "$WORK_DIR/cert.pem" -name "Atril Test Signer" -passout pass:test123

pk12util -i "$WORK_DIR/signer.p12" -d "sql:$NSS_DIR" -W test123 -K ""
certutil -M -n "Atril Test Signer" -t "u,u,u" -d "sql:$NSS_DIR"

cp "$SCRIPT_DIR/test-links.pdf" "$SCRIPT_DIR/test-signature-unsigned.pdf"

pdfsig -add-signature \
    -nssdir "$NSS_DIR" \
    -nss-pwd "" \
    -new-signature-field-name Sig1 \
    -sign Sig1 \
    -nick "Atril Test Signer" \
    -kpw test123 \
    "$SCRIPT_DIR/test-signature-unsigned.pdf" \
    "$SCRIPT_DIR/test-signature-valid.pdf"

cp "$SCRIPT_DIR/test-signature-valid.pdf" "$SCRIPT_DIR/test-signature-invalid.pdf"

TEST_DIR="$SCRIPT_DIR" python3 - <<'PY'
import os
from pathlib import Path
p = Path(os.environ["TEST_DIR"]) / "test-signature-invalid.pdf"
b = bytearray(p.read_bytes())
for i in range(len(b) // 3, len(b)):
    if b[i] not in (0, 10, 13, 32):
        b[i] ^= 0x01
        break
p.write_bytes(b)
PY

echo "Generated:"
echo "  test-signature-unsigned.pdf"
echo "  test-signature-valid.pdf"
echo "  test-signature-invalid.pdf"
