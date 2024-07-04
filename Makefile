copy-config:
	rm -rf ~/dev/zmk/app/boards/shields/swoop
	cp -r ~/dev/corne-swoop/config/boards/shields/swoop ~/dev/zmk/app/boards/shields/

build-right:
	make copy-config
	rm -rf ./build
	( cd ~/dev/zmk/app && west build --pristine --build-dir ~/dev/corne-swoop/build/right \
	--board nice_nano_v2 -- -DSHIELD=swoop_right -DZMK_CONFIG="/root/dev/corne-swoop/config" )
	rm -rf ~/dev/corne-swoop/swoop_right.uf2
	cp ~/dev/corne-swoop/build/right/zephyr/zmk.uf2 ~/dev/corne-swoop/swoop_right.uf2

build-left:
	make copy-config
	rm -rf ./build
	( cd ~/dev/zmk/app && west build --pristine --build-dir ~/dev/corne-swoop/build/left --board nice_nano_v2 -- -DSHIELD=swoop_left -DZMK_CONFIG="/root/dev/corne-swoop/config/" )
	rm -rf ~/dev/corne-swoop/swoop_left.uf2
	cp ~/dev/corne-swoop/build/left/zephyr/zmk.uf2 ~/dev/corne-swoop/swoop_left.uf2
