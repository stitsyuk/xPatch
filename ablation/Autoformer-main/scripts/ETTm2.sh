if [ ! -d "./logs" ]; then
    mkdir ./logs
fi

seq_len=96
model_name=Autoformer
model_id_name=ETTm2

for pred_len in 96 192 336 720
do
  python -u run.py \
    --is_training 1 \
    --root_path ../dataset/ \
    --data_path ETTm2.csv \
    --model_id ETTm2_$pred_len \
    --model Autoformer \
    --data ETTm2 \
    --features M \
    --seq_len $seq_len \
    --pred_len $pred_len \
    --label_len 48 \
    --e_layers 2 \
    --d_layers 1 \
    --factor 1 \
    --enc_in 7 \
    --dec_in 7 \
    --c_out 7 \
    --des 'Exp' \
    --freq 't' \
    --itr 1 >logs/$model_name'_'$model_id_name'_'$seq_len'_'$pred_len.log
done