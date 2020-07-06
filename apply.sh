#!/usr/bin/env sh

set -e
#set -x

REG_DOMAIN="${1:-00}"
REG_USER="${2:-pi}"


# $1 - source file
# $2 - destination file
cp_file_with_backup() {
    if [ -f "$2" ]; then
        DT="$(date "+%Y-%m-%d_%H-%M-%S")"

        echo "Rename '$2' to '$2.${DT}'"
        mv "$2" "$2.${DT}"

        echo "Copy '$1' to '$2'"
        cp "$1" "$2"
    fi
}


# $1 - source file
# $2 - destination dir
cp_file_to_dir() {
    if [ -d "$2" ]; then
        echo "Copy '$1' to '$2'"
        cp "$1" "$2"
    fi
}


cp_file_with_backup "regulatory.bin"    "/lib/crda/regulatory.bin"
cp_file_with_backup "regulatory.db"     "/lib/firmware/regulatory.db"
cp_file_with_backup "regulatory.db.p7s" "/lib/firmware/regulatory.db.p7s"

cp_file_to_dir "${REG_USER}.key.pub.pem" "/lib/crda/pubkeys"
cp_file_to_dir "${REG_USER}.x509.pem"    "/lib/crda/pubkeys"

iw reg set "${REG_DOMAIN}"
sleep 1s

iw reg get

echo "Try to reboot and run:"
echo "iw reg set ${REG_DOMAIN}"
echo "iw reg get"
echo "iw list"
