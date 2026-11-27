#!/usr/bin/python3

# Validate digital-signature fixtures used by Atril tests.

import os
import subprocess
import sys


def run_pdfsig(pdf_path):
    cmd = ["pdfsig", "-nocert", pdf_path]
    result = subprocess.run(cmd, capture_output=True, text=True, check=False)
    return result.returncode, (result.stdout + result.stderr)


def assert_contains(output, expected):
    if expected not in output:
        raise AssertionError(f"Expected '{expected}' in output:\n{output}")


def main():
    test_dir = os.path.dirname(os.path.abspath(__file__))

    unsigned_pdf = os.path.join(test_dir, "test-signature-unsigned.pdf")
    valid_pdf = os.path.join(test_dir, "test-signature-valid.pdf")
    invalid_pdf = os.path.join(test_dir, "test-signature-invalid.pdf")

    for fixture in (unsigned_pdf, valid_pdf, invalid_pdf):
        if not os.path.exists(fixture):
            raise FileNotFoundError(f"Missing fixture: {fixture}")

    unsigned_rc, unsigned_out = run_pdfsig(unsigned_pdf)
    valid_rc, valid_out = run_pdfsig(valid_pdf)
    invalid_rc, invalid_out = run_pdfsig(invalid_pdf)

    if unsigned_rc not in (0, 2):
        raise RuntimeError(f"pdfsig failed for unsigned fixture (rc={unsigned_rc}):\n{unsigned_out}")
    if valid_rc != 0:
        raise RuntimeError(f"pdfsig failed for valid fixture (rc={valid_rc}):\n{valid_out}")
    if invalid_rc != 0:
        raise RuntimeError(f"pdfsig failed for invalid fixture (rc={invalid_rc}):\n{invalid_out}")

    assert_contains(unsigned_out, "does not contain any signatures")
    assert_contains(valid_out, "Signature Validation: Signature is Valid.")
    assert_contains(invalid_out, "Signature Validation: Digest Mismatch.")


if __name__ == "__main__":
    try:
        main()
    except Exception as exc:
        print(exc)
        sys.exit(1)
