FROM node:lts-alpine

# Set environment variables
ENV XBROWSERSYNC_API_VERSION master

WORKDIR /usr/src/xbs-api

# Download release and unpack
RUN wget -q -O release.tar.gz https://github.com/tbjers/xbs-api/archive/refs/heads/$XBROWSERSYNC_API_VERSION.tar.gz \
	&& tar -C . -xzf release.tar.gz \
	&& rm release.tar.gz \
	&& mv xbs-api-$XBROWSERSYNC_API_VERSION/* . \
	&& rm -rf xbs-api-$XBROWSERSYNC_API_VERSION/

# Install dependencies
RUN npm install --only=production

# Expose port and start api
EXPOSE 8080
CMD [ "node", "dist/api.js"]
