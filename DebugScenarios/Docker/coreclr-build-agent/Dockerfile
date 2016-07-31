FROM ubuntu

RUN apt-get update
RUN apt-get install -y --force-yes wget

# https://github.com/dotnet/coreclr/blob/master/Documentation/building/linux-instructions.md
RUN echo "deb http://llvm.org/apt/trusty/ llvm-toolchain-trusty-3.6 main" | tee /etc/apt/sources.list.d/llvm.list
RUN wget -O - http://llvm.org/apt/llvm-snapshot.gpg.key | apt-key add -
RUN apt-get update

RUN apt-get install -y --force-yes cmake
RUN apt-get install -y --force-yes llvm-3.5
RUN apt-get install -y --force-yes clang-3.5
RUN apt-get install -y --force-yes lldb-3.6
RUN apt-get install -y --force-yes lldb-3.6-dev
RUN apt-get install -y --force-yes libunwind8
RUN apt-get install -y --force-yes libunwind8-dev
RUN apt-get install -y --force-yes gettext
RUN apt-get install -y --force-yes libicu-dev
RUN apt-get install -y --force-yes liblttng-ust-dev
RUN apt-get install -y --force-yes libcurl4-openssl-dev
RUN apt-get install -y --force-yes libssl-dev
RUN apt-get install -y --force-yes uuid-dev

RUN sysctl fs.file-max
RUN sysctl -p

RUN apt-get install -y --force-yes git

RUN git clone http://github.com/dotnet/coreclr /usr/src/coreclr
RUN git clone http://github.com/shchahrykovich/ms /usr/src/ms

RUN /usr/src/coreclr/build.sh