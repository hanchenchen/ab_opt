source /hanchenchen/local_miniconda/envs/pl/bin/activate  # conda 不对 pip python 对
# source /hanchenchen/local_miniconda/etc/profile.d/conda.sh  # conda python 都不对

CONDA_EXE='/hanchenchen/miniconda3/bin/conda'
PYTHON_EXE='/hanchenchen/miniconda3/bin/python'

不行：
192.168.108.1:5000/pytorch/pytorch_miniconda-hanchenchen:v2.4_qa_esm_v2.1
pip install pyproject-toml --proxy  http://10.13.120.22:7890

pip install torch-scatter -f https://data.pyg.org/whl/torch-1.13.0+cu116.html --proxy  http://10.13.120.22:7890
conda install pytorch-scatter -c pyg
try：
192.168.108.1:5000/other/pt_2.3.1_py3.11_cuda12.1_cudnn8.9.2-hanchenchen:v1.1
git clone https://github.com/rusty1s/pytorch_scatter.git
cd pytorch_scatter
    1
    python setup.py install
    运行更多，可能和镜像有关系
    但报错
    /bin/bash: /root/miniconda3/bin/../lib/libtinfo.so.6: no version information available (required by /bin/bash)
    (base) root@akmps8j6ec3oc-0:/hanchenchen# /root/miniconda3/bin/../lib/libtinfo.so.6 --version
    Segmentation fault (core dumped)
    (base) root@akmps8j6ec3oc-0:/hanchenchen# mv /root/miniconda3/bin/../lib/libtinfo.so.6 /root/miniconda3/bin/../lib/libtinfo.so.6.bak
    (base) root@akmps8j6ec3oc-0:/hanchenchen# ln -s /usr/lib/x86_64-linux-gnu/libtinfo.so.6 /root/miniconda3/bin/../lib/libtinfo.so.6
    不行

    2
    pip install .
# export CUDA_HOME="/root/miniconda3" # 不用这行


以下：
# rm ~/.condarc
# conda clean -i
# conda remove -p /hanchenchen/envs/antibody_design --all
# conda activate base


conda create -p /hanchenchen/envs/antibody_design
conda activate /hanchenchen/envs/antibody_design

# conda config --prepend default_channels https://mirrors.westlake.edu.cn/ANACONDA/cloud/nvidia
# conda config --prepend default_channels https://mirrors.westlake.edu.cn/ANACONDA/cloud/pytorch
# # conda config --prepend default_channels https://mirrors.westlake.edu.cn/ANACONDA/pkgs/main
# conda config --prepend default_channels https://mirrors.westlake.edu.cn/ANACONDA/pkgs/r
# conda config --prepend default_channels https://mirrors.westlake.edu.cn/ANACONDA/pkgs/msys2
# conda config --prepend default_channels https://mirrors.tuna.tsinghua.edu.cn/anaconda/cloud/conda-forge/

conda install -c bioconda abnumber=0.3.0 # conda安装这个把torch删了。。。

# conda install pytorch==1.10.1 torchvision==0.13.1 cudatoolkit=10.2 -c pytorch # too slow
# pip install torch==1.10.1+cu102 torchvision==0.11.2+cu102 torchaudio==0.10.1 -f https://download.pytorch.org/whl/cu102/torch_stable.html  --proxy  http://10.13.120.22:7890 # 安装abnumber后版本不匹配了
pip install torch==2.2.0 torchvision==0.17.0 torchaudio==2.2.0 --index-url https://download.pytorch.org/whl/cu118 --proxy  http://10.13.120.22:7890

pip install torch-scatter -f https://data.pyg.org/whl/torch-2.2.0+cu118.html --proxy  http://10.13.120.22:7890

pip install joblib lmdb tqdm easydict pyyaml tensorboard biopython==1.78   wandb scipy --proxy  http://10.13.120.22:7890
# conda install conda-forge::pdbfixer # too slow
git clone https://github.com/openmm/pdbfixer.git 
python setup.py install
# 

conda create -n antibody_design --clone /hanchenchen/envs/antibody_design
conda activate antibody_design
pip install ipykernel matplotlib --proxy  http://10.13.120.22:7890
pip install ray --proxy  http://10.13.120.22:7890
pip install pyrosetta-installer  --proxy  http://10.13.120.22:7890
python -c 'import pyrosetta_installer; pyrosetta_installer.install_pyrosetta()'
pip install /hanchenchen/ab_opt/packages/pyrosetta-2024.19+release.a34b73c40f-cp312-cp312-linux_x86_64.whl
# ./data/all_structures/chothia

cd /hanchenchen/ab_opt/AbDesign/ && python design_testset.py
conda install -c conda-forge -c bioconda mmseqs2
# cd /hanchenchen/ab_opt/packages && tar xvzf /hanchenchen/ab_opt/packages/mmseqs-linux-arm64.tar.gz
# export PATH=$(pwd)/mmseqs/bin/:$PATH # 不work

SAVE to 192.168.108.1:5000/pytorch/pytorch_miniconda-hanchenchen:v2.6_antibody_design

conda install -c conda-forge openmm
