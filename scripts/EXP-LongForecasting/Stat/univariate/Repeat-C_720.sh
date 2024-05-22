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
  do
  for pred_len in 24 96 192 336 720
    do
      python -u run_stat.py \
        --is_training 1 \
        --root_path ./dataset/ \
        --data_path ETTh1.csv \
        --model_id ETTh1_720'_'$pred_len \
        --model $model_name \
        --data ETTh1 \
        --features S \
        --seq_len 720 \
        --pred_len $pred_len \
        --des 'Exp' \
        --itr 1 >logs/LongForecasting/$model_name'_ETTh1_'$pred_len.log

      python -u run_stat.py \
        --is_training 1 \
        --root_path ./dataset/ \
        --data_path ETTh2.csv \
        --model_id ETTh2_720'_'$pred_len \
        --model $model_name \
        --data ETTh2 \
        --features S \
        --seq_len 720 \
        --pred_len $pred_len \
        --des 'Exp' \
        --itr 1 >logs/LongForecasting/$model_name'_ETTh2_'$pred_len.log

      python -u run_stat.py \
        --is_training 1 \
        --root_path ./dataset/ \
        --data_path ETTm1.csv \
        --model_id ETTm1_720'_'$pred_len \
        --model $model_name \
        --data ETTm1 \
        --features S \
        --seq_len 720 \
        --pred_len $pred_len \
        --des 'Exp' \
        --itr 1 >logs/LongForecasting/$model_name'_ETTm1_'$pred_len.log

      python -u run_stat.py \
        --is_training 1 \
        --root_path ./dataset/ \
        --data_path ETTm2.csv \
        --model_id ETTm2_720'_'$pred_len \
        --model $model_name \
        --data ETTm2 \
        --features S \
        --seq_len 720 \
        --pred_len $pred_len \
        --des 'Exp' \
        --itr 1 --batch_size 300 >logs/LongForecasting/$model_name'_ETTm2_'$pred_len.log

    python -u run_stat.py \
      --is_training 1 \
      --root_path ./dataset/ \
      --data_path exchange_rate.csv \
      --model_id exchange_rate_720'_'$pred_len \
      --model $model_name \
      --data custom \
      --features S \
      --seq_len 720 \
      --pred_len $pred_len \
      --des 'Exp' \
      --itr 1 >logs/LongForecasting/$model_name'_exchange_rate_'$pred_len.log
      
    python -u run_stat.py \
      --is_training 1 \
      --root_path ./dataset/ \
      --data_path weather.csv \
      --model_id weather_720'_'$pred_len \
      --model $model_name \
      --data custom \
      --features S \
      --seq_len 720 \
      --pred_len $pred_len \
      --des 'Exp' \
      --itr 1 >logs/LongForecasting/$model_name'_weather_'$pred_len.log

    python -u run_stat.py \
      --is_training 1 \
      --root_path ./dataset/ \
      --data_path de_big.csv \
      --model_id de_big_720'_'$pred_len \
      --model $model_name \
      --data ETTh1 \
      --features S \
      --seq_len 720 \
      --pred_len $pred_len \
      --des 'Exp' \
      --itr 1 >logs/LongForecasting/$model_name'_de_big_'$pred_len.log

  
  done
done


# for model_name in Naive GBRT ARIMA SARIMA
for model_name in Naive
  do
  for pred_len in 24 36 48 60
    do
      python -u run_stat.py \
          --is_training 1 \
          --root_path ./dataset/ \
          --data_path national_illness.csv \
          --model_id ili_60'_'$pred_len \
          --model $model_name \
          --data custom \
          --features S \
          --seq_len 60 \
          --label_len 18 \
          --pred_len $pred_len \
          --des 'Exp' \
          --itr 1 >logs/LongForecasting/$model_name'_ili_'$pred_len.log

      python -u run_stat.py \
          --is_training 1 \
          --root_path ./dataset/ \
          --data_path de_small.csv \
          --model_id de_small_60'_'$pred_len \
          --model $model_name \
          --data custom \
          --features S \
          --seq_len 60 \
          --label_len 18 \
          --pred_len $pred_len \
          --des 'Exp' \
          --itr 1 >logs/LongForecasting/$model_name'_de_small_'$pred_len.log
  done
done