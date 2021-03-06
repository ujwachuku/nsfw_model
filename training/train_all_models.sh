#!/bin/sh
# You can add more models types from here: https://tfhub.dev/s?module-type=image-classification&tf-version=tf2
# However, you must choose Tensorflow 2 models. V1 models will not work here.
# https://tfhub.dev/google/imagenet/mobilenet_v2_140_224/classification/4
# https://tfhub.dev/google/imagenet/resnet_v2_50/classification/4
# https://tfhub.dev/google/imagenet/inception_v3/classification/4
# https://tfhub.dev/google/imagenet/nasnet_mobile/classification/4
# https://tfhub.dev/tensorflow/efficientnet/b0/classification/1
#
# If you get CUDA_OUT_OF_MEMORY crash, you need to pass --batch_size NUMBER, reducing until you don't get this error.
# It is advised by Google not to have a batch size < 8.

# Train EfficientNet B0
python3 make_nsfw_model.py --image_dir $PWD/../images --image_size 224 --saved_model_dir $PWD/../trained_models/efficientnet_b0_224 --labels_output_file $PWD/../trained_models/efficientnet_b0_224/class_labels.txt --tfhub_module https://tfhub.dev/tensorflow/efficientnet/b0/classification/1 --tflite_output_file $PWD/../trained_models/efficientnet_b0_224/saved_model.tflite --train_epochs 5 --batch_size 16 --do_fine_tuning --learning_rate 0.05 --dropout_rate 0.0 --momentum 0.9
# Note that installing tensorflowjs also installs tensorflow-cpu A.K.A. bye-bye-training.
# tensorflowjs_converter --input_format=tf_saved_model --output_format=tfjs_graph_model --signature_name=serving_default --saved_model_tags=serve $PWD/../trained_models/efficientnet_b0_224 $PWD/../trained_models/efficientnet_b0_224/web_model
# Or, for a quantized (1 byte) version
# tensorflowjs_converter --input_format=tf_saved_model --output_format=tfjs_graph_model --signature_name=serving_default --saved_model_tags=serve $PWD/../trained_models/efficientnet_b0_224 $PWD/../trained_models/efficientnet_b0_224/web_model_quantized --quantization_bytes 1

# Wait for Python/CUDA/GPU to recover. Seems to die without this.
sleep 60

# Train Mobilenet V2 140
python3 make_nsfw_model.py --image_dir $PWD/../images --image_size 224 --saved_model_dir $PWD/../trained_models/mobilenet_v2_140_224 --labels_output_file $PWD/../trained_models/mobilenet_v2_140_224/class_labels.txt --tfhub_module https://tfhub.dev/google/imagenet/mobilenet_v2_140_224/classification/4 --tflite_output_file $PWD/../trained_models/mobilenet_v2_140_224/saved_model.tflite --train_epochs 5 --batch_size 32 --do_fine_tuning --learning_rate 0.001 --dropout_rate 0.0 --momentum 0.9
# Note that installing tensorflowjs also installs tensorflow-cpu A.K.A. bye-bye-training.
# tensorflowjs_converter --input_format=tf_saved_model --output_format=tfjs_graph_model --signature_name=serving_default --saved_model_tags=serve $PWD/../trained_models/mobilenet_v2_140_224 $PWD/../trained_models/mobilenet_v2_140_224/web_model
# Or, for a quantized (1 byte) version
# tensorflowjs_converter --input_format=tf_saved_model --output_format=tfjs_graph_model --signature_name=serving_default --saved_model_tags=serve $PWD/../trained_models/mobilenet_v2_140_224 $PWD/../trained_models/mobilenet_v2_140_224/web_model_quantized --quantization_bytes 1

# Wait for Python/CUDA/GPU to recover. Seems to die without this.
sleep 60

