set -x
# $1: device for output
#     spk: stereo speaker
#     top-spk: top speaker
#     bot-spk: bottom speaker
#     rcv: receiver
#     spk_hp: speaker high power
#     top-spk_hp: top speaker high power
#     bot-spk_hp: bottom speaker high power
#     rcv_hp: headphone
#     us: ultrasound

# tinyplay file.wav [-D card] [-d device] [-p period_size] [-n n_periods]
# sample usage: playback.sh spk
# rcv.wav:-4.32dbfs   top spk: -9.26dbfs spk: -8.32dbfs  ultra: -4.32dbfs  spk_hp:-4.8dbfs

function enable_receiver
{
    echo "enabling receiver"
    tinymix 'TERT_TDM_RX_0 Audio Mixer MultiMedia1' 1
    tinymix 'TERT_TDM_RX_0 SampleRate' 'KHZ_96'
    tinymix 'TERT_TDM_RX_0 Channels' 'One'
    tinymix 'TERT_TDM_RX_0 Format' 'S24_LE'
    tinymix 'RCV PCM Source' 'ASP'
    tinymix 'RCV AMP PCM Gain' 0
    tinymix 'RCV DRE DRE Switch' 1
    tinymix 'RCV ASP TX1 Source' 'Zero'
    tinymix 'RCV ASP TX2 Source' 'DSPTX1'
    tinymix 'RCV DSP RX1 Source' 'ASPRX1'
    tinymix 'RCV DSP RX2 Source' 'ASPRX2'
    tinymix 'RCV ASPRX1 Slot Position' '0'
    tinymix 'RCV ASPRX2 Slot Position' '2'
    sleep 1
}

function disable_receiver
{
    echo "disabling receiver"
    tinymix 'TERT_TDM_RX_0 Audio Mixer MultiMedia1' 0
    tinymix 'TERT_TDM_RX_0 SampleRate' 'KHZ_96'
    tinymix 'TERT_TDM_RX_0 Channels' 'Two'
    tinymix 'TERT_TDM_RX_0 Format' 'S24_LE'
    tinymix 'RCV PCM Source' 'None'
    tinymix 'RCV AMP PCM Gain' 16
    tinymix 'RCV DRE DRE Switch' 0
    tinymix 'RCV ASP TX1 Source' 'Zero'
    tinymix 'RCV ASP TX2 Source' 'Zero'
    tinymix 'RCV DSP RX1 Source' 'Zero'
    tinymix 'RCV DSP RX2 Source' 'Zero'
}

function enable_speaker
{
    echo "enabling speaker"
    tinymix 'TERT_TDM_RX_0 Audio Mixer MultiMedia1' 1
    tinymix 'TERT_TDM_RX_0 SampleRate' 'KHZ_96'
    tinymix 'TERT_TDM_RX_0 Channels' 'Two'
    tinymix 'TERT_TDM_RX_0 Format' 'S24_LE'
    tinymix 'PCM Source' 'ASP'
    tinymix 'RCV PCM Source' 'ASP'
    tinymix 'AMP PCM Gain' 16
    tinymix 'RCV AMP PCM Gain' 16
    tinymix 'DRE DRE Switch' 1
    tinymix 'RCV DRE DRE Switch' 1
    tinymix 'DSP RX1 Source' 'ASPRX1'
    tinymix 'DSP RX2 Source' 'ASPRX1'
    tinymix 'ASPRX1 Slot Position' '1'
    tinymix 'ASPRX2 Slot Position' '4'
    tinymix 'RCV DSP RX1 Source' 'ASPRX1'
    tinymix 'RCV DSP RX2 Source' 'ASPRX2'
    tinymix 'RCV ASPRX1 Slot Position' '0'
    tinymix 'RCV ASPRX2 Slot Position' '2'
    tinymix 'ASP TX1 Source' 'DSPTX1'
    tinymix 'ASP TX2 Source' 'Zero'
    tinymix 'RCV ASP TX1 Source' 'Zero'
    tinymix 'RCV ASP TX2 Source' 'DSPTX1'
    sleep 1
}

