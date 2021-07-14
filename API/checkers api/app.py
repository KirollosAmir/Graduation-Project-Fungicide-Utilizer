from urllib.request import urlopen
from flask import Flask
from flask import request
import tensorflow.keras
from PIL import Image, ImageOps
import numpy as np
import base64
import io

app = Flask(__name__)


@app.route('/checker', methods=['POST'])
def crop_check():
    np.set_printoptions(suppress=True)
    model = None
    labels = None
    if request.form['crop'] == "tomato":
        model = tensorflow.keras.models.load_model('models/tomato_keras_model2.h5')
        labels = ["Tomato Bacterial_spot", "Tomato Early Blight", "Tomato Healthy", "Tomato Late Blight",
                  "Tomato Leaf Mold", "Tomato Septoria leaf spot", "Tomato Spider mites Two spotted spider mite",
                  "Tomato Target Spot", "Tomato mosaic virus", "Tomato Yellow Leaf Curl Virus"]
    elif request.form['crop'] == "potato":
        model = tensorflow.keras.models.load_model('models/potato_keras_model.h5')
        labels = ["Potato Early Blight", "Potato Healthy", "Potato Late Blight"]
    elif request.form['crop'] == "apple":
        model = tensorflow.keras.models.load_model('models/apple_keras_model.h5')
        labels = ["Apple Scab", "Apple Black rot", "Cedar Apple Rust ", "Apple Healthy"]
    elif request.form['crop'] == "corn":
        model = tensorflow.keras.models.load_model('models/corn_keras_model.h5')
        labels = ["Corn Cercospora (Gray) Leaf Spot", "Corn Common Rust", "Corn Healthy",
                  "Corn Northern Leaf Blight"]
    data = np.ndarray(shape=(1, 224, 224, 3), dtype=np.float32)
    image = Image.open(io.BytesIO(base64.b64decode(request.form['file'])))
    size = (224, 224)
    image = ImageOps.fit(image, size, Image.ANTIALIAS)
    image_array = np.asarray(image)
    normalized_image_array = (image_array.astype(np.float32) / 127.0) - 1
    data[0] = normalized_image_array
    prediction = model.predict(data)
    return labels[np.argmax(prediction, axis=1)[0]]


if __name__ == '__main__':
    app.run()
