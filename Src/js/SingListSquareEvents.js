function refreshModel(index,model) {
    model.clear()
    switch(index){
    case 0:
        model.append({modelData:"欧美"})
        model.append({modelData:"日语"})
        model.append({modelData:"韩语"})
        model.append({modelData:"粤语"})
        break;
    case 1:
        model.append({modelData:"流行"})
        model.append({modelData:"舞曲"})
        model.append({modelData:"说唱"})
        model.append({modelData:"爵士"})
        model.append({modelData:"R&B/Soul"})
        model.append({modelData:"古典"})
        model.append({modelData:"民族"})
        model.append({modelData:"英伦"})
        model.append({modelData:"金属"})
        model.append({modelData:"朋克"})
        model.append({modelData:"蓝调"})
        model.append({modelData:"雷鬼"})
        model.append({modelData:"世界音乐"})
        model.append({modelData:"拉丁"})
        model.append({modelData:"New Age"})
        model.append({modelData:"古风"})
        break;
    case 2:
        model.append({modelData:"清晨"})
        model.append({modelData:"夜晚"})
        model.append({modelData:"学习"})
        model.append({modelData:"工作"})
        model.append({modelData:"午休"})
        model.append({modelData:"下午茶"})
        model.append({modelData:"地铁"})
        model.append({modelData:"驾车"})
        model.append({modelData:"运动"})
        model.append({modelData:"旅行"})
        model.append({modelData:"散步"})
        model.append({modelData:"酒吧"})
        break;
    case 3:
        model.append({modelData:"怀旧"})
        model.append({modelData:"清新"})
        model.append({modelData:"浪漫"})
        model.append({modelData:"伤感"})
        model.append({modelData:"治愈"})
        model.append({modelData:"放松"})
        model.append({modelData:"孤独"})
        model.append({modelData:"感动"})
        model.append({modelData:"兴奋"})
        model.append({modelData:"快乐"})
        model.append({modelData:"安静"})
        model.append({modelData:"思念"})
        break;
    case 4:
        model.append({modelData:"综艺"})
        model.append({modelData:"影视原声"})
        model.append({modelData:"ACG"})
        break;
    }
    console.log(model.count)
}

function loadSingSquareListModels(model){
    // console.log(models,models.length)
    // for(let i = 0;i < models.length;i
        // let model = models[i]
        // console.log(model,model instanceof ListModel)
        model.append({src:`/Resources/cherryPick/singListSquare/pic0_0.png`,gColor:"#ff757575",titleText:"0.7x0.8x听完这些歌就彻底忘掉你",sing1:"歌曲一",sing2:"歌曲二",sing3:"歌曲三"})
        model.append({src:`/Resources/cherryPick/singListSquare/pic0_1.png`,gColor:"#ff38495c",titleText:"翻唱·我该怎么去释怀\n\n",sing1:"",sing2:"歌曲二",sing3:"歌曲三"})
        model.append({src:`/Resources/cherryPick/singListSquare/pic0_2.png`,gColor:"#ffc09982",titleText:"攒了一大堆好听的歌想和你一起听",sing1:"",sing2:"歌曲二",sing3:"歌曲三"})
        model.append({src:`/Resources/cherryPick/singListSquare/pic0_3.png`,gColor:"#ff636488",titleText:"失恋emo歌单|孤独·伤感·失落",sing1:"歌曲一",sing2:"歌曲二",sing3:"歌曲三"})
        model.append({src:`/Resources/cherryPick/singListSquare/pic0_4.png`,gColor:"#ff966a4c",titleText:"如果你也喜欢陈奕迅",sing1:"歌曲一",sing2:"歌曲二",sing3:"歌曲三"})
        model.append({src:`/Resources/cherryPick/singListSquare/pic0_5.png`,gColor:"#ff777070",titleText:"温柔暴击|沉溺与男友音的甜蜜乡",sing1:"歌曲一",sing2:"歌曲二",sing3:"歌曲三"})
        //节省时间直接用一样的图片
        // switch(i){
        // case 0:
        //     model.append({src:"",gColor:"",titleText:"",sing1:"",sing2:"",sing3:"",sing4:""})
        //     break;
        // case 1:

        //     break;
        // case 2:

        //     break;
        // case 3:

        //     break;
        // case 40:

        //     break;
        // }
    // }
}
