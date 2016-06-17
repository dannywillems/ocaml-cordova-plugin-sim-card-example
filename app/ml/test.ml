let on_device_ready () =
  let on_info_succ result =
    Jsoo_lib.alert
    (
      (Cordova_sim_card.carrier_name result) ^ "\n " ^
      (Cordova_sim_card.country_code result) ^ "\n " ^
      (Cordova_sim_card.mcc result) ^ "\n " ^
      (Cordova_sim_card.mnc result) ^ "\n " ^
      (Cordova_sim_card.phone_number result) ^ "\n " ^
      (Cordova_sim_card.device_id result) ^ "\n " ^
      (Cordova_sim_card.device_software_version result) ^ "\n " ^
      (Cordova_sim_card.sim_serial_number result) ^ "\n " ^
      (Cordova_sim_card.subscriber_id result)
      (*
      (Cordova_sim_card.call_state result) ^ "\n" ^
      (Cordova_sim_card.data_activity result) ^ "\n" ^
      (Cordova_sim_card.network_type result) ^ " " ^
      (Cordova_sim_card.phone_type result) ^ "\n" ^
      (Cordova_sim_card.sim_state result) ^ "\n" ^
      (Cordova_sim_card.is_network_roaming result);
      *)
    )
  in
  let on_info_err r =
    Jsoo_lib.alert r
  in
  Cordova_sim_card.request_read_permission ();
  Cordova_sim_card.info on_info_succ on_info_err

let _ =
  Cordova.Event.device_ready on_device_ready
