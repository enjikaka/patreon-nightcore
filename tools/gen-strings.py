import sys
S = [
 ("root","Welcome to the Nightcore.app Patreon service on Wasmtime."),
 ("notfound","not found"),
 ("badreq",'{"message":"Bad request"}'),
 ("err_env",'{"message":"Missing environment variable"}'),
 ("err_up",'{"message":"Patreon request failed"}'),
 ("h_ct","content-type"),
 ("ct_text","text/plain; charset=utf-8"),
 ("ct_json","application/json; charset=utf-8"),
 ("ct_form","application/x-www-form-urlencoded"),
 ("h_acao","access-control-allow-origin"),
 ("h_acam","access-control-allow-methods"),
 ("h_acah","access-control-allow-headers"),
 ("h_vary","vary"),
 ("v_methods","GET, OPTIONS"),
 ("v_headers","authorization, content-type"),
 ("origin","origin"),
 ("h_auth","authorization"),
 ("h_ua","user-agent"),
 ("v_ua","nightcore-patreon-wasm"),
 ("o1","https://nightcore.app"),
 ("o2","http://localhost:3000"),
 ("o3","http://localhost:1337"),
 ("host","www.patreon.com"),
 ("p_token","/api/oauth2/token"),
 ("p_identity","/api/oauth2/v2/identity?fields%5Buser%5D=full_name,image_url"),
 ("p_patron","/api/oauth2/v2/identity?include=memberships&fields%5Bmember%5D=patron_status,last_charge_date"),
 ("r_root","/"),
 ("r_login","/login"),
 ("r_identity","/identity"),
 ("r_patron","/patron"),
 ("q_code","code"),
 ("q_redirect","redirectUri"),
 ("e_client_id","PATREON_CLIENT_ID"),
 ("e_client_secret","PATREON_CLIENT_SECRET"),
 ("e_mock_active","PATREON_MOCK_ACTIVE"),
 ("f_code","code="),
 ("f_redirect","&redirect_uri="),
 ("f_grant","&grant_type=authorization_code&client_id="),
 ("f_secret","&client_secret="),
 ("active",'"patron_status":"active_patron"'),
]
def esc(s):
    return s.replace('\\','\\\\').replace('"','\\"')
off=0x400
out=["  ;; ---- string table (generated offsets) ----"]
for name,s in S:
    n=len(s.encode())
    out.append(f'  (data (i32.const {off}) "{esc(s)}")')
    out.append(f'  (global $S_{name} i32 (i32.const {off}))')
    out.append(f'  (global $L_{name} i32 (i32.const {n}))')
    off+=(n+7)//8*8
assert off<0x2000, off
print("\n".join(out))
