set -e
ts=`date +"%Y-%m-%d_%H%M"`
fn=lede-root-${ts}.ext4
fn2=lede-root-${ts}.squashfs
WORKDIR="$(pwd)"

rm -rf "${WORKDIR}/files/lib/modules"
tar -xvf "${WORKDIR}/../kmods/kmods-openwrt.tar.gz" -C "${WORKDIR}/files"

./scripts/feeds update
./scripts/feeds install -a

make -j30

cp -v ./build_dir/target-aarch64_cortex-a53_musl/linux-armvirt_64/root.ext4 "${WORKDIR}/${fn}"
cp -v ./build_dir/target-aarch64_cortex-a53_musl/linux-armvirt_64/root.squashfs "${WORKDIR}/${fn2}"
#mv -v ./build_dir/target-aarch64_cortex-a53_musl/linux-armvirt_64/root.ext4 /var/www/html/$fn 

