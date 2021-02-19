set -x
# $1: wave file to write
# $2: audio source
#     0: default
#     1: main mic
#     2: top mic
#     3: back mic
#     4: front mic
# $3: sample rate(Hz)
# $4: sample bit
# $5: channel number
# $6: capture duration(s)
# tinycap file.wav [-D card] [-d device] [-c channels] [-r rate] [-b bits] [-p period_size] [-n n_periods] [-t duration]
# sample usage: capture_audio.sh /data/test1.wav 1 48000 16 2 10

sleep 3
rate=KHZ_48


function enable_headset_mic
{
    echo "enabling headset mic"
    tinymix "TX_DEC0 Volume" "84"
    tinymix "TX DEC0 MUX" "SWR_MIC"
    tinymix "TX SMIC MUX0" "ADC2"
    tinymix "TX_CDC_DMA_TX_4 Channels" "One"
    tinymix "TX_AIF2_CAP Mixer DEC0" "1"
    tinymix "DEC0_BCS Switch" "1"
    tinymix "ADC2_MIXER Switch" "1"
    tinymix "ADC2 MUX" "INP2"
}

function disable_headset_mic
{
    echo "disabling headset mic"
    tinymix "TX DEC0 MUX" "MSM_DMIC"
    tinymix "TX SMIC MUX0" "ZERO"
    tinymix "TX_CDC_DMA_TX_4 Channels" "One"
    tinymix "TX_AIF2_CAP Mixer DEC0" "1"
    tinymix "DEC0_BCS Switch" "0"
    tinymix "ADC2_MIXER Switch" "1"
    tinymix "ADC2 MUX" "INP3"
}

# setup
tinymix 'MultiMedia1 Mixer TX_CDC_DMA_TX_4' "1"
tinymix 'TX_CDC_DMA_TX_4 SampleRate' $rate

enable_headset_mic

# start recording
tinycap /data/headset_mic.wav -r 48000 -b 16 -T 10

disable_headset_mic

tinymix 'MultiMedia1 Mixer TX_CDC_DMA_TX_4' "0"
tinymix 'TX_CDC_DMA_TX_4 SampleRate' 'KHZ_48'
