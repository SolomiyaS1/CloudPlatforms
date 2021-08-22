import logging
import datetime
import os
import json
import azure.functions as func
from azure.storage.blob import BlobClient

def main(req: func.HttpRequest) -> str:

    req_body = req.get_json()
    name = req_body.get('name')
    createdAt = req_body.get('time')

    timestamp = datetime.datetime.utcnow()
    logging.info('[HTTP] Message created at: %s with name: %s', timestamp, name)

    blobContent = {
        "createdAt": createdAt,
        "name": name,
        "processedAt": f'{timestamp}'
    }

    blobName=f'{blobContent["name"]}/{blobContent["processedAt"]}'
    
    sa_cs = os.environ["StorageAccountConnectionString"]
    sa_container = os.environ["StorageAccountContainerName"]
    blob = BlobClient.from_connection_string(conn_str=sa_cs, container_name=sa_container, blob_name=blobName)

    blob.upload_blob(json.dumps(blobContent))
