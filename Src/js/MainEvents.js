const reserved = []
const posChangeArr = []
const moveOffset = 100
//颜色调整窗口位置移动事件
function colorAdjustMoveEvent(mouseX,mouseY){
    let xOutOfRange = false
    let yOutOfRange = false
    posChangeArr.push(Qt.point(mouseX,mouseY))
    if(posChangeArr.length < 2)return
    let xOffset = posChangeArr[0].x - posChangeArr[1].x
    let yOffset = posChangeArr[0].y - posChangeArr[1].y
    if(Math.abs(xOffset) > moveOffset || Math.abs(yOffset) > moveOffset){
        posChangeArr.shift()
        return
    }
    if (xOffset < 0) {//向右移
        if((colorAdjustWindow.x + colorAdjustWindow.width - xOffset) > window.width){
            xOutOfRange =  true
            colorAdjustWindow.x = window.width - colorAdjustWindow.width
        }
    }else {//向左移
        if((colorAdjustWindow.x + xOffset) < 0){
            xOutOfRange =  true
            colorAdjustWindow.x = 0
        }
    }
    if (yOffset < 0) {//向上移
        if(colorAdjustWindow.y + xOffset < 0){
            yOutOfRange =  true
            colorAdjustWindow.y = 0
        }
    }else {//向下移
        if((colorAdjustWindow.y + colorAdjustWindow.height + xOffset) > window.height){
            yOutOfRange =  true
            colorAdjustWindow.y = window.height - colorAdjustWindow.height
        }
    }
    if(!xOutOfRange && !yOutOfRange){
        colorAdjustWindow.x -= xOffset
        colorAdjustWindow.y -= yOffset
    }
    posChangeArr.shift()

}
