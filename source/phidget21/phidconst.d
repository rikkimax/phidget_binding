/**
 * This file is part of libphidget21
 *
 * Copyright 2006-2015 Phidgets Inc <patrick@phidgets.com>
 *
 * This library is free software; you can redistribute it and/or
 * modify it under the terms of the GNU Lesser General Public
 * License as published by the Free Software Foundation; either
 * version 3 of the License, or (at your option) any later version.
 *
 * This library is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
 * Lesser General Public License for more details.
 *
 * You should have received a copy of the GNU Lesser General Public
 * License along with this library; if not, see 
 * <http://www.gnu.org/licenses/>
 */
module phidget21.phidconst;

extern(C) __gshared {
	/**
	 * Phidget device class uniquely identifies a class of Phidgets.
	 */
	enum CPhidget_DeviceClass {
		PHIDCLASS_ACCELEROMETER = 2,			/**< Phidget Accelerometer */
		PHIDCLASS_ADVANCEDSERVO = 3,			/**< Phidget Advanced Servo */
		PHIDCLASS_ANALOG = 22,					/**< Phidget Analog */
		PHIDCLASS_BRIDGE = 23,					/**< Phidget Bridge */
		PHIDCLASS_ENCODER = 4,					/**< Phidget Encoder */
		PHIDCLASS_FREQUENCYCOUNTER = 21,		/**< Phidget Frequency Counter */
		PHIDCLASS_GPS = 5,						/**< Phidget GPS */
		PHIDCLASS_INTERFACEKIT = 7,				/**< Phidget Interface Kit */
		PHIDCLASS_IR = 19,						/**< Phidget IR */
		PHIDCLASS_LED = 8,						/**< Phidget LED */
		PHIDCLASS_MOTORCONTROL = 9,				/**< Phidget Motor Control */
		PHIDCLASS_PHSENSOR = 10,				/**< Phidget PH Sensor */
		PHIDCLASS_RFID = 11,					/**< Phidget RFID */
		PHIDCLASS_SERVO = 12,					/**< Phidget Servo */
		PHIDCLASS_SPATIAL = 20,				/**< Phidget Spatial */
		PHIDCLASS_STEPPER = 13,				/**< Phidget Stepper */
		PHIDCLASS_TEMPERATURESENSOR = 14,		/**< Phidget Temperature Sensor */
		PHIDCLASS_TEXTLCD = 15,				/**< Phidget TextLCD */
		PHIDCLASS_TEXTLED = 16,				/**< Phidget TextLED */
		PHIDCLASS_WEIGHTSENSOR = 17,			/**< Phidget Weight Sensor */
	}
	
	/**
	 * Phidget device id uniquely identifies a specific type of Phidget.
	 */
	enum CPhidget_DeviceID {
		/* These are all current devices */
		PHIDID_ACCELEROMETER_3AXIS = 0x07E, /**< Phidget 3-axis Accelerometer (1059) */
		PHIDID_ADVANCEDSERVO_1MOTOR = 0x082, /**< Phidget 1 Motor Advanced Servo (1066) */
		PHIDID_ADVANCEDSERVO_8MOTOR = 0x03A, /**< Phidget 8 Motor Advanced Servo (1061) */
		PHIDID_ANALOG_4OUTPUT = 0x037, /**< Phidget Analog 4-output (1002) */
		PHIDID_BIPOLAR_STEPPER_1MOTOR = 0x07B, /**< Phidget 1 Motor Bipolar Stepper Controller with 4 Digital Inputs (1063) */
		PHIDID_BRIDGE_4INPUT = 0x03B, /**< Phidget Bridge 4-input (1046) */
		PHIDID_ENCODER_1ENCODER_1INPUT = 0x04B, /**< Phidget Encoder - Mechanical (1052) */
		PHIDID_ENCODER_HS_1ENCODER = 0x080, /**< Phidget High Speed Encoder (1057) */
		PHIDID_ENCODER_HS_4ENCODER_4INPUT = 0x04F, /**< Phidget High Speed Encoder - 4 Encoder (1047) */
		PHIDID_FREQUENCYCOUNTER_2INPUT = 0x035, /**< Phidget Frequency Counter 2-input (1054) */
		PHIDID_GPS = 0x079, /**< Phidget GPS (1040) */
		PHIDID_INTERFACEKIT_0_0_4 = 0x040, /**< Phidget Interface Kit 0/0/4 (1014) */
		PHIDID_INTERFACEKIT_0_0_8 = 0x081, /**< Phidget Interface Kit 0/0/8 (1017) */
		PHIDID_INTERFACEKIT_0_16_16 = 0x044, /**< Phidget Interface Kit 0/16/16 (1012) */
		PHIDID_INTERFACEKIT_2_2_2 = 0x036, /**< Phidget Interface Kit 2/2/2 (1011) */
		PHIDID_INTERFACEKIT_8_8_8 = 0x045, /**< Phidget Interface Kit 8/8/8 (1013, 1018, 1019) */
		PHIDID_INTERFACEKIT_8_8_8_w_LCD = 0x07D, /**< Phidget Interface Kit 8/8/8 with TextLCD (1201, 1202, 1203) */
		PHIDID_IR = 0x04D, /**< Phidget IR Receiver Transmitter (1055) */
		PHIDID_LED_64_ADV = 0x04C, /**< Phidget LED 64 Advanced (1031) */
		PHIDID_LINEAR_TOUCH = 0x076, /**< Phidget Linear Touch (1015) */
		PHIDID_MOTORCONTROL_1MOTOR = 0x03E, /**< Phidget 1 Motor Motor Controller (1065) */
		PHIDID_MOTORCONTROL_HC_2MOTOR = 0x059, /**< Phidget 2 Motor High Current Motor Controller (1064) */
		PHIDID_RFID_2OUTPUT = 0x031, /**< Phidget RFID with Digital Outputs and Onboard LED (1023) */
		PHIDID_RFID_2OUTPUT_READ_WRITE = 0x034, /**< Phidget RFID with R/W support (1024) */
		PHIDID_ROTARY_TOUCH = 0x077, /**< Phidget Rotary Touch (1016) */
		PHIDID_SPATIAL_ACCEL_3AXIS = 0x07F, /**< Phidget Spatial 3-axis accel (1049, 1041, 1043) */
		PHIDID_SPATIAL_ACCEL_GYRO_COMPASS = 0x033, /**< Phidget Spatial 3/3/3 (1056, 1042, 1044) */
		PHIDID_TEMPERATURESENSOR = 0x070, /**< Phidget Temperature Sensor (1051) */
		PHIDID_TEMPERATURESENSOR_4 = 0x032, /**< Phidget Temperature Sensor 4-input (1048) */
		PHIDID_TEMPERATURESENSOR_IR = 0x03C, /**< Phidget Temperature Sensor IR (1045) */
		PHIDID_TEXTLCD_2x20_w_8_8_8 = 0x17D, /**< Phidget TextLCD with Interface Kit 8/8/8 (1201, 1202, 1203) */
		PHIDID_TEXTLCD_ADAPTER = 0x03D, /**< Phidget TextLCD Adapter (1204) */
		PHIDID_UNIPOLAR_STEPPER_4MOTOR = 0x07A, /**< Phidget 4 Motor Unipolar Stepper Controller (1062) */
		
		/* These are all past devices (no longer sold) */
		PHIDID_ACCELEROMETER_2AXIS = 0x071, /**< Phidget 2-axis Accelerometer (1053, 1054) */
		PHIDID_INTERFACEKIT_0_8_8_w_LCD = 0x053, /**< Phidget Interface Kit 0/8/8 with TextLCD (1219, 1220, 1221) */
		PHIDID_INTERFACEKIT_4_8_8 = 4, /**< Phidget Interface Kit 4/8/8 */
		PHIDID_LED_64 = 0x04A, /**< Phidget LED 64 (1030) */
		PHIDID_MOTORCONTROL_LV_2MOTOR_4INPUT = 0x058, /**< Phidget 2 Motor Low Voltage Motor Controller with 4 Digital Inputs (1060) */
		PHIDID_PHSENSOR = 0x074, /**< Phidget PH Sensor (1058) */
		PHIDID_RFID = 0x030, /**< Phidget RFID without Digital Outputs */
		PHIDID_SERVO_1MOTOR = 0x039, /**< Phidget 1 Motor Servo Controller (1000) */
		PHIDID_SERVO_1MOTOR_OLD = 2, /**< Phidget 1 Motor Servo Controller - Old Version */
		PHIDID_SERVO_4MOTOR = 0x038, /**< Phidget 4 Motor Servo Controller (1001) */
		PHIDID_SERVO_4MOTOR_OLD = 3, /**< Phidget 4 Motor Servo Controller - Old Version */
		PHIDID_TEXTLCD_2x20 = 0x052, /**< Phidget TextLCD without Interface Kit (1210) */
		PHIDID_TEXTLCD_2x20_w_0_8_8 = 0x153, /**< Phidget TextLCD with Interface Kit 0/8/8 (1219, 1220, 1221) */
		PHIDID_TEXTLED_1x8 = 0x049, /**< Phidget TextLED 1x8 */
		PHIDID_TEXTLED_4x8 = 0x048, /**< Phidget TextLED 4x8 (1040) */
		PHIDID_WEIGHTSENSOR = 0x072, /**< Phidget Weight Sensor (1050) */
		/* Device in firmware upgrade mode */
		PHIDID_FIRMWARE_UPGRADE = 0x098,
	}
}