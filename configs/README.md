# Running Batch Analysis with config.sh

project-root/
├── configs/            ← contains `config.sh`
├── stase_symex/        ← analysis engine
└── eval3_edk2-main/    ← your EDK II project or target source tree    


run the batch from project-root with:
# one-time: make it executable
chmod +x configs/config.sh       

# launch all the analyses
 ./configs/config.sh 
