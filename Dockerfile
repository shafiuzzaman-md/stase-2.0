# Transfer from docker image file of cclyzer++.

# Image with all cclyzer++ development tools, i.e., everything needed by
# cclyzer++ developers to build and test cclyzer++.

#ARG UBUNTU_NAME=jammy
#ARG UBUNTU_VERSION=22.04
#FROM ubuntu:$UBUNTU_VERSION as dev
# See the documentation for supported versions.
#
# See NOTE[Clang+LLVM] in ci.yml.
#
# TODO(#12, #113): Upgrade to Clang 15, LLVM 15.
# We use clang/llvm 14
FROM ubuntu:22.04 as dev
ARG CLANG_VERSION=14
ARG LLVM_MAJOR_VERSION=14
# ARG EDK2_DIRECTORY="code.iti.illinois.edu/harden/harden-ta3-cromulence/phase2_demo2/demo2_edk2.git"
# https://docs.docker.com/engine/reference/builder/#understand-how-arg-and-from-interact
#ARG UBUNTU_NAME
#ARG UBUNTU_VERSION
SHELL ["/bin/bash", "-c", "-o", "pipefail"]
ENV DEBIAN_FRONTEND=noninteractive



RUN mkdir /harden
WORKDIR /harden



# 
RUN apt-get update && \
    apt-get --yes install --no-install-recommends \
    # Self-needed
    cmake ssh gzip gnupg ninja-build python3 python3-pip libboost-system-dev libboost-filesystem-dev libboost-iostreams-dev libboost-program-options-dev ruby wget zip unzip rsync libxext-dev patch vim\
    # Needed by eval1_instruction
    git gcc g++ make uuid-dev python-is-python3 build-essential nasm iasl libx11-dev libxv-dev gdb gcc-aarch64-linux-gnu libncurses-dev autoconf libssl-dev qemu-system-x86


RUN wget --no-verbose https://souffle-lang.github.io/ppa/souffle-key.public -O /usr/share/keyrings/souffle-archive-keyring.gpg && \
    echo "deb [signed-by=/usr/share/keyrings/souffle-archive-keyring.gpg] https://souffle-lang.github.io/ppa/ubuntu/ stable main" | tee /etc/apt/sources.list.d/souffle.list && \
    apt-get update && \
    apt-get --yes install --no-install-recommends souffle=2.3
RUN apt-get --yes install --no-install-recommends \
    clang-${CLANG_VERSION} \
    clang-format-${CLANG_VERSION} \
    clang-tidy-${CLANG_VERSION} \
    libomp-${CLANG_VERSION}-dev \
    lld-${LLVM_MAJOR_VERSION} \
    llvm-${LLVM_MAJOR_VERSION} \
    llvm-${LLVM_MAJOR_VERSION}-dev

