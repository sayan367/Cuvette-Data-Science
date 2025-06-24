import streamlit as st
import pandas as pd
import numpy as np
import pickle
import re
from sklearn.preprocessing import StandardScaler, OneHotEncoder
from sklearn.compose import ColumnTransformer

# Set page configuration
st.set_page_config(page_title="Laptop Price Predictor", page_icon="💻", layout="wide")

# Custom CSS for styling
st.markdown("""
    <style>
    .main {
        background-color: #f5f7fa;
        padding: 20px;
        border-radius: 10px;
    }
    .stButton>button {
        background-color: #007bff;
        color: white;
        border-radius: 8px;
        padding: 10px 20px;
        font-weight: bold;
        border: none;
        transition: background-color 0.3s;
    }
    .stButton>button:hover {
        background-color: #0056b3;
    }
    .stSelectbox, .stTextInput, .stNumberInput, .stSlider {
        background-color: white;
        border-radius: 8px;
        padding: 10px;
        border: 1px solid #ced4da;
    }
    .stSidebar {
        background-color: #ffffff;
        padding: 20px;
        border-radius: 10px;
        box-shadow: 0 4px 8px rgba(0,0,0,0.1);
    }
    .stSidebar .stSelectbox, .stSidebar .stTextInput, .stSidebar .stNumberInput, .stSidebar .stSlider {
        background-color: #f8f9fa;
    }
    .header {
        color: #343a40;
        font-size: 2.5rem;
        font-weight: bold;
        text-align: center;
        margin-bottom: 20px;
    }
    .subheader {
        color: #495057;
        font-size: 1.2rem;
        text-align: center;
        margin-bottom: 30px;
    }
    .success-box {
        background-color: #d4edda;
        color: #155724;
        padding: 15px;
        border-radius: 8px;
        font-size: 1.2rem;
        text-align: center;
        margin-top: 20px;
    }
    .error-box {
        background-color: #f8d7da;
        color: #721c24;
        padding: 15px;
        border-radius: 8px;
        font-size: 1.2rem;
        text-align: center;
        margin-top: 20px;
    }
    </style>
""", unsafe_allow_html=True)

# Title and description
st.markdown('<div class="header">💻 Laptop Price Predictor</div>', unsafe_allow_html=True)
st.markdown("""
<div class="subheader">
This app predicts the price of a laptop based on its specifications.<br>
Enter the details in the sidebar and get an estimated price in Euros!
</div>
""", unsafe_allow_html=True)

# Load model and preprocessing objects
try:
    with open("/Users/sayansarkar/Documents/Mk2_Lpatop_price_prediction/model/model.pkl", "rb") as f:
        model = pickle.load(f)
    with open("/Users/sayansarkar/Documents/Mk2_Lpatop_price_prediction/model/model_columns.pkl", "rb") as f:
        model_columns = pickle.load(f)
    with open("/Users/sayansarkar/Documents/Mk2_Lpatop_price_prediction/model/preprocessor.pkl", "rb") as f:
        preprocessor = pickle.load(f)
except Exception as e:
    st.markdown(f'<div class="error-box">Error loading model or preprocessors: {e}</div>', unsafe_allow_html=True)
    st.stop()

# Function to extract HDD and SSD from 'Memory' column
def extract_storage(df):
    df['HDD'] = df['Memory'].apply(
        lambda x: int(re.search(r"(\d+)TB HDD", x).group(1)) * 1024 if "TB HDD" in x else
                  int(re.search(r"(\d+)GB HDD", x).group(1)) if "GB HDD" in x else 0
    )
    df['SSD'] = df['Memory'].apply(
        lambda x: int(re.search(r"(\d+)GB SSD", x).group(1)) if "GB SSD" in x else 0
    )
    return df

# Sidebar for user input
st.sidebar.header("Laptop Specifications")

# Organize inputs in two columns for better layout
col1, col2 = st.sidebar.columns(2)

with col1:
    company = st.selectbox("Company", ['Acer', 'Apple', 'Asus', 'Dell', 'HP', 'Lenovo', 'MSI', 'Other'], help="Select the laptop manufacturer")
    product = st.text_input("Product Name", "Aspire E5-575", help="Enter the laptop model name")
    typename = st.selectbox("Type", ['Notebook', 'Gaming', 'Ultrabook', 'Workstation', 'Netbook'], help="Select the laptop type")
    screen_res = st.text_input("Screen Resolution", "1366x768", help="e.g., 1920x1080")
    cpu_company = st.selectbox("CPU Company", ['Intel', 'AMD'], help="Select the CPU manufacturer")
    cpu_type = st.text_input("CPU Model", "Core i3-6006U", help="e.g., Core i5-7200U")
    inches = st.number_input("Screen Size (Inches)", 10.0, 20.0, step=0.1, value=15.6, help="Enter screen size in inches")

with col2:
    gpu_company = st.selectbox("GPU Company", ['Intel', 'Nvidia', 'AMD'], help="Select the GPU manufacturer")
    gpu_type = st.text_input("GPU Model", "HD Graphics 520", help="e.g., GeForce GTX 1650")
    opsys = st.selectbox("Operating System", ['Windows 10', 'Windows 7', 'Mac OS', 'Linux', 'No OS', 'Other'], help="Select the OS")
    cpu_freq = st.number_input("CPU Frequency (GHz)", 1.0, 5.0, step=0.1, value=2.0, help="Enter CPU speed in GHz")
    ram = st.slider("RAM (GB)", 2, 64, value=4, step=2, help="Select RAM size")
    weight = st.number_input("Weight (kg)", 0.5, 5.0, step=0.1, value=2.23, help="Enter weight in kg")
    memory = st.text_input("Memory", "1TB HDD", help="e.g., '1TB HDD' or '256GB SSD'")

# Create input DataFrame
raw_input = {
    "Company": [company],
    "Product": [product],
    "TypeName": [typename],
    "ScreenResolution": [screen_res],
    "CPU_Company": [cpu_company],
    "CPU_Type": [cpu_type],
    "GPU_Company": [gpu_company],
    "GPU_Type": [gpu_type],
    "OpSys": [opsys],
    "Inches": [inches],
    "CPU_Frequency (GHz)": [cpu_freq],
    "RAM (GB)": [ram],
    "Weight (kg)": [weight],
    "Memory": [memory]
}

input_df = pd.DataFrame(raw_input)

# Apply feature extraction
input_df = extract_storage(input_df)

# Validate columns
expected_columns = [
    'Company', 'Product', 'TypeName', 'ScreenResolution',
    'CPU_Company', 'CPU_Type', 'GPU_Company', 'GPU_Type', 'OpSys',
    'Inches', 'CPU_Frequency (GHz)', 'RAM (GB)', 'Weight (kg)',
    'HDD', 'SSD'
]

missing_cols = set(expected_columns) - set(input_df.columns)
if missing_cols:
    st.markdown(f'<div class="error-box">Missing required columns: {missing_cols}</div>', unsafe_allow_html=True)
    st.stop()

# Prediction button in main content area
if st.button("Predict Price", key="predict_button"):
    try:
        prediction = model.predict(input_df)
        st.markdown(f'<div class="success-box">💰 Estimated Price: €{round(prediction[0], 2)}</div>', unsafe_allow_html=True)
    except Exception as e:
        st.markdown(f'<div class="error-box">Error during prediction: {e}</div>', unsafe_allow_html=True)