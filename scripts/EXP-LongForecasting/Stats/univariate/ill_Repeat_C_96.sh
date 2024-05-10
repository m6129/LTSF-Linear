# ARIMA and SARIMA is extremely slow, you might need to sample 1% data (add --sample 0.01)
# Naive is the Closest Repeat (Repeat-C). It repeats the last value in the look back window.

if [ ! -d "./logs" ]; then
    mkdir ./logs
fi

if [ ! -d "./logs/LongForecasting" ]; then
    mkdir ./logs/LongForecasting
fi


# for model_name in Naive GBRT ARIMA SARIMA
for model_name in Naive
  for pred_len in 24 36 48 60
    do
      python -u run_stat.py \
          --is_training 1 \
          --root_path ./dataset/ \
          --data_path national_illness.csv \
          --model_id ili_36'_'$pred_len \
          --model $model_name \
          --data custom \
          --features M \
          --seq_len 36 \
          --label_len 18 \
          --pred_len $pred_len \
          --des 'Exp' \
          --itr 1 >logs/LongForecasting/$model_name'_ili_'$pred_len.log
  done
done