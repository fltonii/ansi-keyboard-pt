# Maintainer: YOUR NAME <your@email.com>
pkgname=xcompose-ansi-keyboard-ptbr
pkgver=1.0.0
pkgrel=1
pkgdesc="XCompose overrides for Brazilian Portuguese on ANSI keyboards with US alt. intl. layout"
arch=('any')
url="https://github.com/fltonii/xcompose-ansi-keyboard-ptbr"
license=('MIT')
install=xcompose-ansi-keyboard-ptbr.install
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('SKIP')

package() {
    cd "$srcdir/$pkgname-$pkgver"

    install -Dm644 XCompose "$pkgdir/usr/share/$pkgname/XCompose"
    install -Dm755 install.sh "$pkgdir/usr/share/$pkgname/install.sh"
    install -Dm755 uninstall.sh "$pkgdir/usr/share/$pkgname/uninstall.sh"
    install -Dm644 README.md "$pkgdir/usr/share/$pkgname/README.md"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
