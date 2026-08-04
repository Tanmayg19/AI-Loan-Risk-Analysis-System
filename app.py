import streamlit as st
import requests

# -------------------------
# Page Configuration
# -------------------------
st.set_page_config(
    page_title="AI Loan Decision Assistant",
    page_icon="🏦",
    layout="wide"
)

# -------------------------
# Sidebar
# -------------------------

with st.sidebar:

    st.image(
        "https://img.icons8.com/color/96/bank-building.png",
        width=80
    )

    st.title("AI Credit Risk Assistant")

    st.markdown("---")

    st.markdown("### Technologies")

    st.markdown("""
- 🐍 Python
- ⚡ n8n
- 🐘 PostgreSQL
- 🤖 Groq LLM
- 📊 Power BI
""")

    st.markdown("---")

    st.info(
        "Ask any question about a loan using natural language."
    )

# -------------------------
# Main Page
# -------------------------

st.title("🏦 AI Loan Decision Assistant")

st.caption(
    "Powered by n8n • PostgreSQL • Groq AI"
)

st.markdown("---")

# -------------------------
# User Input
# -------------------------
# -------------------------
# User Input
# -------------------------

st.subheader("💬 Ask Your Question")

question = st.text_area(
    "",
    height=100,
    placeholder="""
Examples:

• Why is Loan 28684304 classified as Bad?

• Compare Loan 28684304 with a good loan.

• Explain Loan 28684304.

• Why is this borrower risky?
"""
)

# -------------------------
# Analyze Button
# -------------------------
if st.button("Analyze Loan"):

    if question.strip() == "":
        st.warning("Please enter a question.")
    else:

        webhook_url = "http://localhost:5678/webhook/loan-explainer"

        payload = {
            "message": question
        }

        try:
            response = requests.post(webhook_url, json=payload)

        except requests.exceptions.RequestException as e:
            st.error("❌ Unable to connect to n8n.")
            st.write(e)
            st.stop()

        if response.status_code != 200:
            st.error(f"Error: {response.status_code}")
            st.write(response.text)
            st.stop()

        try:
            result = response.json()

        except ValueError:
            st.error("❌ Loan ID not found or the workflow returned an empty response.")
            st.stop()

        st.success("✅ Analysis Completed")
        st.markdown(result["output"])