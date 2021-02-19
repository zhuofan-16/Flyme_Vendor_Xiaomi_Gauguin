set -x
# teardown headphone
tinymix 'RX INT0_1 MIX1 INP0' 'ZERO'
tinymix 'RX INT1_1 MIX1 INP0' 'ZERO'
tinymix 'RX INT0 DEM MUX' 'NORMAL_DSM_OUT'
tinymix 'RX INT1 DEM MUX' 'NORMAL_DSM_OUT'
tinymix 'RX_HPH_PWR_MODE' 'ULP'
tinymix 'RX HPH Mode' 'CLS_H_ULP'
tinymix 'RX_COMP1 Switch' 0
tinymix 'RX_COMP2 Switch' 0
tinymix 'HPHL_COMP Switch' 0
tinymix 'HPHR_COMP Switch' 0
tinymix 'HPHL_RDAC Switch' 0
tinymix 'HPHR_RDAC Switch' 0
tinymix 'RX_CDC_DMA_RX_0 Channels' 'One'

# teardown mic
tinymix 'TX DEC0 MUX' 'MSM_DMIC'
tinymix 'TX SMIC MUX0' 'ZERO'
tinymix 'TX_AIF1_CAP Mixer DEC0' 0
tinymix "TX_CDC_DMA_TX_4 Channels" "Two"
tinymix "ADC2 MUX" "INP3"
tinymix 'ADC1_MIXER Switch' 1
tinymix 'ADC2_MIXER Switch' 1
tinymix 'IIR0 INP0 MUX' 'ZERO'
tinymix 'IIR0 INP0 Volume' 84
tinymix 'TX_DEC0 Volume' 84
tinymix 'ADC1 Volume' 6
tinymix 'ADC2 Volume' 6