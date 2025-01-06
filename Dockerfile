# Use a imagem oficial do PHP com FPM
FROM php:8.2-fpm

# Instale dependências necessárias
RUN apt-get update && apt-get install -y \
    zip \
    unzip \
    git \
    curl \
    libpng-dev \
    libjpeg-dev \
    libfreetype6-dev \
    libonig-dev \
    libxml2-dev \
    libzip-dev \
    libpq-dev \
    && docker-php-ext-configure gd --with-freetype --with-jpeg \
    && docker-php-ext-install pdo_mysql mbstring exif pcntl bcmath gd zip

# Instale o Composer
COPY --from=composer:2 /usr/bin/composer /usr/bin/composer

# Configure o diretório de trabalho no contêiner
WORKDIR /var/www

# Copie o código do Laravel para o contêiner (se necessário)
COPY . /var/www

# Dê permissão para a pasta storage e cache
RUN chown -R www-data:www-data /var/www \
    && chmod -R 775 /var/www/storage /var/www/bootstrap/cache

# Comando padrão ao iniciar o contêiner
CMD ["php-fpm"]
