FROM node:20-bullseye

# Install required packages
RUN apt-get update && \
    apt-get install -y \
        ffmpeg \
        imagemagick \
        webp && \
    rm -rf /var/lib/apt/lists/*

WORKDIR /app

COPY package.json .

# Install dependencies
RUN npm install && npm install -g qrcode-terminal pm2

COPY . .

EXPOSE 3000

CMD ["npm", "start"]
