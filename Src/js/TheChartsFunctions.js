function loadModelData(index,dir,model) {
    model.clear()
    switch(index){
    case 0:
        for(let i = 0;i<4;i++)model.append({src:`${dir}/pic${i}.png`})
        break
    case 1:
        for(let i = 0;i<9;i++)model.append({src:`${dir}/pic${i}.png`})
        break
    case 2:
        for(let i = 0;i<6;i++)model.append({src:`${dir}/pic${i}.png`})
        break
    case 3:
        for(let i = 0;i<7;i++)model.append({src:`${dir}/pic${i}.png`})
        break
    case 4:
        for(let i = 0;i<6;i++)model.append({src:`${dir}/pic${i}.png`})
        break
    }

}
