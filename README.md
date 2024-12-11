<div align="center">
  <h2><b> (AAAI25) xPatch: Dual-Stream Time Series Forecasting with Exponential Seasonal-Trend Decomposition </b></h2>
</div>

<div align="center">

![](https://img.shields.io/github/last-commit/stitsyuk/xPatch?color=green)
![](https://img.shields.io/github/stars/stitsyuk/xPatch?color=yellow)
![](https://img.shields.io/github/forks/stitsyuk/xPatch?color=lightblue)
![](https://img.shields.io/badge/PRs-Welcome-green)

</div>

This is an official implementation of [xPatch: Dual-Stream Time Series Forecasting with Exponential Seasonal-Trend Decomposition](https://arxiv.org/).

## Model Overview

E**X**ponential **Patch** (xPatch) is a novel dual-stream architecture that utilizes exponential decomposition.

### Seasonal-Trend Decomposition

**Exponential Moving Average (EMA)** is an exponential smoothing method that assigns greater weight to more recent data points while smoothing out older data.

<p align="center">
<img src="./figures/ema.png" alt="" align=center />
</p>

### Architecture

Dual-flow architecture consists of an MLP-based linear stream and a CNN-based non-linear stream.

<p align="center">
<img src="./figures/xpatch.png" alt="" align=center />
</p>

## Results

### Long-term Forecasting with Unified Experimental Settings

In the unified experimental settings, xPatch achieves the best averaged performance on 60% of the datasets using the MSE metric and 70% of the datasets using the MAE metric.

<p align="center">
<img src="./figures/hyper-unified.png" alt="" align=center />
</p>

### Long-term Forecasting with Hyperparameter Search

In the hyperparameter search settings, xPatch achieves the best averaged performance on 70% of the datasets using the MSE metric and 90% of the datasets using the MAE metric.

<p align="center">
<img src="./figures/hyper-search.png" alt="" align=center />
</p>

### Efficiency on Long Look-back Windows

We explore the ability of different models to learn from a longer lookback window.

<p align="center">
<img src="./figures/lookback.png" alt="" align=center />
</p>

### Dual Flow Net

We explore the impact of the dual flow network in xPatch architecture and assess the contribution of each stream. The four possible configurations:
- Original: Seasonality -> non-linear stream, Trend -> linear stream
- Reversed: Seasonality -> linear stream, Trend -> non-linear stream
- Non-linear only: Seasonality -> non-linear stream, Trend -> non-linear stream
- Linear only: Seasonality -> linear stream, Trend -> linear stream

<p align="center">
<img src="./figures/dual-flow.png" alt="" align=center />
</p>

## Getting Started

1. Install requirements. ```pip install -r requirements.txt```

2. Download data. You can download the all datasets from [Google Driver](https://drive.google.com/u/0/uc?id=1NF7VEefXCmXuWNbnNe858WvQAkJ_7wuP&export=download), [Baidu Driver](https://pan.baidu.com/share/init?surl=r3KhGd0Q9PJIUZdfEYoymg&pwd=i9iy) or [Kaggle Datasets](https://www.kaggle.com/datasets/wentixiaogege/time-series-dataset). All the datasets are well pre-processed and can be used easily. Create a seperate folder ```./dataset``` and put all the files in the directory.

3. Train the model. We provide the experiment scripts of all benchmarks under the folder `./scripts`. The script for unified settings is *xPatch96*, while for the hyperparameter search you can use *xPatch336*. You can reproduce the experiment results by:

```
bash scripts/xPatch96.sh
```

You can adjust the hyperparameters based on your needs (e.g. different patch length, different look-back windows and prediction lengths, different alpha parameters for exponential decomposition). We also provide code for the baseline models and for ablation experiments from Appendix (EMA decomposition, arctangent loss, sigmoid learning rate adjustment scheme, inference time) in ```./ablation```.

## Acknowledgement

We appreciate the following github repos very much for their valuable code and effort:
- Autoformer (https://github.com/thuml/Autoformer)
- FEDformer (https://github.com/MAZiqing/FEDformer)
- ETSformer (https://github.com/salesforce/ETSformer)
- DLinear (https://github.com/cure-lab/LTSF-Linear)
- RLinear (https://github.com/plumprc/RTSF)
- PatchTST (https://github.com/yuqinie98/PatchTST)
- CARD (https://github.com/wxie9/CARD)
- TimeMixer (https://github.com/kwuking/TimeMixer)
- iTransformer (https://github.com/thuml/iTransformer)
- Time-Series-Library (https://github.com/thuml/Time-Series-Library)
- RevIN (https://github.com/ts-kim/RevIN)

## Contact

If you have any questions or concerns, please contact us at stitsyuk@kaist.ac.kr or submit an issue.

## Citation

If you find this repository useful in your research, please consider citing our paper as follows:

```
@inproceedings{Stitsyuk-2025-xPatch,
  title     = {xPatch: Dual-Stream Time Series Forecasting with Exponential Seasonal-Trend Decomposition},
  author    = {Stitsyuk, Artyom and
               Choi, Jaesik},
  booktitle = {Proceedings of the AAAI Conference on Artificial Intelligence},
  year      = {2025}
}
```
