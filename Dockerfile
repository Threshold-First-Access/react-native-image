FROM circleci/android:api-25-alpha

USER root

RUN curl -sL https://deb.nodesource.com/setup_8.x | bash -

RUN apt-get install nodejs build-essential make

RUN npm install -g react-native-cli

USER circleci

RUN sdkmanager "build-tools;23.0.1"

RUN sdkmanager "platforms;android-23"

USER root

RUN chown -R circleci:circleci /home/circleci/.npm

USER circleci