RUN update-alternatives --install /usr/bin/c++ c++ /usr/bin/clang++-${CLANG_VERSION} 100 && \
    update-alternatives --install /usr/bin/cc cc /usr/bin/clang-${CLANG_VERSION} 100 && \
    update-alternatives --install /usr/bin/clang++ clang++ /usr/bin/clang++-${CLANG_VERSION} 100 && \
    update-alternatives --install /usr/bin/clang clang /usr/bin/clang-${CLANG_VERSION} 100 && \
    update-alternatives --install /usr/bin/opt opt /usr/bin/opt-${LLVM_MAJOR_VERSION} 100 && \
    update-alternatives --install /usr/bin/llc llc /usr/bin/llc-${LLVM_MAJOR_VERSION} 100 && \
    update-alternatives --install /usr/bin/lld lld /usr/bin/lld-${LLVM_MAJOR_VERSION} 100 && \
    update-alternatives --install /usr/bin/lld-link lld-link /usr/bin/lld-link-${LLVM_MAJOR_VERSION} 100 && \
    update-alternatives --install /usr/bin/llvm-ar llvm-ar /usr/bin/llvm-ar-${LLVM_MAJOR_VERSION} 100 && \
    update-alternatives --install /usr/bin/llvm-config llvm-config /usr/bin/llvm-config-${LLVM_MAJOR_VERSION} 100 && \
    update-alternatives --install /usr/bin/llvm-lib llvm-lib /usr/bin/llvm-lib-${LLVM_MAJOR_VERSION} 100 && \
    update-alternatives --install /usr/bin/llvm-rc llvm-rc /usr/bin/llvm-rc-${LLVM_MAJOR_VERSION} 100 && \
    update-alternatives --install /usr/bin/llvm-dis llvm-dis /usr/bin/llvm-dis-${LLVM_MAJOR_VERSION} 100 && \
    rm -rf /var/lib/apt/lists/*
RUN gem install fpm -v 1.14.2
RUN pip install \ mypy==0.982 \
    pytest==7.1.3 \
    pytest-xdist==2.5.0 \
    llvmlite==0.40.1 \
    pandas==2.2.3

RUN git clone https://github.com/GaloisInc/cclyzerpp.git && \
    cd cclyzerpp && git checkout d095a137891a999d2117fe751d6ac6dc7580f459 && cmake -G Ninja -B build -S . \
    -DLLVM_MAJOR_VERSION=$(llvm-config-${LLVM_MAJOR_VERSION} --version) && \
    cmake --build build -j $(nproc) --target factgen-exe PAPass SoufflePA

ENV PATH="/harden/cclyzerpp/build:${PATH}"

# Install Z3 constraint solver
RUN git clone https://github.com/Z3Prover/z3.git --branch z3-4.13.0 /harden/z3 && \
    cd /harden/z3 && \
    python3 scripts/mk_make.py && \
    cd build && \
    make -j $(nproc) && \
    make install

RUN apt-get update && apt-get install -y \
    build-essential \
    cmake \
    ninja-build\
    curl \
    file \
    g++-multilib \
    gcc-multilib \
    git \
    jq \
    libcap-dev \
    libgoogle-perftools-dev \
    libncurses5-dev \
    libsqlite3-dev \
    libtcmalloc-minimal4 \
    python3-pip \
    unzip \
    graphviz \
    doxygen \
    clang-$LLVM_MAJOR_VERSION \
    llvm-$LLVM_MAJOR_VERSION \
    llvm-$LLVM_MAJOR_VERSION-dev \
    llvm-$LLVM_MAJOR_VERSION-tools \
    python3-tabulate \
    wget


RUN pip3 install lit wllvm

# Build uClibc and the POSIX environment model
RUN git clone https://github.com/klee/klee-uclibc.git /harden/klee-uclibc && \
    cd /harden/klee-uclibc && \
    git checkout 9e464cfbe059f1af981b82bde68bc83274a004de && \
    ./configure --make-llvm-lib --with-cc clang-14 --with-llvm-config llvm-config-14 && \
    make -j2

# Build KLEE
RUN git clone https://github.com/klee/klee.git /harden/klee && \
    cd /harden/klee && \
    git checkout 4a4d75cc1331beae7f7f81b5fbc34caccfa0fa7b && \
    cd ../../ && \
    mkdir /harden/klee_build && \
    cd /harden/klee_build && \
    cmake -DENABLE_SOLVER_Z3=ON -DENABLE_POSIX_RUNTIME=ON -DKLEE_UCLIBC_PATH=/harden/klee-uclibc -DLLVM_CONFIG_BINARY=/usr/bin/llvm-config-14 /harden/klee && \
    make -j $(nproc)

# Add KLEE executables to the PATH
RUN echo 'alias klee="/harden/klee_build/bin/klee"' >> ~/.bashrc && \
    echo 'alias ktest-tool="/harden/klee_build/bin/ktest-tool"' >> ~/.bashrc

# Set up aliases for KLEE commands
RUN ln -s /harden/klee_build/bin/klee /usr/local/bin/klee && \
    ln -s /harden/klee_build/bin/ktest-tool /usr/local/bin/ktest-tool


RUN apt-get install -y \
    flex \
    bison \
    bc \
    libelf-dev

# Install STASE_SYMEX
COPY stase_symex /harden/stase_symex
COPY configs /harden/configs
COPY formatted_output /harden/formatted_output
COPY stase_output /harden/stase_output
COPY include /harden/include
COPY inputs /harden/inputs

COPY eval3_edk2-main /harden/eval3_edk2-main
COPY eval3_linux-main /harden/eval3_linux-main
COPY edk2-testcases-main /harden/edk2-testcases-main
WORKDIR /harden

COPY dynamic_utils_fix.patch /harden/
COPY edk2_compile_bc_script.py /harden/
COPY edk2_run_analysis_script.py /harden/
COPY edk2-standalone.project /harden/
COPY edkfilelist.txt /harden/
COPY kbmi_usb_fix.patch /harden/
COPY linux_compile_bc_script.py /harden/
COPY linux_run_analysis_script.py /harden/
COPY linux-standalone.project /harden/
COPY linuxfilelist.txt /harden/
COPY utils /harden/utils
COPY tools_clang.patch /harden/

COPY kudu-main-ktemp /harden/kudu-main-ktemp
COPY ASU_TESTCASES /harden/ASU_TESTCASES
COPY KUDU_TESTCASES /harden/KUDU_TESTCASES
COPY UCSB_TESTCASES /harden/UCSB_TESTCASES
COPY UCSB_kernel_testcase_script.py /harden/UCSB_kernel_testcase_script.py
COPY UCSB_uefi_testcase_script.py /harden/UCSB_uefi_testcase_script.py
COPY ASU_kernel_testcase_script.py /harden/ASU_kernel_testcase_script.py
COPY KUDU_kernel_testcase_script.py /harden/KUDU_kernel_testcase_script.py

COPY edk2-standalone_backup.project /harden/
COPY linux-standalone_backup.project /harden/
COPY SA_config.py /harden/
COPY SA_interface.py /harden/
COPY filelist.txt /harden/

