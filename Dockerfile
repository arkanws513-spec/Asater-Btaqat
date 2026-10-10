FROM nginx:1.28-alpine

COPY nginx.conf /etc/nginx/conf.d/default.conf
# Copy only public runtime assets; never expose repository metadata, docs, or CI files.
COPY index.html modes.css modes.js duel.css duel.js /usr/share/nginx/html/

EXPOSE 80

HEALTHCHECK --interval=30s --timeout=3s --start-period=5s --retries=3 \
  CMD wget -q -O /dev/null http://127.0.0.1/ || exit 1
