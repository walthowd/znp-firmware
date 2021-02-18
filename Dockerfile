FROM python:buster 

MAINTAINER Walt Howd <walthowd@gmail.com>

WORKDIR /opt/firmware

RUN apt-get update \
  && apt-get install -y git wget jq curl

RUN pip3 install zigpy-znp

RUN pip3 install bellows

RUN mkdir -p /opt/firmware

RUN cd /opt/firmware && git clone https://github.com/JelmerT/cc2538-bsl.git && ln -s /opt/firmware/cc2538-bsl/cc2538-bsl.py /opt/firmware/cc2538-bsl.py

RUN cd /opt/firmware && git clone https://github.com/Koenkk/Z-Stack-firmware 

RUN cd /opt/firmware/Z-Stack-firmware/coordinator/Z-Stack_3.x.0/bin && ls -1 *.zip | xargs -I {} unzip {} && rm -rf *.zip && rm -rf __MACOSX && mv *.hex /opt/firmware

#ADD update-firmware.sh /tmp/silabs
#ADD ncp.py /tmp/silabs
#ADD *.ebl /tmp/silabs/

#CMD /tmp/silabs/update-firmware.sh
