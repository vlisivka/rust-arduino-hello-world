#![no_std]
#![no_main]

extern crate avr_std_stub;
use arduino_uno::prelude::*;
use ufmt;

#[arduino_uno::entry]
fn main() -> ! {
    let peripherals = arduino_uno::Peripherals::take().unwrap();
    let mut pins = arduino_uno::Pins::new(peripherals.PORTB, peripherals.PORTC, peripherals.PORTD);

    // Led for blinking
    let mut led = pins.d13.into_output(&mut pins.ddr);

    // Seial port pins for logs
    let serial_rx = pins.d0;
    let serial_tx = pins.d1.into_output(&mut pins.ddr);

    // Configure USART to run at 115200 bauds
    let mut serial = arduino_uno::Serial::new(peripherals.USART0, serial_rx, serial_tx, 115200.into_baudrate());


    loop {
        // Write message to USART.
//        ufmt::uwriteln!(&mut serial, "Hello, world from {}!\r", "Arduino").void_unwrap();
        ufmt::uwriteln!(&mut serial, "Hello, world!\r").void_unwrap();

        // Blink led, to see is program working
        led.toggle().void_unwrap();

        arduino_uno::delay_ms(500);
    }
}
