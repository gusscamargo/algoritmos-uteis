#! /bin/bash

# Instale ninja primeiro

# Define a versão do gRPC a ser clonada
RELEASE_TAG="1.57.0"

# Instala as ferramentas necessárias para compilação e outras dependências
sudo apt install -y \
        cmake \
        build-essential \
        autoconf \
        libtool \
        pkg-config \
        clang \
        libc++-dev

# Clona o repositório do gRPC usando a tag de lançamento especificada
git clone -b v$RELEASE_TAG https://github.com/grpc/grpc

# Entra no diretório do projeto clonado
cd grpc

# Atualiza os submódulos do projeto
git submodule update --init

# Cria um diretório para a compilação e entra nele
mkdir -p cmake/build
cd cmake/build

# Configura o projeto usando o CMake
cmake ../.. -GNinja -DCMAKE_BUILD_TYPE=Release

# Compila o projeto
ninja

# Instala o gRPC no sistema
sudo ninja install

# Atualiza as configurações do linker do sistema
sudo ldconfig
