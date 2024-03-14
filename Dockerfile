FROM verdaccio/verdaccio:5

USER root

ENV NODE_ENV=production

# RUN yarn && yarn add verdaccio-memory

COPY ./.verdaccio/config.yaml /verdaccio/conf

ENV $VERDACCIO_PORT=$PORT

USER verdaccio
# Important step, $PORT is provided by heroku while verdaccio uses $VERDACCIO_PORT, we need to override it
# CMD $VERDACCIO_APPDIR/bin/verdaccio --config /verdaccio/conf/config.yaml --listen $VERDACCIO_PROTOCOL://0.0.0.0:$PORT

CMD node -r  $VERDACCIO_APPDIR/bin/verdaccio --config /verdaccio/conf/config.yaml --listen $VERDACCIO_PROTOCOL://0.0.0.0:$PORT
