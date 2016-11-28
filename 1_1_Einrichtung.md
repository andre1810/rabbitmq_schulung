# Einrichtung

1. Virtual Box installieren: https://www.virtualbox.org/wiki/Downloads
2. vagrant installieren: https://www.vagrantup.com/downloads.html
3. landrush (Lokaler DNS Server für vagrant VM´s) installieren: `vagrant plugin install landrush`
4. Debian 8 (jessie) Box hinzufügen: `vagrant box add debian/jessie64`

# Test der Umgebung

- Virtual Box installiert? `vboxmanage -v` -> `4.3.26r98988`
- Vagrant installiert? `vagrant -v` -> `Vagrant 1.8.7`
- Landrush installiert? `vagrant plugin list | grep "landrush"` -> `landrush (1.1.2)`
- Debian 8 Vagrant Box installiert? `vagrant box list | grep "debian/jessie"` -> `debian/jessie64 (virtualbox, 8.6.1)`
- VM erreichbar -> `ping rabbit01.vagrant.test`:
  ```
  PING rabbit01.vagrant.test (192.168.33.101): 56 data bytes
  64 bytes from 192.168.33.101: icmp_seq=0 ttl=64 time=0.289 ms
  ...
  ```

# Landrush unter Mac OS X

- [How to avoid providing sudo password on OS X](https://github.com/vagrant-landrush/landrush/blob/master/doc/Troubleshooting.adoc#how-to-avoid-providing-sudo-password-on-os-x)

# Vagrant Referenz

- VM starten: `vagrant up`
- VM neustarten: `vagrant reload`
- VM beenden: `vagrant halt`
- VM löschen: `vagrant destroy`
- Per SSH in VM einloggen: `vagrant ssh`
- VM Status anzeigen: `vagrant status`
