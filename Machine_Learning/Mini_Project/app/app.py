import streamlit as st
import pickle
import pandas as pd

# Load the trained model pipeline
with open('../model/model.pkl', 'rb') as f:
    model = pickle.load(f)

st.set_page_config(page_title="💻 Laptop Price Predictor", layout="centered")
st.title("💻 Laptop Price Prediction App")

# --- User Inputs ---
company = st.selectbox("Brand", [
    'apple', 'hp', 'dell', 'asus', 'lenovo', 'acer', 'msi', 
    'toshiba', 'samsung', 'chuwi', 'huawei', 'google', 'others'
])

product = st.text_input("Product Name", "x515ea-bq502ws")

typename = st.selectbox("Laptop Type", [
    'notebook', 'ultrabook', 'gaming', 'netbook', 
    '2 in 1 convertible', 'workstation'
])

inches = st.slider("Screen Size (inches)", 10.0, 18.0, 15.6)

screen_res = st.selectbox("Screen Resolution", [
    '1920x1080', '1366x768', '1600x900', '3840x2160', 
    '3200x1800', '2880x1800', '2560x1600'
])

cpu_company = st.selectbox("CPU Brand", ['intel', 'amd'])
cpu_type = st.text_input("CPU Model", "core i5 7200u")
cpu_freq = st.slider("CPU Frequency (GHz)", 1.0, 5.0, 2.5)

ram = st.slider("RAM (GB)", 2, 64, 8)

gpu_company = st.selectbox("GPU Brand", ['intel', 'nvidia', 'amd'])
gpu_type = st.text_input("GPU Model", "intel hd graphics 620")

opsys = st.selectbox("Operating System", [
    'windows 10', 'macos', 'linux', 'chrome os', 'no os'
])

weight = st.slider("Laptop Weight (kg)", 1.0, 4.0, 2.0)

HDD = st.slider("HDD Storage (GB)", 0, 2000, 500, step=100)
SSD = st.slider("SSD Storage (GB)", 0, 2000, 256, step=128)

# --- Prediction ---
if st.button("Predict Price"):
    # Create input dictionary with exact training column names
    input_dict = {
        'company': company,
        'product': product,
        'typename': typename,
        'inches': inches,
        'screenresolution': screen_res,
        'cpu_company': cpu_company,
        'cpu_type': cpu_type,
        'cpu_frequency (ghz)': cpu_freq,
        'ram (gb)': ram,
        'gpu_company': gpu_company,
        'gpu_type': gpu_type,
        'opsys': opsys,
        'weight (kg)': weight,
        'HDD': HDD,
        'SSD': SSD
    }

    # Convert to DataFrame
    input_df = pd.DataFrame([input_dict])

    # Predict price
    try:
        prediction = model.predict(input_df)[0]
        st.success(f"💰 Predicted Laptop Price: €{prediction:.2f}")
    except Exception as e:
        st.error(f"❌ Prediction failed: {e}")
