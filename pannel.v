module pannel (
	input  PLD_MCLK,
	// EPL interface
	input  EPL_RESETN,	
	output EPL_RSTOUT,	
	input  EPL_SCLK,	
	inout  EPL_SDI,	
	inout  EPL_SDO,		
	inout  EPL_SLE,		
	inout  EPL_SRDY,	
	
	output LCD_ENBL,
	output LCD_BL_PWM,
	output LCD_BL_EN,
	
	input  BUT_UP,
	input  BUT_DN,
	input  BUT_LFT,
	input  BUT_RHT,
	input  BUT_ENT,
	input  BUT_ESC,
	input  [5:0] BUT_ST,

	input  BUT_REX1,
	input  BUT_REX2,
	input  BUT_DN_RIN1,
	input  BUT_DN_RIN2,
	input  BUT_DN_RINk,
	
	input  TS_NINTRQ,
	output TS_SPI_SDO,
	input  TS_BUSY,
	input  TS_SPI_SDI,
	input  TS_SPI_CSN,
	input  TS_SPI_SCLK,
	
	output LED_G3,
	output LED_B3,
	output LED_R3,
	
	output LED_G2,
	output LED_B2,
	output LED_R2,
	
	output LED_G1,
	output LED_B1,
	output LED_R1,
	
	output LED_G0,
	output LED_B0,
	output LED_R0
);
   assign LCD_BL_EN = 1'b1;
	assign LCD_BL_PWM = 1'b0;
	assign LCD_ENBL = 1'b1;

	qsys u0 (
        .qsys_serial_host_0_sdo   (EPL_SDO),      // qsys_serial_host_0.sdo
        .qsys_serial_host_0_sdi   (EPL_SDI),     //                   .sdi
        .qsys_serial_host_0_clk   (EPL_SCLK),    //                   .clk
        .qsys_serial_host_0_sle   (EPL_SLE),     //                   .sle
        .qsys_serial_host_0_srdy  (EPL_SRDY),    //                   .srdy
        .qsys_serial_host_0_reset (!EPL_RESETN), //                   .reset
		  
		  .fan_motor_driver_0_export (), // fan_motor_driver_0.export
        		  
        .position_encoder_0_A     (),     // position_encoder_0.A
        .position_encoder_0_B     (),     //                   .B
        .position_encoder_0_Z     (),     //                   .Z
        .position_encoder_1_A     (),     // position_encoder_1.A
        .position_encoder_1_B     (),     //                   .B
        .position_encoder_1_Z     (),      //                   .Z
		  
		  .pio32_0_P1                (),                //            pio32_0.P1
        .pio32_0_P2                (),                //                   .P2
        .pio32_0_P3                (),                //                   .P3
        .pio32_0_P4                (),                //                   .P4
        .pio32_0_P5                (),                //                   .P5
        .pio32_0_P6                (),                //                   .P6
        .pio32_0_P7                (),                //                   .P7
        .pio32_0_P8                (),                //                   .P8
        .pio32_0_P9                (),                //                   .P9
        .pio32_0_P10               (),               //                   .P10
        .pio32_0_P11               (),               //                   .P11
        .pio32_0_P12               (),               //                   .P12
        .pio32_0_P13               (),               //                   .P13
        .pio32_0_P14               (),               //                   .P14
        .pio32_0_P15               (),               //                   .P15
        .pio32_0_P16               (),               //                   .P16
        .pio32_0_P17               (),               //                   .P17
        .pio32_0_P18               (),               //                   .P18
        .pio32_0_P19               (),               //                   .P19
        .pio32_0_P20               (),               //                   .P20
        .pio32_0_P21               (),               //                   .P21
        .pio32_0_P22               (),               //                   .P22
        .pio32_0_P23               (),               //                   .P23
        .pio32_0_P24               (),               //                   .P24
        .pio32_0_P25               (),               //                   .P25
        .pio32_0_P26               (),               //                   .P26
        .pio32_0_P27               (),               //                   .P27
        .pio32_0_P28               (),               //                   .P28
        .pio32_0_P29               (),               //                   .P29
        .pio32_0_P30               (),               //                   .P30
        .pio32_0_P31               (),               //                   .P31
        .pio32_0_P0                ()                 //                   .P0
    );

	
endmodule