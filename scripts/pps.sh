#!/bin/bash

DEVFL='/proc/net/dev'
TARGETIF="${IFACE:-eth0}"

function gettx () {
  TXP=$(grep $TARGETIF $DEVFL | awk '{ print $11}')
  TXD=$(grep $TARGETIF $DEVFL | awk '{ print $13}')
  echo $(($TXP - $TXD))
}

function getrx () {
  RXP=$(grep $TARGETIF $DEVFL | awk '{ print $3}')
  RXD=$(grep $TARGETIF $DEVFL | awk '{ print $5}')
  echo $(($RXP - $RXD))
}

TX1=$(gettx)
RX1=$(getrx)

echo -e "DATETIME\t\tTX\tRX"
while true;
do
       sleep 1
       TX2=$(gettx)
       RX2=$(getrx)
       TX_DIFF=$(($TX2 - $TX1))
       RX_DIFF=$(($RX2 - $RX1))
       NOW=$(date +%Y-%m-%d\ %H:%M:%S)
       echo -e "$NOW\t$TX_DIFF\t$RX_DIFF"
       TX1=$TX2
       RX1=$RX2
done
