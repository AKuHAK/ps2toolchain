dist: xenial
addons:
  apt:
    packages:
      - texinfo patch wget make git 
      - libc6-dev zlib1g zlib1g-dev libucl1 libucl-dev
      - libmpc-dev libmpfr-dev libgmp-dev
      - pigz pv

sudo: required
language: cpp

before_script:
  - export PS2DEV=~/ps2dev
  - export PS2SDK=${PS2DEV}/ps2sdk
  - export PATH=${PATH}:${PS2DEV}/bin:${PS2DEV}/ee/bin:${PS2DEV}/iop/bin:${PS2DEV}/dvp/bin:${PS2SDK}/bin
  - echo $(nproc)
  - gcc -v && g++ -v

script:
# - travis_wait 60 bash ./toolchain.sh > /tmp/PS2TOOLCHAIN.log 2>&1
# - curl --upload-file /tmp/PS2TOOLCHAIN.log https://transfer.sh/PS2TOOLCHAIN${TRAVIS_BUILD_NUMBER}.log
  - bash ./toolchain.sh 1
  - travis_wait 50 bash ./toolchain.sh 2
  - ./toolchain.sh 3
  - travis_wait 50 bash ./toolchain.sh 4
  - bash ./toolchain.sh 5
  - bash ./toolchain.sh 6

after_success:
  - cd $(PS2SDK) && make -C samples
  - zip -r samples_$TRAVIS_COMMIT.zip samples
  - curl --upload-file samples_$TRAVIS_COMMIT.zip https://transfer.sh/samples_$TRAVIS_COMMIT.zip | grep transfer
  