function disable_speaker
{
    echo "disabling speaker"
    tinymix 'Cirrus SP Usecase Config' 'Music'
    #TODO: use DSP after pa fw loaded
    #tinymix 'PCM Source' 'DSP'
    tinymix 'PCM Source' 'None'
    tinymix 'RCV PCM Source' 'None'
    tinymix 'AMP PCM Gain' 16
    tinymix 'RCV AMP PCM Gain' 16
    tinymix 'TERT_TDM_RX_0 Audio Mixer MultiMedia1' 0
    tinymix 'TERT_TDM_RX_0 SampleRate' 'KHZ_96'
    tinymix 'TERT_TDM_RX_0 Channels' 'Two'
    tinymix 'TERT_TDM_RX_0 Format' 'S24_LE'
    tinymix 'DRE DRE Switch' 0
    tinymix 'RCV DRE DRE Switch' 0
    tinymix 'DSP RX1 Source' 'Zero'
    tinymix 'DSP RX2 Source' 'Zero'
    tinymix 'RCV DSP RX1 Source' 'Zero'
    tinymix 'RCV DSP RX2 Source' 'Zero'
    tinymix 'ASP TX1 Source' 'Zero'
    tinymix 'ASP TX2 Source' 'Zero'
    tinymix 'RCV ASP TX1 Source' 'Zero'
    tinymix 'RCV ASP TX2 Source' 'Zero'
}

function enable_speaker_top
{
    echo "enabling speaker top"
    tinymix 'TERT_TDM_RX_0 Audio Mixer MultiMedia1' 1
    tinymix 'TERT_TDM_RX_0 SampleRate' 'KHZ_96'
    tinymix 'TERT_TDM_RX_0 Channels' 'One'
    tinymix 'TERT_TDM_RX_0 Format' 'S24_LE'
    tinymix 'PCM Source' 'None'
    tinymix 'RCV PCM Source' 'ASP'
    tinymix 'RCV AMP PCM Gain' 16
    tinymix 'RCV DRE DRE Switch' 1
    tinymix 'RCV ASP TX1 Source' 'Zero'
    tinymix 'RCV ASP TX2 Source' 'DSPTX1'
    tinymix 'RCV DSP RX1 Source' 'ASPRX1'
    tinymix 'RCV DSP RX2 Source' 'ASPRX2'
    tinymix 'RCV ASPRX1 Slot Position' '0'
    tinymix 'RCV ASPRX2 Slot Position' '2'
    sleep 1
}

function disable_speaker_top
{
    echo "disabling speaker top"
    tinymix 'Cirrus SP Usecase Config' 'Music'
    #TODO: use DSP after pa fw loaded
    #tinymix 'PCM Source' 'DSP'
    tinymix 'PCM Source' 'None'
    tinymix 'RCV PCM Source' 'None'
    tinymix 'RCV AMP PCM Gain' 16
    tinymix 'TERT_TDM_RX_0 Audio Mixer MultiMedia1' 0
    tinymix 'TERT_TDM_RX_0 SampleRate' 'KHZ_96'
    tinymix 'TERT_TDM_RX_0 Channels' 'Two'
    tinymix 'TERT_TDM_RX_0 Format' 'S24_LE'
    tinymix 'RCV DRE DRE Switch' 0
    tinymix 'RCV ASP TX1 Source' 'Zero'
    tinymix 'RCV ASP TX2 Source' 'Zero'
    tinymix 'RCV DSP RX1 Source' 'Zero'
    tinymix 'RCV DSP RX2 Source' 'Zero'
}

