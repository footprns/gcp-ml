def hello_gcs_generic(data, context):
    """Background Cloud Function to be triggered by Cloud Storage.
       This generic function logs relevant data when a file is changed.

    Args:
        data (dict): The Cloud Functions event payload.
        context (google.cloud.functions.Context): Metadata of triggering event.
    Returns:
        None; the output is written to Stackdriver Logging
    """

    print('_______Event ID: {}'.format(context.event_id))
    print('_______Event type: {}'.format(context.event_type))
    print('_______Bucket: {}'.format(data['bucket']))
    print('_______File: {}'.format(data['name']))
    print('_______Metageneration: {}'.format(data['metageneration']))
    print('_______Created: {}'.format(data['timeCreated']))
    print('_______Updated: {}'.format(data['updated']))