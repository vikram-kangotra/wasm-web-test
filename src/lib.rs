extern "C" {
    fn alert(s: &str);
}

#[no_mangle]
pub extern "C" fn call_custom_alert() {
    unsafe {
        alert("Hello");
    }
}