function enable_speaker_bot
{
    echo "enabling speaker bottom"
    tinymix 'TERT_TDM_RX_0 Audio Mixer MultiMedia1' 1
    tinymix 'TERT_TDM_RX_0 SampleRate' 'KHZ_96'
    tinymix 'TERT_TDM_RX_0 Channels' 'Two'
    tinymix 'TERT_TDM_RX_0 Format' 'S24_LE'
    tinymix 'PCM Source' 'ASP'
    tinymix 'RCV PCM Source' 'None'
    tinymix 'AMP PCM Gain' 16
    tinymix 'DRE DRE Switch' 1
    tinymix 'DSP RX1 Source' 'ASPRX1'
    tinymix 'DSP RX2 Source' 'ASPRX1'
    tinymix 'ASPRX1 Slot Position' '1'
    tinymix 'ASPRX2 Slot Position' '4'
    tinymix 'ASP TX1 Source' 'DSPTX1'
    tinymix 'ASP TX2 Source' 'Zero'

    sleep 1
}

function disable_speaker_bot
{
    echo "disabling speaker bottom"
    tinymix 'Cirrus SP Usecase Config' 'Music'
    #TODO: use DSP after pa fw loaded
    #tinymix 'PCM Source' 'DSP'
    tinymix 'PCM Source' 'None'
    tinymix 'RCV PCM Source' 'None'
    tinymix 'AMP PCM Gain' 16
    tinymix 'TERT_TDM_RX_0 Audio Mixer MultiMedia1' 0
    tinymix 'TERT_TDM_RX_0 SampleRate' 'KHZ_96'
    tinymix 'TERT_TDM_RX_0 Channels' 'Two'
    tinymix 'TERT_TDM_RX_0 Format' 'S24_LE'
    tinymix 'DRE DRE Switch' 0
    tinymix 'DSP RX1 Source' 'Zero'
    tinymix 'DSP RX2 Source' 'Zero'
    tinymix 'ASP TX1 Source' 'Zero'
    tinymix 'ASP TX2 Source' 'Zero'
}

function enable_headphone
{
    echo "enabling headphone"
    tinymix 'RX_CDC_DMA_RX_0 Audio Mixer MultiMedia1' 1
    tinymix 'RX_MACRO RX0 MUX' 'AIF1_PB'
    tinymix 'RX_MACRO RX1 MUX' 'AIF1_PB'
    tinymix 'RX_CDC_DMA_RX_0 Channels' 'Two'
    tinymix 'RX INT0_1 MIX1 INP0' 'RX0'
    tinymix 'RX INT1_1 MIX1 INP0' 'RX1'
    tinymix 'RX INT0 DEM MUX' 'CLSH_DSM_OUT'
    tinymix 'RX INT1 DEM MUX' 'CLSH_DSM_OUT'
    tinymix 'RX_HPH_PWR_MODE' 'LOHIFI'
    tinymix 'RX HPH Mode' 'CLS_H_LOHIFI'
    tinymix 'RX_COMP1 Switch' 1
    tinymix 'RX_COMP2 Switch' 1
    tinymix 'HPHL_COMP Switch' 1
    tinymix 'HPHR_COMP Switch' 1
    tinymix 'HPHL_RDAC Switch' 1
    tinymix 'HPHR_RDAC Switch' 1
}

function disable_headphone
{
    echo "disabling headphone"
    tinymix 'RX_CDC_DMA_RX_0 Audio Mixer MultiMedia1' 0
    tinymix 'RX_MACRO RX0 MUX' 'ZERO'
    tinymix 'RX_MACRO RX1 MUX' 'ZERO'
    tinymix 'RX_CDC_DMA_RX_0 Channels' 'One'
    tinymix 'RX INT0_1 MIX1 INP0' 'ZERO'
    tinymix 'RX INT1_1 MIX1 INP0' 'ZERO'
    tinymix 'RX INT0 DEM MUX' 'NORMAL_DSM_OUT'
    tinymix 'RX INT1 DEM MUX' 'NORMAL_DSM_OUT'
    tinymix 'RX_COMP1 Switch' 0
    tinymix 'RX_COMP2 Switch' 0
    tinymix 'HPHL_COMP Switch' 0
    tinymix 'HPHR_COMP Switch' 0
    tinymix 'HPHL_RDAC Switch' 0
    tinymix 'HPHR_RDAC Switch' 0
}

