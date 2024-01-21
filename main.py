from PIL import Image
import requests

im = Image.open(requests.get(
    "https://cdn.ttgtmedia.com/rms/misc/qr_code_barcode.jpg", stream=True).raw)

print(im.shape)
