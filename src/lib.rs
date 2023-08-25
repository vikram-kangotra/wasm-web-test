extern "C" {
    fn alert(s: i32);
}

#[no_mangle]
pub extern "C" fn call_custom_alert() {
    unsafe {
        alert(1337);
    }
}
