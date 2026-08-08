import requests
import json
from concurrent.futures import ThreadPoolExecutor
import pandas as pd
import sys
import requests
from concurrent.futures import ThreadPoolExecutor

df = pd.read_csv(r"C:\Users\SERGIO\Downloads\sda proy\sda proy\ASN\REPUTATION\filtered_repu_2013.csv")

# Dividir el DataFrame en dos partes: una con 49k filas y otra con el resto
df_49k = df.iloc[:49000]
df_restante = df.iloc[49000:]

# API Keys
API_KEYS = ["9942ae4dbc8ae0", "d1bf129f55ca8f"]

# Función para hacer la solicitud a ipinfo con API Key
def consulta_ip(ip, api_key):
    url = f"https://ipinfo.io/{ip}/json"
    headers = {
        "Authorization": f"Bearer {api_key}"
    }
    try:
        response = requests.get(url, headers=headers, timeout=10)
        if response.status_code == 200:
            return ip, response.json()
        else:
            return ip, {"error": f"Status code {response.status_code}"}
    except Exception as e:
        return ip, {"error": f"Exception: {str(e)}"}

# Función para procesar un DataFrame con una API Key
def procesar_dataframe(df, api_key, output_file):
    resultados = {}
    ips = df['IP'].dropna().unique().tolist()
    with ThreadPoolExecutor(max_workers=10) as executor:
        for ip, data in executor.map(lambda ip: consulta_ip(ip, api_key), ips):
            resultados[ip] = data
    with open(output_file, "w") as f:
        json.dump(resultados, f, indent=4)
    print(f"Datos guardados en {output_file} ✅")

# Procesar el primer DataFrame con la primera API Key
procesar_dataframe(df_49k, API_KEYS[0], "info_ips_repu_2013_p1.json")

# Procesar el DataFrame restante con la segunda API Key
procesar_dataframe(df_restante, API_KEYS[1], "info_ips_repu_2013_p2.json")