function enable_ultrasound
{
    echo "enable ultrasound"
    tinymix 'TERT_TDM_RX_1 Audio Mixer MultiMedia1' 1
    tinymix 'TERT_TDM_RX_1 SampleRate' 'KHZ_96'
    tinymix 'TERT_TDM_RX_1 Format' 'S24_LE'
    tinymix 'TERT_TDM_RX_1 Channels' 'One'
    tinymix 'PCM Source' 'None'
    tinymix 'RCV PCM Source' 'DSP'
    tinymix 'RCV AMP PCM Gain' 0
    tinymix 'RCV DRE DRE Switch' 1
    tinymix 'RCV ASP TX1 Source' 'Zero'
    tinymix 'RCV ASP TX2 Source' 'DSPTX1'
    tinymix 'RCV DSP RX1 Source' 'ASPRX1'
    tinymix 'RCV DSP RX2 Source' 'ASPRX2'
    tinymix 'RCV ASPRX1 Slot Position' '0'
    tinymix 'RCV ASPRX2 Slot Position' '2'
    sleep 1
}

function disable_ultrasound
{
    echo "disable ultrasound"
    tinymix 'Cirrus SP Usecase Config' 'Music'
    tinymix 'PCM Source' 'None'
    tinymix 'RCV PCM Source' 'None'
    tinymix 'RCV AMP PCM Gain' 16
    tinymix 'RCV DRE DRE Switch' 0
    tinymix 'TERT_TDM_RX_1 Audio Mixer MultiMedia1' 0
    tinymix 'RCV ASP TX1 Source' 'Zero'
    tinymix 'RCV ASP TX2 Source' 'Zero'
    tinymix 'RCV DSP RX1 Source' 'Zero'
    tinymix 'RCV DSP RX2 Source' 'Zero'
}

if [ "$1" = "spk" ]; then
    enable_speaker
    filename=/vendor/etc/spk.wav
elif [ "$1" = "top-spk" ]; then
    enable_speaker_top
    filename=/vendor/etc/top_spk.wav
elif [ "$1" = "bot-spk" ]; then
    enable_speaker_bot
    filename=/vendor/etc/bottom_spk.wav
elif [ "$1" = "rcv" ]; then
    enable_receiver
    filename=/vendor/etc/rcv.wav
elif [ "$1" = "spk_hp" ]; then
    enable_speaker
    filename=/vendor/etc/spk_hp.wav
elif [ "$1" = "top-spk_hp" ]; then
    enable_speaker_top
    filename=/vendor/etc/top_spk.wav
elif [ "$1" = "bot-spk_hp" ]; then
    enable_speaker_bot
    filename=/vendor/etc/bottom_spk_hp.wav
elif [ "$1" = "rcv_hp" ]; then
    enable_headphone
    filename=/vendor/etc/rcv.wav
elif [ "$1" = "us" ]; then
    enable_ultrasound
    filename=/vendor/etc/ultrasound.wav
else
    echo "Usage: playback.sh device; device: spk or rcv or spk_hp or us"
fi

echo "start playing"
tinyplay $filename

if [ "$1" = "spk" ]; then
    disable_speaker
elif [ "$1" = "top-spk" ]; then
    disable_speaker_top
elif [ "$1" = "bot-spk" ]; then
    disable_speaker_bot
elif [ "$1" = "rcv" ]; then
    disable_receiver
elif [ "$1" = "spk_hp" ]; then
    disable_speaker
elif [ "$1" = "top-spk_hp" ]; then
    disable_speaker_top
elif [ "$1" = "bot-spk_hp" ]; then
    disable_speaker_bot
elif [ "$1" = "rcv_hp" ]; then
    disable_headphone
elif [ "$1" = "us" ]; then
    disable_ultrasound
fi

exit 0
