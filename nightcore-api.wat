(module
  ;; ---- wasi:http/types ----
  (import "cm32p2|wasi:http/types@0.2" "[constructor]fields"
    (func $fields_new (result i32)))
  (import "cm32p2|wasi:http/types@0.2" "[method]fields.append"
    (func $fields_append (param i32 i32 i32 i32 i32 i32)))
  (import "cm32p2|wasi:http/types@0.2" "[method]fields.get"
    (func $fields_get (param i32 i32 i32 i32)))
  (import "cm32p2|wasi:http/types@0.2" "fields_drop"
    (func $fields_drop (param i32)))
  (import "cm32p2|wasi:http/types@0.2" "[constructor]outgoing-response"
    (func $resp_new (param i32) (result i32)))
  (import "cm32p2|wasi:http/types@0.2" "[method]outgoing-response.set-status-code"
    (func $resp_set_status (param i32 i32) (result i32)))
  (import "cm32p2|wasi:http/types@0.2" "[method]outgoing-response.body"
    (func $resp_body (param i32 i32)))
  (import "cm32p2|wasi:http/types@0.2" "[method]outgoing-body.write"
    (func $body_write (param i32 i32)))
  (import "cm32p2|wasi:http/types@0.2" "[static]outgoing-body.finish"
    (func $body_finish (param i32 i32 i32 i32)))
  (import "cm32p2|wasi:http/types@0.2" "[static]response-outparam.set"
    (func $outparam_set (param i32 i32 i32 i32 i64 i32 i32 i32 i32)))
  (import "cm32p2|wasi:http/types@0.2" "[method]incoming-request.method"
    (func $req_method (param i32 i32)))
  (import "cm32p2|wasi:http/types@0.2" "[method]incoming-request.path-with-query"
    (func $req_path (param i32 i32)))
  (import "cm32p2|wasi:http/types@0.2" "[method]incoming-request.headers"
    (func $req_headers (param i32) (result i32)))
  (import "cm32p2|wasi:http/types@0.2" "incoming-request_drop"
    (func $req_drop (param i32)))

  ;; outgoing requests
  (import "cm32p2|wasi:http/types@0.2" "[constructor]outgoing-request"
    (func $oreq_new (param i32) (result i32)))
  (import "cm32p2|wasi:http/types@0.2" "[method]outgoing-request.body"
    (func $oreq_body (param i32 i32)))
  (import "cm32p2|wasi:http/types@0.2" "[method]outgoing-request.set-method"
    (func $oreq_set_method (param i32 i32 i32 i32) (result i32)))
  (import "cm32p2|wasi:http/types@0.2" "[method]outgoing-request.set-scheme"
    (func $oreq_set_scheme (param i32 i32 i32 i32 i32) (result i32)))
  (import "cm32p2|wasi:http/types@0.2" "[method]outgoing-request.set-authority"
    (func $oreq_set_authority (param i32 i32 i32 i32) (result i32)))
  (import "cm32p2|wasi:http/types@0.2" "[method]outgoing-request.set-path-with-query"
    (func $oreq_set_path (param i32 i32 i32 i32) (result i32)))
  (import "cm32p2|wasi:http/outgoing-handler@0.2" "handle"
    (func $outgoing_handle (param i32 i32 i32 i32)))

  ;; incoming responses
  (import "cm32p2|wasi:http/types@0.2" "[method]future-incoming-response.subscribe"
    (func $fut_subscribe (param i32) (result i32)))
  (import "cm32p2|wasi:http/types@0.2" "[method]future-incoming-response.get"
    (func $fut_get (param i32 i32)))
  (import "cm32p2|wasi:http/types@0.2" "future-incoming-response_drop"
    (func $fut_drop (param i32)))
  (import "cm32p2|wasi:http/types@0.2" "[method]incoming-response.status"
    (func $iresp_status (param i32) (result i32)))
  (import "cm32p2|wasi:http/types@0.2" "[method]incoming-response.consume"
    (func $iresp_consume (param i32 i32)))
  (import "cm32p2|wasi:http/types@0.2" "incoming-response_drop"
    (func $iresp_drop (param i32)))
  (import "cm32p2|wasi:http/types@0.2" "[method]incoming-body.stream"
    (func $ibody_stream (param i32 i32)))
  (import "cm32p2|wasi:http/types@0.2" "incoming-body_drop"
    (func $ibody_drop (param i32)))

  ;; ---- wasi:io ----
  (import "cm32p2|wasi:io/streams@0.2" "[method]output-stream.blocking-write-and-flush"
    (func $stream_write (param i32 i32 i32 i32)))
  (import "cm32p2|wasi:io/streams@0.2" "output-stream_drop"
    (func $stream_drop (param i32)))
  (import "cm32p2|wasi:io/streams@0.2" "[method]input-stream.blocking-read"
    (func $istream_read (param i32 i64 i32)))
  (import "cm32p2|wasi:io/streams@0.2" "input-stream_drop"
    (func $istream_drop (param i32)))
  (import "cm32p2|wasi:io/poll@0.2" "[method]pollable.block"
    (func $pollable_block (param i32)))
  (import "cm32p2|wasi:io/poll@0.2" "pollable_drop"
    (func $pollable_drop (param i32)))

  ;; ---- wasi:cli ----
  (import "cm32p2|wasi:cli/environment@0.2" "get-environment"
    (func $get_environment (param i32)))

  (memory (export "cm32p2_memory") 16)
  ;; ---- string table (generated offsets) ----
  (data (i32.const 1024) "Welcome to the Nightcore.app Patreon service on Wasmtime.")
  (global $S_root i32 (i32.const 1024))
  (global $L_root i32 (i32.const 57))
  (data (i32.const 1088) "not found")
  (global $S_notfound i32 (i32.const 1088))
  (global $L_notfound i32 (i32.const 9))
  (data (i32.const 1104) "{\"message\":\"Bad request\"}")
  (global $S_badreq i32 (i32.const 1104))
  (global $L_badreq i32 (i32.const 25))
  (data (i32.const 1136) "{\"message\":\"Missing environment variable\"}")
  (global $S_err_env i32 (i32.const 1136))
  (global $L_err_env i32 (i32.const 42))
  (data (i32.const 1184) "{\"message\":\"Patreon request failed\"}")
  (global $S_err_up i32 (i32.const 1184))
  (global $L_err_up i32 (i32.const 36))
  (data (i32.const 1224) "content-type")
  (global $S_h_ct i32 (i32.const 1224))
  (global $L_h_ct i32 (i32.const 12))
  (data (i32.const 1240) "text/plain; charset=utf-8")
  (global $S_ct_text i32 (i32.const 1240))
  (global $L_ct_text i32 (i32.const 25))
  (data (i32.const 1272) "application/json; charset=utf-8")
  (global $S_ct_json i32 (i32.const 1272))
  (global $L_ct_json i32 (i32.const 31))
  (data (i32.const 1304) "application/x-www-form-urlencoded")
  (global $S_ct_form i32 (i32.const 1304))
  (global $L_ct_form i32 (i32.const 33))
  (data (i32.const 1344) "access-control-allow-origin")
  (global $S_h_acao i32 (i32.const 1344))
  (global $L_h_acao i32 (i32.const 27))
  (data (i32.const 1376) "access-control-allow-methods")
  (global $S_h_acam i32 (i32.const 1376))
  (global $L_h_acam i32 (i32.const 28))
  (data (i32.const 1408) "access-control-allow-headers")
  (global $S_h_acah i32 (i32.const 1408))
  (global $L_h_acah i32 (i32.const 28))
  (data (i32.const 1440) "vary")
  (global $S_h_vary i32 (i32.const 1440))
  (global $L_h_vary i32 (i32.const 4))
  (data (i32.const 1448) "GET, OPTIONS")
  (global $S_v_methods i32 (i32.const 1448))
  (global $L_v_methods i32 (i32.const 12))
  (data (i32.const 1464) "authorization, content-type")
  (global $S_v_headers i32 (i32.const 1464))
  (global $L_v_headers i32 (i32.const 27))
  (data (i32.const 1496) "origin")
  (global $S_origin i32 (i32.const 1496))
  (global $L_origin i32 (i32.const 6))
  (data (i32.const 1504) "authorization")
  (global $S_h_auth i32 (i32.const 1504))
  (global $L_h_auth i32 (i32.const 13))
  (data (i32.const 1520) "user-agent")
  (global $S_h_ua i32 (i32.const 1520))
  (global $L_h_ua i32 (i32.const 10))
  (data (i32.const 1536) "nightcore-patreon-wasm")
  (global $S_v_ua i32 (i32.const 1536))
  (global $L_v_ua i32 (i32.const 22))
  (data (i32.const 1560) "https://nightcore.app")
  (global $S_o1 i32 (i32.const 1560))
  (global $L_o1 i32 (i32.const 21))
  (data (i32.const 1584) "http://localhost:3000")
  (global $S_o2 i32 (i32.const 1584))
  (global $L_o2 i32 (i32.const 21))
  (data (i32.const 1608) "http://localhost:1337")
  (global $S_o3 i32 (i32.const 1608))
  (global $L_o3 i32 (i32.const 21))
  (data (i32.const 1632) "www.patreon.com")
  (global $S_host i32 (i32.const 1632))
  (global $L_host i32 (i32.const 15))
  (data (i32.const 1648) "/api/oauth2/token")
  (global $S_p_token i32 (i32.const 1648))
  (global $L_p_token i32 (i32.const 17))
  (data (i32.const 1672) "/api/oauth2/v2/identity?fields%5Buser%5D=full_name,image_url")
  (global $S_p_identity i32 (i32.const 1672))
  (global $L_p_identity i32 (i32.const 60))
  (data (i32.const 1736) "/api/oauth2/v2/identity?include=memberships&fields%5Bmember%5D=patron_status,last_charge_date")
  (global $S_p_patron i32 (i32.const 1736))
  (global $L_p_patron i32 (i32.const 93))
  (data (i32.const 1832) "/")
  (global $S_r_root i32 (i32.const 1832))
  (global $L_r_root i32 (i32.const 1))
  (data (i32.const 1840) "/login")
  (global $S_r_login i32 (i32.const 1840))
  (global $L_r_login i32 (i32.const 6))
  (data (i32.const 1848) "/identity")
  (global $S_r_identity i32 (i32.const 1848))
  (global $L_r_identity i32 (i32.const 9))
  (data (i32.const 1864) "/patron")
  (global $S_r_patron i32 (i32.const 1864))
  (global $L_r_patron i32 (i32.const 7))
  (data (i32.const 1872) "code")
  (global $S_q_code i32 (i32.const 1872))
  (global $L_q_code i32 (i32.const 4))
  (data (i32.const 1880) "redirectUri")
  (global $S_q_redirect i32 (i32.const 1880))
  (global $L_q_redirect i32 (i32.const 11))
  (data (i32.const 1896) "PATREON_CLIENT_ID")
  (global $S_e_client_id i32 (i32.const 1896))
  (global $L_e_client_id i32 (i32.const 17))
  (data (i32.const 1920) "PATREON_CLIENT_SECRET")
  (global $S_e_client_secret i32 (i32.const 1920))
  (global $L_e_client_secret i32 (i32.const 21))
  (data (i32.const 1944) "PATREON_MOCK_ACTIVE")
  (global $S_e_mock_active i32 (i32.const 1944))
  (global $L_e_mock_active i32 (i32.const 19))
  (data (i32.const 1968) "code=")
  (global $S_f_code i32 (i32.const 1968))
  (global $L_f_code i32 (i32.const 5))
  (data (i32.const 1976) "&redirect_uri=")
  (global $S_f_redirect i32 (i32.const 1976))
  (global $L_f_redirect i32 (i32.const 14))
  (data (i32.const 1992) "&grant_type=authorization_code&client_id=")
  (global $S_f_grant i32 (i32.const 1992))
  (global $L_f_grant i32 (i32.const 41))
  (data (i32.const 2040) "&client_secret=")
  (global $S_f_secret i32 (i32.const 2040))
  (global $L_f_secret i32 (i32.const 15))
  (data (i32.const 2056) "\"patron_status\":\"active_patron\"")
  (global $S_active i32 (i32.const 2056))
  (global $L_active i32 (i32.const 31))

  ;; ---- state ----
  (global $heap (mut i32) (i32.const 65536))
  (global $origin_ptr (mut i32) (i32.const 0))
  (global $origin_len (mut i32) (i32.const 0))
  (global $auth_ptr (mut i32) (i32.const 0))
  (global $auth_len (mut i32) (i32.const 0))
  (global $env_ptr (mut i32) (i32.const 0))
  (global $env_n (mut i32) (i32.const 0))
  (global $resp_len (mut i32) (i32.const 0))
  (global $r_status (mut i32) (i32.const 404))
  (global $r_ptr (mut i32) (i32.const 0))
  (global $r_len (mut i32) (i32.const 0))
  (global $r_json (mut i32) (i32.const 0))

  (func (export "cm32p2_realloc")
    (param $old i32) (param $old_size i32) (param $align i32) (param $new_size i32)
    (result i32)
    (local $ptr i32)
    (local.set $ptr
      (i32.and
        (i32.add (global.get $heap) (i32.sub (local.get $align) (i32.const 1)))
        (i32.xor (i32.sub (local.get $align) (i32.const 1)) (i32.const -1))))
    (global.set $heap (i32.add (local.get $ptr) (local.get $new_size)))
    (if (i32.gt_u (global.get $heap) (i32.const 1048576)) (then unreachable))
    (if (local.get $old)
      (then (memory.copy (local.get $ptr) (local.get $old)
        (select (local.get $old_size) (local.get $new_size)
          (i32.lt_u (local.get $old_size) (local.get $new_size))))))
    (local.get $ptr))

  (func $memeq (param $a i32) (param $b i32) (param $n i32) (result i32)
    (local $i i32)
    (loop $l
      (if (i32.ge_u (local.get $i) (local.get $n)) (then (return (i32.const 1))))
      (if (i32.ne (i32.load8_u (i32.add (local.get $a) (local.get $i)))
                  (i32.load8_u (i32.add (local.get $b) (local.get $i))))
        (then (return (i32.const 0))))
      (local.set $i (i32.add (local.get $i) (i32.const 1)))
      (br $l))
    (i32.const 0))

  (func $put (param $dst i32) (param $src i32) (param $n i32) (result i32)
    (memory.copy (local.get $dst) (local.get $src) (local.get $n))
    (i32.add (local.get $dst) (local.get $n)))

  (func $hex (param $c i32) (result i32)
    (if (i32.and (i32.ge_u (local.get $c) (i32.const 48)) (i32.le_u (local.get $c) (i32.const 57)))
      (then (return (i32.sub (local.get $c) (i32.const 48)))))
    (if (i32.and (i32.ge_u (local.get $c) (i32.const 65)) (i32.le_u (local.get $c) (i32.const 70)))
      (then (return (i32.sub (local.get $c) (i32.const 55)))))
    (if (i32.and (i32.ge_u (local.get $c) (i32.const 97)) (i32.le_u (local.get $c) (i32.const 102)))
      (then (return (i32.sub (local.get $c) (i32.const 87)))))
    (i32.const -1))

  (func $find (param $h i32) (param $hn i32) (param $nd i32) (param $nn i32) (result i32)
    (local $i i32)
    (if (i32.gt_u (local.get $nn) (local.get $hn)) (then (return (i32.const 0))))
    (loop $l
      (if (i32.gt_u (local.get $i) (i32.sub (local.get $hn) (local.get $nn))) (then (return (i32.const 0))))
      (if (call $memeq (i32.add (local.get $h) (local.get $i)) (local.get $nd) (local.get $nn))
        (then (return (i32.add (local.get $h) (local.get $i)))))
      (local.set $i (i32.add (local.get $i) (i32.const 1)))
      (br $l))
    (i32.const 0))

  (func $is_route (param $p i32) (param $n i32) (param $r i32) (param $rn i32) (result i32)
    (if (i32.lt_u (local.get $n) (local.get $rn)) (then (return (i32.const 0))))
    (if (i32.eqz (call $memeq (local.get $p) (local.get $r) (local.get $rn))) (then (return (i32.const 0))))
    (if (i32.eq (local.get $n) (local.get $rn)) (then (return (i32.const 1))))
    (i32.eq (i32.load8_u (i32.add (local.get $p) (local.get $rn))) (i32.const 0x3f)))

  (func $origin_allowed (result i32)
    (local $p i32) (local $n i32)
    (local.set $p (global.get $origin_ptr)) (local.set $n (global.get $origin_len))
    (if (i32.eqz (local.get $p)) (then (return (i32.const 0))))
    (if (i32.and (i32.eq (local.get $n) (global.get $L_o1)) (call $memeq (local.get $p) (global.get $S_o1) (local.get $n))) (then (return (i32.const 1))))
    (if (i32.and (i32.eq (local.get $n) (global.get $L_o2)) (call $memeq (local.get $p) (global.get $S_o2) (local.get $n))) (then (return (i32.const 1))))
    (if (i32.and (i32.eq (local.get $n) (global.get $L_o3)) (call $memeq (local.get $p) (global.get $S_o3) (local.get $n))) (then (return (i32.const 1))))
    (i32.const 0))

  ;; Copy one request header value into stable guest memory. Returning pointers into
  ;; the fields.get list is not safe after the fields resource is dropped.
  (func $read_header_copy (param $req i32) (param $name i32) (param $name_len i32) (param $dst i32) (param $max i32) (result i32)
    (local $fields i32) (local $list i32) (local $src i32) (local $len i32)
    (local.set $fields (call $req_headers (local.get $req)))
    (call $fields_get (local.get $fields) (local.get $name) (local.get $name_len) (i32.const 0x100))
    (if (i32.load (i32.const 0x104))
      (then
        (local.set $list (i32.load (i32.const 0x100)))
        (local.set $src (i32.load (local.get $list)))
        (local.set $len (i32.load offset=4 (local.get $list)))
        (if (i32.le_u (local.get $len) (local.get $max))
          (then
            (memory.copy (local.get $dst) (local.get $src) (local.get $len))
            (call $fields_drop (local.get $fields))
            (return (local.get $len))))))
    (call $fields_drop (local.get $fields))
    (i32.const 0))

  (func $getenv (param $name i32) (param $name_len i32) (result i32 i32)
    (local $i i32) (local $e i32)
    (block $out
      (loop $l
        (br_if $out (i32.ge_u (local.get $i) (global.get $env_n)))
        (local.set $e (i32.add (global.get $env_ptr) (i32.mul (local.get $i) (i32.const 16))))
        (if (i32.and (i32.eq (i32.load offset=4 (local.get $e)) (local.get $name_len))
                     (call $memeq (i32.load (local.get $e)) (local.get $name) (local.get $name_len)))
          (then (return (i32.load offset=8 (local.get $e)) (i32.load offset=12 (local.get $e)))))
        (local.set $i (i32.add (local.get $i) (i32.const 1)))
        (br $l)))
    (i32.const 0) (i32.const 0))

  (func $reply (param $status i32) (param $ptr i32) (param $len i32) (param $json i32)
    (global.set $r_status (local.get $status))
    (global.set $r_ptr (local.get $ptr))
    (global.set $r_len (local.get $len))
    (global.set $r_json (local.get $json)))

  ;; Extract query parameter into decoded buffer. Returns decoded len, or -1 when absent/malformed.
  (func $query_decode (param $path i32) (param $plen i32) (param $name i32) (param $nlen i32) (param $dst i32) (result i32)
    (local $q i32) (local $p i32) (local $end i32) (local $ks i32) (local $ke i32) (local $vs i32) (local $ve i32) (local $d i32) (local $c i32) (local $h1 i32) (local $h2 i32)
    (local.set $end (i32.add (local.get $path) (local.get $plen)))
    (local.set $q (local.get $path))
    (block $qdone
      (loop $qscan
        (br_if $qdone (i32.ge_u (local.get $q) (local.get $end)))
        (if (i32.eq (i32.load8_u (local.get $q)) (i32.const 0x3f))
          (then (br $qdone)))
        (local.set $q (i32.add (local.get $q) (i32.const 1)))
        (br $qscan)))
    (if (i32.ge_u (local.get $q) (local.get $end)) (then (return (i32.const -1))))
    (local.set $p (i32.add (local.get $q) (i32.const 1)))
    (loop $params
      (if (i32.ge_u (local.get $p) (local.get $end)) (then (return (i32.const -1))))
      (local.set $ks (local.get $p))
      (local.set $ke (local.get $p))
      (block $kend
        (loop $kscan
          (br_if $kend (i32.ge_u (local.get $ke) (local.get $end)))
          (local.set $c (i32.load8_u (local.get $ke)))
          (br_if $kend (i32.or (i32.eq (local.get $c) (i32.const 0x3d)) (i32.eq (local.get $c) (i32.const 0x26))))
          (local.set $ke (i32.add (local.get $ke) (i32.const 1)))
          (br $kscan)))
      (if (i32.and (i32.eq (i32.sub (local.get $ke) (local.get $ks)) (local.get $nlen))
                   (call $memeq (local.get $ks) (local.get $name) (local.get $nlen)))
        (then
          (if (i32.or (i32.ge_u (local.get $ke) (local.get $end)) (i32.ne (i32.load8_u (local.get $ke)) (i32.const 0x3d)))
            (then (return (i32.const -1))))
          (local.set $vs (i32.add (local.get $ke) (i32.const 1)))
          (local.set $ve (local.get $vs))
          (block $vend
            (loop $vscan
              (br_if $vend (i32.ge_u (local.get $ve) (local.get $end)))
              (br_if $vend (i32.eq (i32.load8_u (local.get $ve)) (i32.const 0x26)))
              (local.set $ve (i32.add (local.get $ve) (i32.const 1)))
              (br $vscan)))
          (local.set $d (local.get $dst))
          (local.set $p (local.get $vs))
          (loop $dec
            (if (i32.ge_u (local.get $p) (local.get $ve)) (then (return (i32.sub (local.get $d) (local.get $dst)))))
            (local.set $c (i32.load8_u (local.get $p)))
            (if (i32.eq (local.get $c) (i32.const 0x2b))
              (then (i32.store8 (local.get $d) (i32.const 0x20)) (local.set $d (i32.add (local.get $d) (i32.const 1))) (local.set $p (i32.add (local.get $p) (i32.const 1))) (br $dec)))
            (if (i32.eq (local.get $c) (i32.const 0x25))
              (then
                (if (i32.gt_u (i32.add (local.get $p) (i32.const 3)) (local.get $ve)) (then (return (i32.const -1))))
                (local.set $h1 (call $hex (i32.load8_u (i32.add (local.get $p) (i32.const 1)))))
                (local.set $h2 (call $hex (i32.load8_u (i32.add (local.get $p) (i32.const 2)))))
                (if (i32.or (i32.lt_s (local.get $h1) (i32.const 0)) (i32.lt_s (local.get $h2) (i32.const 0))) (then (return (i32.const -1))))
                (i32.store8 (local.get $d) (i32.or (i32.shl (local.get $h1) (i32.const 4)) (local.get $h2)))
                (local.set $d (i32.add (local.get $d) (i32.const 1)))
                (local.set $p (i32.add (local.get $p) (i32.const 3)))
                (br $dec)))
            (i32.store8 (local.get $d) (local.get $c))
            (local.set $d (i32.add (local.get $d) (i32.const 1)))
            (local.set $p (i32.add (local.get $p) (i32.const 1)))
            (br $dec))))
      ;; skip to next param
      (local.set $p (local.get $ke))
      (block $skipdone
        (loop $skip
          (br_if $skipdone (i32.ge_u (local.get $p) (local.get $end)))
          (if (i32.eq (i32.load8_u (local.get $p)) (i32.const 0x26))
            (then (local.set $p (i32.add (local.get $p) (i32.const 1))) (br $skipdone)))
          (local.set $p (i32.add (local.get $p) (i32.const 1)))
          (br $skip)))
      (br $params))
    (i32.const -1))

  (func $form_enc (param $dst i32) (param $src i32) (param $len i32) (result i32)
    (local $i i32) (local $c i32) (local $hi i32) (local $lo i32)
    (loop $l
      (if (i32.ge_u (local.get $i) (local.get $len)) (then (return (local.get $dst))))
      (local.set $c (i32.load8_u (i32.add (local.get $src) (local.get $i))))
      (if (i32.or (i32.or (i32.and (i32.ge_u (local.get $c) (i32.const 48)) (i32.le_u (local.get $c) (i32.const 57)))
                         (i32.and (i32.ge_u (local.get $c) (i32.const 65)) (i32.le_u (local.get $c) (i32.const 90))))
                  (i32.or (i32.and (i32.ge_u (local.get $c) (i32.const 97)) (i32.le_u (local.get $c) (i32.const 122)))
                          (i32.or (i32.eq (local.get $c) (i32.const 45)) (i32.or (i32.eq (local.get $c) (i32.const 46)) (i32.or (i32.eq (local.get $c) (i32.const 95)) (i32.eq (local.get $c) (i32.const 42)))))))
        (then (i32.store8 (local.get $dst) (local.get $c)) (local.set $dst (i32.add (local.get $dst) (i32.const 1))))
        (else
          (if (i32.eq (local.get $c) (i32.const 32))
            (then (i32.store8 (local.get $dst) (i32.const 43)) (local.set $dst (i32.add (local.get $dst) (i32.const 1))))
            (else
              (local.set $hi (i32.shr_u (local.get $c) (i32.const 4)))
              (local.set $lo (i32.and (local.get $c) (i32.const 15)))
              (i32.store8 (local.get $dst) (i32.const 37))
              (i32.store8 (i32.add (local.get $dst) (i32.const 1)) (i32.add (select (i32.const 55) (i32.const 48) (i32.gt_u (local.get $hi) (i32.const 9))) (local.get $hi)))
              (i32.store8 (i32.add (local.get $dst) (i32.const 2)) (i32.add (select (i32.const 55) (i32.const 48) (i32.gt_u (local.get $lo) (i32.const 9))) (local.get $lo)))
              (local.set $dst (i32.add (local.get $dst) (i32.const 3)))))))
      (local.set $i (i32.add (local.get $i) (i32.const 1)))
      (br $l))
    (local.get $dst))

  ;; ======================= outgoing HTTP =======================

  ;; Request to Patreon. method: 0=GET, 2=POST. ctype 1 adds form content-type. auth 1 forwards incoming authorization.
  (func $patreon_req (param $method i32) (param $path i32) (param $path_len i32) (param $body i32) (param $body_len i32) (param $ctype i32) (param $auth i32)
    (result i32)
    (local $fields i32) (local $req i32) (local $obody i32) (local $stream i32)
    (local $fut i32) (local $pol i32) (local $resp i32) (local $status i32)
    (local $ibody i32) (local $istream i32) (local $off i32) (local $n i32)

    (global.set $resp_len (i32.const 0))
    (local.set $fields (call $fields_new))
    (call $fields_append (local.get $fields)
      (global.get $S_h_ua) (global.get $L_h_ua)
      (global.get $S_v_ua) (global.get $L_v_ua) (i32.const 0x40))
    (if (local.get $ctype)
      (then
        (call $fields_append (local.get $fields)
          (global.get $S_h_ct) (global.get $L_h_ct)
          (global.get $S_ct_form) (global.get $L_ct_form) (i32.const 0x40))))
    (if (i32.and (local.get $auth) (i32.ne (global.get $auth_ptr) (i32.const 0)))
      (then
        (call $fields_append (local.get $fields)
          (global.get $S_h_auth) (global.get $L_h_auth)
          (global.get $auth_ptr) (global.get $auth_len) (i32.const 0x40))))

    (local.set $req (call $oreq_new (local.get $fields)))
    (drop (call $oreq_set_method (local.get $req) (local.get $method) (i32.const 0) (i32.const 0)))
    (drop (call $oreq_set_scheme (local.get $req) (i32.const 1) (i32.const 1) (i32.const 0) (i32.const 0)))
    (drop (call $oreq_set_authority (local.get $req) (i32.const 1) (global.get $S_host) (global.get $L_host)))
    (drop (call $oreq_set_path (local.get $req) (i32.const 1) (local.get $path) (local.get $path_len)))

    (if (local.get $body_len)
      (then
        (call $oreq_body (local.get $req) (i32.const 0x40))
        (local.set $obody (i32.load (i32.const 0x44)))))

    (call $outgoing_handle (local.get $req) (i32.const 0) (i32.const 0) (i32.const 0x40))
    (if (i32.load8_u (i32.const 0x40)) (then (return (i32.const 0))))
    (local.set $fut (i32.load (i32.const 0x48)))

    (if (local.get $body_len)
      (then
        (call $body_write (local.get $obody) (i32.const 0x40))
        (local.set $stream (i32.load (i32.const 0x44)))
        (call $stream_write (local.get $stream) (local.get $body) (local.get $body_len) (i32.const 0x40))
        (call $stream_drop (local.get $stream))
        (call $body_finish (local.get $obody) (i32.const 0) (i32.const 0) (i32.const 0x40))))

    (local.set $pol (call $fut_subscribe (local.get $fut)))
    (call $pollable_block (local.get $pol))
    (call $pollable_drop (local.get $pol))

    (call $fut_get (local.get $fut) (i32.const 0x40))
    (if (i32.eqz (i32.load8_u (i32.const 0x40))) (then (return (i32.const 0))))
    (if (i32.load8_u (i32.const 0x48)) (then (return (i32.const 0))))
    (if (i32.load8_u (i32.const 0x50)) (then (return (i32.const 0))))
    (local.set $resp (i32.load (i32.const 0x58)))
    (local.set $status (call $iresp_status (local.get $resp)))

    (call $iresp_consume (local.get $resp) (i32.const 0x40))
    (local.set $ibody (i32.load (i32.const 0x44)))
    (call $ibody_stream (local.get $ibody) (i32.const 0x40))
    (local.set $istream (i32.load (i32.const 0x44)))
    (block $eof
      (loop $rd
        (call $istream_read (local.get $istream) (i64.const 4096) (i32.const 0x40))
        (br_if $eof (i32.load8_u (i32.const 0x40)))
        (local.set $n (i32.load (i32.const 0x48)))
        (br_if $eof (i32.gt_u (i32.add (local.get $off) (local.get $n)) (i32.const 32768)))
        (memory.copy (i32.add (i32.const 0x4000) (local.get $off)) (i32.load (i32.const 0x44)) (local.get $n))
        (local.set $off (i32.add (local.get $off) (local.get $n)))
        (br $rd)))
    (global.set $resp_len (local.get $off))

    (call $istream_drop (local.get $istream))
    (call $ibody_drop (local.get $ibody))
    (call $iresp_drop (local.get $resp))
    (call $fut_drop (local.get $fut))
    (local.get $status))

  ;; ======================= route handlers =======================

  (func $do_login (param $path i32) (param $len i32)
    (local $code_len i32) (local $redir_len i32) (local $id_ptr i32) (local $id_len i32) (local $sec_ptr i32) (local $sec_len i32)
    (local $d i32) (local $st i32)
    (local.set $code_len (call $query_decode (local.get $path) (local.get $len) (global.get $S_q_code) (global.get $L_q_code) (i32.const 0x3000)))
    (local.set $redir_len (call $query_decode (local.get $path) (local.get $len) (global.get $S_q_redirect) (global.get $L_q_redirect) (i32.const 0x3400)))
    (if (i32.or (i32.lt_s (local.get $code_len) (i32.const 0)) (i32.lt_s (local.get $redir_len) (i32.const 0)))
      (then (return (call $reply (i32.const 400) (global.get $S_badreq) (global.get $L_badreq) (i32.const 1)))))
    (call $getenv (global.get $S_e_client_id) (global.get $L_e_client_id))
    (local.set $id_len) (local.set $id_ptr)
    (call $getenv (global.get $S_e_client_secret) (global.get $L_e_client_secret))
    (local.set $sec_len) (local.set $sec_ptr)
    (if (i32.or (i32.eqz (local.get $id_ptr)) (i32.eqz (local.get $sec_ptr)))
      (then (return (call $reply (i32.const 500) (global.get $S_err_env) (global.get $L_err_env) (i32.const 1)))))

    (local.set $d (call $put (i32.const 0x2000) (global.get $S_f_code) (global.get $L_f_code)))
    (local.set $d (call $form_enc (local.get $d) (i32.const 0x3000) (local.get $code_len)))
    (local.set $d (call $put (local.get $d) (global.get $S_f_redirect) (global.get $L_f_redirect)))
    (local.set $d (call $form_enc (local.get $d) (i32.const 0x3400) (local.get $redir_len)))
    (local.set $d (call $put (local.get $d) (global.get $S_f_grant) (global.get $L_f_grant)))
    (local.set $d (call $form_enc (local.get $d) (local.get $id_ptr) (local.get $id_len)))
    (local.set $d (call $put (local.get $d) (global.get $S_f_secret) (global.get $L_f_secret)))
    (local.set $d (call $form_enc (local.get $d) (local.get $sec_ptr) (local.get $sec_len)))

    (local.set $st (call $patreon_req (i32.const 2) (global.get $S_p_token) (global.get $L_p_token)
      (i32.const 0x2000) (i32.sub (local.get $d) (i32.const 0x2000)) (i32.const 1) (i32.const 0)))
    (if (i32.eqz (local.get $st))
      (then (return (call $reply (i32.const 502) (global.get $S_err_up) (global.get $L_err_up) (i32.const 1)))))
    (call $reply (local.get $st) (i32.const 0x4000) (global.get $resp_len) (i32.const 1)))

  (func $do_identity
    (local $st i32)
    (local.set $st (call $patreon_req (i32.const 0) (global.get $S_p_identity) (global.get $L_p_identity)
      (i32.const 0) (i32.const 0) (i32.const 0) (i32.const 1)))
    (if (i32.eqz (local.get $st))
      (then (return (call $reply (i32.const 502) (global.get $S_err_up) (global.get $L_err_up) (i32.const 1)))))
    (call $reply (local.get $st) (i32.const 0x4000) (global.get $resp_len) (i32.const 1)))

  (func $do_patron
    (local $st i32) (local $mock_ptr i32) (local $mock_len i32)
    (call $getenv (global.get $S_e_mock_active) (global.get $L_e_mock_active))
    (local.set $mock_len) (local.set $mock_ptr)
    (if (i32.and (i32.ne (local.get $mock_ptr) (i32.const 0)) (i32.ne (local.get $mock_len) (i32.const 0)))
      (then (return (call $reply (i32.const 204) (i32.const 0) (i32.const 0) (i32.const 0)))))
    (local.set $st (call $patreon_req (i32.const 0) (global.get $S_p_patron) (global.get $L_p_patron)
      (i32.const 0) (i32.const 0) (i32.const 0) (i32.const 1)))
    (if (i32.eqz (local.get $st))
      (then (return (call $reply (i32.const 502) (global.get $S_err_up) (global.get $L_err_up) (i32.const 1)))))
    (if (call $find (i32.const 0x4000) (global.get $resp_len) (global.get $S_active) (global.get $L_active))
      (then (call $reply (i32.const 204) (i32.const 0) (i32.const 0) (i32.const 0)))
      (else (call $reply (i32.const 402) (i32.const 0) (i32.const 0) (i32.const 0)))))

  ;; ======================= entry point =======================

  (func (export "cm32p2|wasi:http/incoming-handler@0.2|handle")
    (param $req i32) (param $out i32)
    (local $path i32) (local $len i32) (local $method i32)
    (local $resp i32) (local $fields i32) (local $body i32) (local $stream i32)

    (call $req_method (local.get $req) (i32.const 32))
    (local.set $method (i32.load8_u (i32.const 32)))

    (call $req_path (local.get $req) (i32.const 16))
    (if (i32.load8_u (i32.const 16))
      (then (local.set $path (i32.load (i32.const 20))) (local.set $len (i32.load (i32.const 24)))))

    (global.set $origin_len
      (call $read_header_copy (local.get $req) (global.get $S_origin) (global.get $L_origin) (i32.const 0x3800) (i32.const 1024)))
    (if (global.get $origin_len) (then (global.set $origin_ptr (i32.const 0x3800))) (else (global.set $origin_ptr (i32.const 0))))
    (global.set $auth_len
      (call $read_header_copy (local.get $req) (global.get $S_h_auth) (global.get $L_h_auth) (i32.const 0x3000) (i32.const 2048)))
    (if (global.get $auth_len) (then (global.set $auth_ptr (i32.const 0x3000))) (else (global.set $auth_ptr (i32.const 0))))
    (call $req_drop (local.get $req))

    (call $get_environment (i32.const 0x108))
    (global.set $env_ptr (i32.load (i32.const 0x108)))
    (global.set $env_n (i32.load (i32.const 0x10c)))

    (call $reply (i32.const 404) (global.get $S_notfound) (global.get $L_notfound) (i32.const 0))
    (if (i32.eq (local.get $method) (i32.const 6))
      (then (call $reply (i32.const 204) (i32.const 0) (i32.const 0) (i32.const 0)))
      (else
        (if (call $is_route (local.get $path) (local.get $len) (global.get $S_r_root) (global.get $L_r_root))
          (then (call $reply (i32.const 200) (global.get $S_root) (global.get $L_root) (i32.const 0))))
        (if (call $is_route (local.get $path) (local.get $len) (global.get $S_r_login) (global.get $L_r_login))
          (then (call $do_login (local.get $path) (local.get $len))))
        (if (call $is_route (local.get $path) (local.get $len) (global.get $S_r_identity) (global.get $L_r_identity))
          (then (call $do_identity)))
        (if (call $is_route (local.get $path) (local.get $len) (global.get $S_r_patron) (global.get $L_r_patron))
          (then (call $do_patron)))))

    (local.set $fields (call $fields_new))
    (if (call $origin_allowed)
      (then
        (call $fields_append (local.get $fields) (global.get $S_h_acao) (global.get $L_h_acao) (global.get $origin_ptr) (global.get $origin_len) (i32.const 0x40))
        (call $fields_append (local.get $fields) (global.get $S_h_acam) (global.get $L_h_acam) (global.get $S_v_methods) (global.get $L_v_methods) (i32.const 0x40))
        (call $fields_append (local.get $fields) (global.get $S_h_acah) (global.get $L_h_acah) (global.get $S_v_headers) (global.get $L_v_headers) (i32.const 0x40))
        (call $fields_append (local.get $fields) (global.get $S_h_vary) (global.get $L_h_vary) (global.get $S_origin) (global.get $L_origin) (i32.const 0x40))))

    (if (global.get $r_json)
      (then (call $fields_append (local.get $fields) (global.get $S_h_ct) (global.get $L_h_ct) (global.get $S_ct_json) (global.get $L_ct_json) (i32.const 0x40)))
      (else (call $fields_append (local.get $fields) (global.get $S_h_ct) (global.get $L_h_ct) (global.get $S_ct_text) (global.get $L_ct_text) (i32.const 0x40))))

    (local.set $resp (call $resp_new (local.get $fields)))
    (drop (call $resp_set_status (local.get $resp) (global.get $r_status)))
    (call $resp_body (local.get $resp) (i32.const 0x40))
    (local.set $body (i32.load (i32.const 0x44)))
    (call $outparam_set (local.get $out) (i32.const 0) (local.get $resp) (i32.const 0) (i64.const 0) (i32.const 0) (i32.const 0) (i32.const 0) (i32.const 0))
    (call $body_write (local.get $body) (i32.const 0x40))
    (local.set $stream (i32.load (i32.const 0x44)))
    (call $stream_write (local.get $stream) (global.get $r_ptr) (global.get $r_len) (i32.const 0x40))
    (call $stream_drop (local.get $stream))
    (call $body_finish (local.get $body) (i32.const 0) (i32.const 0) (i32.const 0x40)))
)
