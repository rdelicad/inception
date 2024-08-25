#!/bin/bash

# Función para instalar Docker
install_docker() {
    echo "Instalando Docker..."
    sudo apt-get update
    sudo apt-get install -y \
        ca-certificates \
        curl \
        gnupg \
        lsb-release

    sudo mkdir -p /etc/apt/keyrings
    curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg

    echo \
      "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu \
      $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

    sudo apt-get update
    sudo apt-get install -y docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin

    echo "Docker instalado correctamente."
}

# Función para instalar la última versión de Docker Compose
install_docker_compose() {
    echo "Instalando la última versión de Docker Compose..."
    
    # Obtener la última versión de Docker Compose desde GitHub
    LATEST_VERSION=$(curl -s https://api.github.com/repos/docker/compose/releases/latest | grep '"tag_name":' | sed -E 's/.*"([^"]+)".*/\1/')

    sudo curl -L "https://github.com/docker/compose/releases/download/${LATEST_VERSION}/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
    sudo chmod +x /usr/local/bin/docker-compose

    # Verifica si /usr/local/bin está en el PATH
    if [[ ":$PATH:" != *":/usr/local/bin:"* ]]; then
        echo "/usr/local/bin no está en el PATH. Añadiendo..."
        echo 'export PATH=$PATH:/usr/local/bin' >> ~/.bashrc
        source ~/.bashrc
    fi

    echo "Docker Compose instalado correctamente."
}

# Función para añadir el usuario al grupo docker
add_user_to_docker_group() {
    echo "Añadiendo al usuario $USER al grupo docker..."
    sudo usermod -aG docker $USER
    echo "Usuario $USER añadido al grupo docker. Necesitas cerrar sesión y volver a iniciarla para que los cambios surtan efecto."
}

# Instalar Docker si no está instalado
if ! command -v docker &> /dev/null
then
    install_docker
else
    echo "Docker ya está instalado."
fi

# Instalar o actualizar Docker Compose
if ! command -v docker-compose &> /dev/null
then
    install_docker_compose
else
    echo "Docker Compose ya está instalado. Actualizando..."
    install_docker_compose
fi

# Añadir usuario al grupo docker
add_user_to_docker_group

echo "Instalación y configuración completada."

