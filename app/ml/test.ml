let on_device_ready () =
  let sim = Cordova_sim_card.t () in
  sim#request_read_permission ();
  let on_info_succ result =
    Jsoo_lib.alert
      (result#carrier_name ^ "\n " ^
      result#country_code ^ "\n " ^
      result#mcc ^ "\n " ^
      result#mnc ^ "\n " ^
      result#phone_number ^ "\n " ^
      result#device_id ^ "\n " ^
      result#device_software_version ^ "\n " ^
      result#sim_serial_number ^ "\n " ^
      result#subscriber_id)
      (*result#call_state ^ " " ^*)
      (*result#data_activity ^ " " ^*)
      (*result#network_type ^ " " ^*)
      (*result#phone_type ^ " " ^*)
      (*result#sim_state ^ " " ^*)
      (*result#is_network_roaming ^ " " ^*)
  in
  let on_info_err r =
    Jsoo_lib.alert r
  in
  sim#info on_info_succ on_info_err

let _ =
  Cordova.Event.device_ready on_device_ready
