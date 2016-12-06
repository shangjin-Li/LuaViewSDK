img = Image()

view = CustomView()
view.frame(100, 100, 200, 200)
view.backgroundColor(0x000000, 0.3)


img.image("https://gju1.alicdn.com/bao/uploaded/i4/100000120700895002/TB2Qu0_fXXXXXb9XpXXXXXXXXXX_!!0-0-juitemmedia.jpg_560x560Q90.jpg", function()
    view.invalidate()
end)
img.hidden(true)

view.onDraw(function(canvas)
    testCanvasAndroidAndIos(canvas)
end)

function testCanvasAndroidAndIos(canvas)
    print(canvas)
    -- drawLine
    canvas.color(0xff0000)
    canvas.strokeWidth(2)
    canvas.drawLine(0, 50, 100, 50)
    canvas.drawLine(50, 0, 50, 100)

    canvas.resetPaint()
    canvas.color(0x00ff00)
    canvas.alpha(0.5)
    canvas.drawLine(0, 0, 100, 0)
    canvas.drawLine(100, 0, 100, 100)
    canvas.drawLine(100, 100, 0, 100)
    canvas.drawLine(0, 100, 0, 0)
    canvas.drawLine(0, 0, 100, 100)
    canvas.drawLine(100, 0, 0, 100)

    -- drawPoint
    canvas.drawPoint(1, 3)
    canvas.drawPoint(99, 97)

    -- drawRect
    canvas.resetPaint()
    canvas.style(PaintStyle.STROKE)
    canvas.drawRect(5, 5, 10, 10)
    canvas.style(PaintStyle.FILL)
    canvas.drawRect(10, 10, 15, 15)

    -- drawRoundRects
    canvas.drawRoundRect(45, 1, 55, 5, 2, 2)
    canvas.drawRoundRect(45, 5, 55, 10, 2, 2)

    -- drawCircle
    canvas.drawCircle(80, 0, 5)
    canvas.drawCircle(80, 15, 5)

    -- drawText
    canvas.textSize(20)
    canvas.drawText("x", 20, 55)
    canvas.textSize(14)
    canvas.drawText("y", 20, 65)
    canvas.resetPaint()

    -- drawOval
    canvas.drawOval(45, 50, 70, 60)
    canvas.drawOval(45, 60, 70, 70)

    -- draw Arc
    canvas.drawArc(30, 30, 50, 50, 0, 90, true)

    -- drawBitmap
    canvas.save()
    canvas.rotate(-10, 100, 100)
    canvas.skew(100)
    canvas.scale(1.2)
    canvas.translate(-10, -10)
    canvas.strokeWidth(10)
    canvas.textSize(15)
    canvas.bold(true)
    canvas.drawText("测试一下", 20, 150)
    canvas.alpha(0.5)
    canvas.drawImage("animate1", 0, 100, 100, 200)
    canvas.restore()
    canvas.resetPaint()

    print(img)
    if(img) then
        canvas.drawImage(img, 100, 0, 200, 100)
    end

    -- clipRect
    canvas.clipRect(100, 100, 135, 135)
    canvas.drawCircle(100, 100, 40)

    canvas.clipRect(150, 150, 180, 180)
    canvas.drawText("TestABCDEFGHEFGHIJKLMOPQRST", 150, 150)

    print(canvas.nativeObj())
end

function testCanvasAndroid(canvas)
    print(canvas)


    -- drawLine

    canvas.drawLine(0, 50, 100, 50, { color = 0xff0000 })
    canvas.drawLine(50, 0, 50, 100, { strokeWidth = 2 })

    canvas.drawLine({
        { 0, 0, 100, 0 },
        { 100, 0, 100, 100 },
        { 100, 100, 0, 100 },
        { 0, 100, 0, 0 },
        { 0, 0, 100, 100 },
        { 100, 0, 0, 100 }
    }, { color = 0x00ff00, alpha = 0.5 })

    canvas.resetPaint()


    -- drawPoint
    canvas.drawPoint(1, 3)
    canvas.drawPoint(99, 97)

    canvas.drawPoint({
        { 3, 1 },
        { 97, 99 },
        { 1, 97 },
        { 97, 1 }
    })


    -- drawRect
    canvas.drawRect(5, 5, 10, 10, { style = "stroke" })
    canvas.drawRect(10, 10, 15, 15, { style = "fillStroke" })

    canvas.drawRect({
        { 15, 15, 20, 20 },
        { 20, 20, 25, 25 },
        { 26, 26, 30, 30 },
    }, { style = 2 })

    -- drawRoundRects
    canvas.drawRoundRect(45, 1, 55, 5, 2, 2)
    canvas.drawRoundRect(45, 5, 55, 10, 2, 2)

    canvas.drawRoundRect({
        { 45, 10, 55, 15, 2, 2 },
        { 45, 16, 65, 20, 1, 1 },
    })

    -- drawCircle
    canvas.drawCircle(80, 0, 5)
    canvas.drawCircle(80, 15, 5)

    canvas.drawCircle({
        { 80, 30, 5 },
        { 80, 45, 2 },
    })

    -- drawText

    canvas.drawText("x", 20, 55, { textSize = 20, textAlign = TextAlign.RIGHT })
    canvas.drawText("y", 20, 65, { textSize = 14 })

    canvas.drawText({
        { "xx", 20, 75, { color = 0x0000ff, strikeThrough = true, textSize = 20, textSkewX = 1.5, bold = true } },
        { "yy", 20, 85 },
    }, { color = 0x0fff00, underline = true, textSize = 10, textScaleX = 3, letterSpacing = 0.2, linearText = true })
    canvas.resetPaint()

    -- drawOval
    canvas.drawOval(45, 50, 70, 60)
    canvas.drawOval(45, 60, 70, 70)

    canvas.drawOval({
        { 45, 70, 70, 75 },
        { 45, 80, 70, 85 }
    })

    -- draw Arc
    canvas.drawArc(30, 30, 50, 50, 0, 90, true)

    canvas.drawArc({
        { 10, 30, 30, 40, 91, 180, true },
        { 30, 30, 50, 50, 182, 100, false }
    })

    -- drawBitmap
    canvas.save()
    canvas.rotate(-10, 100, 100)
    canvas.skew(100)
    canvas.scale(1.2)
    canvas.translate(-10, -10)
    canvas.drawText("测试一下", 20, 150, { strokeWidth = 10, textSize = 15, filterBitmap = true, bold = true })
    canvas.drawBitmap("animate1", 0, 100, 100, 200, { alpha = 0.5 })
    canvas.restore()
    canvas.resetPaint()

    print(img)
    if (img) then
        canvas.drawBitmap(img, 100, 0, 200, 100)
    end

    -- clipRect
    canvas.clipRect(100, 100, 135, 135)
    canvas.drawCircle(100, 100, 40)

    canvas.clipRect(150, 150, 180, 180)
    canvas.drawText("TestABCDEFGHEFGHIJKLMOPQRST", 150, 150)

    print(canvas.nativeObj())
end