# Train Resnet V2 50
python3 make_nsfw_model.py --image_dir $PWD/../images --image_size 224 --saved_model_dir $PWD/../trained_models/resnet_v2_50_224 --labels_output_file $PWD/../trained_models/resnet_v2_50_224/class_labels.txt --tfhub_module https://tfhub.dev/google/imagenet/resnet_v2_50/classification/4 --tflite_output_file $PWD/../trained_models/resnet_v2_50_224/saved_model.tflite --train_epochs 5 --batch_size 16 --do_fine_tuning --learning_rate 0.001 --dropout_rate 0.0 --momentum 0.9
# Note that installing tensorflowjs also installs tensorflow-cpu A.K.A. bye-bye-training.
#tensorflowjs_converter --input_format=tf_saved_model --output_format=tfjs_graph_model --signature_name=serving_default --saved_model_tags=serve $PWD/../trained_models/resnet_v2_50_224 $PWD/../trained_models/resnet_v2_50_224/web_model
# Or, for a quantized (1 byte) version
#tensorflowjs_converter --input_format=tf_saved_model --output_format=tfjs_graph_model --signature_name=serving_default --saved_model_tags=serve $PWD/../trained_models/resnet_v2_50_224 $PWD/../trained_models/resnet_v2_50_224/web_model_quantized --quantization_bytes 1

# Wait for Python/CUDA/GPU to recover. Seems to die without this.
sleep 60

# Train Inception V3
python3 make_nsfw_model.py --image_dir $PWD/../images --image_size 224 --saved_model_dir $PWD/../trained_models/inception_v3_224 --labels_output_file $PWD/../trained_models/inception_v3_224/class_labels.txt --tfhub_module https://tfhub.dev/google/imagenet/inception_v3/classification/4 --tflite_output_file $PWD/../trained_models/inception_v3_224/saved_model.tflite --train_epochs 5 --batch_size 16 --do_fine_tuning --learning_rate 0.001 --dropout_rate 0.0 --momentum 0.9
# Note that installing tensorflowjs also installs tensorflow-cpu A.K.A. bye-bye-training.
#tensorflowjs_converter --input_format=tf_saved_model --output_format=tfjs_graph_model --signature_name=serving_default --saved_model_tags=serve $PWD/../trained_models/inception_v3_224 $PWD/../trained_models/inception_v3_224/web_model
# Or, for a quantized (1 byte) version
#tensorflowjs_converter --input_format=tf_saved_model --output_format=tfjs_graph_model --signature_name=serving_default --saved_model_tags=serve $PWD/../trained_models/inception_v3_224 $PWD/../trained_models/inception_v3_224/web_model_quantized --quantization_bytes 1

# Wait for Python/CUDA/GPU to recover. Seems to die without this.
sleep 60

# Train NasNetMobile
python3 make_nsfw_model.py --image_dir $PWD/../images --image_size 224 --saved_model_dir $PWD/../trained_models/nasnet_a_224 --labels_output_file $PWD/../trained_models/nasnet_a_224/class_labels.txt --tfhub_module https://tfhub.dev/google/imagenet/nasnet_mobile/classification/4 --tflite_output_file $PWD/../trained_models/nasnet_a_224/saved_model.tflite --train_epochs 5 --batch_size 24 --do_fine_tuning --learning_rate 0.001 --dropout_rate 0.0 --momentum 0.9
# Note that installing tensorflowjs also installs tensorflow-cpu A.K.A. bye-bye-training.
#tensorflowjs_converter --input_format=tf_saved_model --output_format=tfjs_graph_model --signature_name=serving_default --saved_model_tags=serve $PWD/../trained_models/nasnet_a_224 $PWD/../trained_models/nasnet_a_224/web_modely
# Or, for a quantized (1 byte) version
#tensorflowjs_converter --input_format=tf_saved_model --output_format=tfjs_graph_model --signature_name=serving_default --saved_model_tags=serve $PWD/../trained_models/nasnet_a_224 $PWD/../trained_models/nasnet_a_224/web_modely_quantized --quantization_bytes 1