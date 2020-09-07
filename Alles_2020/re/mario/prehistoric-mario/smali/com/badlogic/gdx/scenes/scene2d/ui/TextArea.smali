.class public Lcom/badlogic/gdx/scenes/scene2d/ui/TextArea;
.super Lcom/badlogic/gdx/scenes/scene2d/ui/TextField;
.source "TextArea.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/badlogic/gdx/scenes/scene2d/ui/TextArea$TextAreaListener;
    }
.end annotation


# instance fields
.field cursorLine:I

.field firstLineShowing:I

.field private lastText:Ljava/lang/String;

.field linesBreak:Lcom/badlogic/gdx/utils/IntArray;

.field private linesShowing:I

.field moveOffset:F

.field private prefRows:F


# direct methods
.method public constructor <init>(Ljava/lang/String;Lcom/badlogic/gdx/scenes/scene2d/ui/Skin;)V
    .locals 0

    .line 57
    invoke-direct {p0, p1, p2}, Lcom/badlogic/gdx/scenes/scene2d/ui/TextField;-><init>(Ljava/lang/String;Lcom/badlogic/gdx/scenes/scene2d/ui/Skin;)V

    return-void
.end method

.method public constructor <init>(Ljava/lang/String;Lcom/badlogic/gdx/scenes/scene2d/ui/Skin;Ljava/lang/String;)V
    .locals 0

    .line 61
    invoke-direct {p0, p1, p2, p3}, Lcom/badlogic/gdx/scenes/scene2d/ui/TextField;-><init>(Ljava/lang/String;Lcom/badlogic/gdx/scenes/scene2d/ui/Skin;Ljava/lang/String;)V

    return-void
.end method

.method public constructor <init>(Ljava/lang/String;Lcom/badlogic/gdx/scenes/scene2d/ui/TextField$TextFieldStyle;)V
    .locals 0

    .line 65
    invoke-direct {p0, p1, p2}, Lcom/badlogic/gdx/scenes/scene2d/ui/TextField;-><init>(Ljava/lang/String;Lcom/badlogic/gdx/scenes/scene2d/ui/TextField$TextFieldStyle;)V

    return-void
.end method

.method private calculateCurrentLineIndex(I)I
    .locals 2

    const/4 v0, 0x0

    .line 191
    :goto_0
    iget-object v1, p0, Lcom/badlogic/gdx/scenes/scene2d/ui/TextArea;->linesBreak:Lcom/badlogic/gdx/utils/IntArray;

    iget v1, v1, Lcom/badlogic/gdx/utils/IntArray;->size:I

    if-ge v0, v1, :cond_0

    iget-object v1, p0, Lcom/badlogic/gdx/scenes/scene2d/ui/TextArea;->linesBreak:Lcom/badlogic/gdx/utils/IntArray;

    iget-object v1, v1, Lcom/badlogic/gdx/utils/IntArray;->items:[I

    aget v1, v1, v0

    if-le p1, v1, :cond_0

    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    :cond_0
    return v0
.end method


# virtual methods
.method protected calculateOffsets()V
    .locals 10

    .line 268
    invoke-super {p0}, Lcom/badlogic/gdx/scenes/scene2d/ui/TextField;->calculateOffsets()V

    .line 269
    iget-object v0, p0, Lcom/badlogic/gdx/scenes/scene2d/ui/TextArea;->text:Ljava/lang/String;

    iget-object v1, p0, Lcom/badlogic/gdx/scenes/scene2d/ui/TextArea;->lastText:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_8

    .line 270
    iget-object v0, p0, Lcom/badlogic/gdx/scenes/scene2d/ui/TextArea;->text:Ljava/lang/String;

    iput-object v0, p0, Lcom/badlogic/gdx/scenes/scene2d/ui/TextArea;->lastText:Ljava/lang/String;

    .line 271
    iget-object v0, p0, Lcom/badlogic/gdx/scenes/scene2d/ui/TextArea;->style:Lcom/badlogic/gdx/scenes/scene2d/ui/TextField$TextFieldStyle;

    iget-object v0, v0, Lcom/badlogic/gdx/scenes/scene2d/ui/TextField$TextFieldStyle;->font:Lcom/badlogic/gdx/graphics/g2d/BitmapFont;

    .line 272
    invoke-virtual {p0}, Lcom/badlogic/gdx/scenes/scene2d/ui/TextArea;->getWidth()F

    move-result v1

    iget-object v2, p0, Lcom/badlogic/gdx/scenes/scene2d/ui/TextArea;->style:Lcom/badlogic/gdx/scenes/scene2d/ui/TextField$TextFieldStyle;

    iget-object v2, v2, Lcom/badlogic/gdx/scenes/scene2d/ui/TextField$TextFieldStyle;->background:Lcom/badlogic/gdx/scenes/scene2d/utils/Drawable;

    if-eqz v2, :cond_0

    iget-object v2, p0, Lcom/badlogic/gdx/scenes/scene2d/ui/TextArea;->style:Lcom/badlogic/gdx/scenes/scene2d/ui/TextField$TextFieldStyle;

    iget-object v2, v2, Lcom/badlogic/gdx/scenes/scene2d/ui/TextField$TextFieldStyle;->background:Lcom/badlogic/gdx/scenes/scene2d/utils/Drawable;

    .line 273
    invoke-interface {v2}, Lcom/badlogic/gdx/scenes/scene2d/utils/Drawable;->getLeftWidth()F

    move-result v2

    iget-object v3, p0, Lcom/badlogic/gdx/scenes/scene2d/ui/TextArea;->style:Lcom/badlogic/gdx/scenes/scene2d/ui/TextField$TextFieldStyle;

    iget-object v3, v3, Lcom/badlogic/gdx/scenes/scene2d/ui/TextField$TextFieldStyle;->background:Lcom/badlogic/gdx/scenes/scene2d/utils/Drawable;

    invoke-interface {v3}, Lcom/badlogic/gdx/scenes/scene2d/utils/Drawable;->getRightWidth()F

    move-result v3

    add-float/2addr v2, v3

    goto :goto_0

    :cond_0
    const/4 v2, 0x0

    :goto_0
    sub-float/2addr v1, v2

    .line 274
    iget-object v2, p0, Lcom/badlogic/gdx/scenes/scene2d/ui/TextArea;->linesBreak:Lcom/badlogic/gdx/utils/IntArray;

    invoke-virtual {v2}, Lcom/badlogic/gdx/utils/IntArray;->clear()V

    .line 278
    const-class v2, Lcom/badlogic/gdx/graphics/g2d/GlyphLayout;

    invoke-static {v2}, Lcom/badlogic/gdx/utils/Pools;->get(Ljava/lang/Class;)Lcom/badlogic/gdx/utils/Pool;

    move-result-object v2

    .line 279
    invoke-virtual {v2}, Lcom/badlogic/gdx/utils/Pool;->obtain()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/badlogic/gdx/graphics/g2d/GlyphLayout;

    const/4 v4, 0x0

    const/4 v5, 0x0

    const/4 v6, 0x0

    const/4 v7, 0x0

    .line 280
    :goto_1
    iget-object v8, p0, Lcom/badlogic/gdx/scenes/scene2d/ui/TextArea;->text:Ljava/lang/String;

    invoke-virtual {v8}, Ljava/lang/String;->length()I

    move-result v8

    if-ge v5, v8, :cond_6

    .line 281
    iget-object v8, p0, Lcom/badlogic/gdx/scenes/scene2d/ui/TextArea;->text:Ljava/lang/String;

    invoke-virtual {v8, v5}, Ljava/lang/String;->charAt(I)C

    move-result v8

    const/16 v9, 0xd

    if-eq v8, v9, :cond_4

    const/16 v9, 0xa

    if-ne v8, v9, :cond_1

    goto :goto_3

    .line 287
    :cond_1
    invoke-virtual {p0, v5, v4}, Lcom/badlogic/gdx/scenes/scene2d/ui/TextArea;->continueCursor(II)Z

    move-result v8

    if-eqz v8, :cond_2

    goto :goto_2

    :cond_2
    move v7, v5

    .line 288
    :goto_2
    iget-object v8, p0, Lcom/badlogic/gdx/scenes/scene2d/ui/TextArea;->text:Ljava/lang/String;

    add-int/lit8 v9, v5, 0x1

    invoke-virtual {v8, v6, v9}, Ljava/lang/String;->subSequence(II)Ljava/lang/CharSequence;

    move-result-object v8

    invoke-virtual {v3, v0, v8}, Lcom/badlogic/gdx/graphics/g2d/GlyphLayout;->setText(Lcom/badlogic/gdx/graphics/g2d/BitmapFont;Ljava/lang/CharSequence;)V

    .line 289
    iget v8, v3, Lcom/badlogic/gdx/graphics/g2d/GlyphLayout;->width:F

    cmpl-float v8, v8, v1

    if-lez v8, :cond_5

    if-lt v6, v7, :cond_3

    add-int/lit8 v7, v5, -0x1

    .line 293
    :cond_3
    iget-object v8, p0, Lcom/badlogic/gdx/scenes/scene2d/ui/TextArea;->linesBreak:Lcom/badlogic/gdx/utils/IntArray;

    invoke-virtual {v8, v6}, Lcom/badlogic/gdx/utils/IntArray;->add(I)V

    .line 294
    iget-object v6, p0, Lcom/badlogic/gdx/scenes/scene2d/ui/TextArea;->linesBreak:Lcom/badlogic/gdx/utils/IntArray;

    add-int/lit8 v7, v7, 0x1

    invoke-virtual {v6, v7}, Lcom/badlogic/gdx/utils/IntArray;->add(I)V

    move v6, v7

    goto :goto_4

    .line 283
    :cond_4
    :goto_3
    iget-object v8, p0, Lcom/badlogic/gdx/scenes/scene2d/ui/TextArea;->linesBreak:Lcom/badlogic/gdx/utils/IntArray;

    invoke-virtual {v8, v6}, Lcom/badlogic/gdx/utils/IntArray;->add(I)V

    .line 284
    iget-object v6, p0, Lcom/badlogic/gdx/scenes/scene2d/ui/TextArea;->linesBreak:Lcom/badlogic/gdx/utils/IntArray;

    invoke-virtual {v6, v5}, Lcom/badlogic/gdx/utils/IntArray;->add(I)V

    add-int/lit8 v6, v5, 0x1

    :cond_5
    :goto_4
    add-int/lit8 v5, v5, 0x1

    goto :goto_1

    .line 300
    :cond_6
    invoke-virtual {v2, v3}, Lcom/badlogic/gdx/utils/Pool;->free(Ljava/lang/Object;)V

    .line 302
    iget-object v0, p0, Lcom/badlogic/gdx/scenes/scene2d/ui/TextArea;->text:Ljava/lang/String;

    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v0

    if-ge v6, v0, :cond_7

    .line 303
    iget-object v0, p0, Lcom/badlogic/gdx/scenes/scene2d/ui/TextArea;->linesBreak:Lcom/badlogic/gdx/utils/IntArray;

    invoke-virtual {v0, v6}, Lcom/badlogic/gdx/utils/IntArray;->add(I)V

    .line 304
    iget-object v0, p0, Lcom/badlogic/gdx/scenes/scene2d/ui/TextArea;->linesBreak:Lcom/badlogic/gdx/utils/IntArray;

    iget-object v1, p0, Lcom/badlogic/gdx/scenes/scene2d/ui/TextArea;->text:Ljava/lang/String;

    invoke-virtual {v1}, Ljava/lang/String;->length()I

    move-result v1

    invoke-virtual {v0, v1}, Lcom/badlogic/gdx/utils/IntArray;->add(I)V

    .line 306
    :cond_7
    invoke-virtual {p0}, Lcom/badlogic/gdx/scenes/scene2d/ui/TextArea;->showCursor()V

    :cond_8
    return-void
.end method

.method protected continueCursor(II)Z
    .locals 2

    add-int v0, p1, p2

    .line 341
    invoke-direct {p0, v0}, Lcom/badlogic/gdx/scenes/scene2d/ui/TextArea;->calculateCurrentLineIndex(I)I

    move-result v0

    .line 342
    invoke-super {p0, p1, p2}, Lcom/badlogic/gdx/scenes/scene2d/ui/TextField;->continueCursor(II)Z

    move-result p2

    if-eqz p2, :cond_1

    if-ltz v0, :cond_0

    iget-object p2, p0, Lcom/badlogic/gdx/scenes/scene2d/ui/TextArea;->linesBreak:Lcom/badlogic/gdx/utils/IntArray;

    iget p2, p2, Lcom/badlogic/gdx/utils/IntArray;->size:I

    add-int/lit8 p2, p2, -0x2

    if-ge v0, p2, :cond_0

    iget-object p2, p0, Lcom/badlogic/gdx/scenes/scene2d/ui/TextArea;->linesBreak:Lcom/badlogic/gdx/utils/IntArray;

    iget-object p2, p2, Lcom/badlogic/gdx/utils/IntArray;->items:[I

    add-int/lit8 v1, v0, 0x1

    aget p2, p2, v1

    if-ne p2, p1, :cond_0

    iget-object p1, p0, Lcom/badlogic/gdx/scenes/scene2d/ui/TextArea;->linesBreak:Lcom/badlogic/gdx/utils/IntArray;

    iget-object p1, p1, Lcom/badlogic/gdx/utils/IntArray;->items:[I

    aget p1, p1, v1

    iget-object p2, p0, Lcom/badlogic/gdx/scenes/scene2d/ui/TextArea;->linesBreak:Lcom/badlogic/gdx/utils/IntArray;

    iget-object p2, p2, Lcom/badlogic/gdx/utils/IntArray;->items:[I

    add-int/lit8 v0, v0, 0x2

    aget p2, p2, v0

    if-ne p1, p2, :cond_1

    :cond_0
    const/4 p1, 0x1

    goto :goto_0

    :cond_1
    const/4 p1, 0x0

    :goto_0
    return p1
.end method

.method protected createInputListener()Lcom/badlogic/gdx/scenes/scene2d/InputListener;
    .locals 1

    .line 312
    new-instance v0, Lcom/badlogic/gdx/scenes/scene2d/ui/TextArea$TextAreaListener;

    invoke-direct {v0, p0}, Lcom/badlogic/gdx/scenes/scene2d/ui/TextArea$TextAreaListener;-><init>(Lcom/badlogic/gdx/scenes/scene2d/ui/TextArea;)V

    return-object v0
.end method

.method protected drawCursor(Lcom/badlogic/gdx/scenes/scene2d/utils/Drawable;Lcom/badlogic/gdx/graphics/g2d/Batch;Lcom/badlogic/gdx/graphics/g2d/BitmapFont;FF)V
    .locals 7

    .line 259
    iget v0, p0, Lcom/badlogic/gdx/scenes/scene2d/ui/TextArea;->cursor:I

    iget-object v1, p0, Lcom/badlogic/gdx/scenes/scene2d/ui/TextArea;->glyphPositions:Lcom/badlogic/gdx/utils/FloatArray;

    iget v1, v1, Lcom/badlogic/gdx/utils/FloatArray;->size:I

    if-ge v0, v1, :cond_1

    iget v0, p0, Lcom/badlogic/gdx/scenes/scene2d/ui/TextArea;->cursorLine:I

    mul-int/lit8 v0, v0, 0x2

    iget-object v1, p0, Lcom/badlogic/gdx/scenes/scene2d/ui/TextArea;->linesBreak:Lcom/badlogic/gdx/utils/IntArray;

    iget v1, v1, Lcom/badlogic/gdx/utils/IntArray;->size:I

    if-lt v0, v1, :cond_0

    goto :goto_0

    :cond_0
    iget-object v0, p0, Lcom/badlogic/gdx/scenes/scene2d/ui/TextArea;->glyphPositions:Lcom/badlogic/gdx/utils/FloatArray;

    iget v1, p0, Lcom/badlogic/gdx/scenes/scene2d/ui/TextArea;->cursor:I

    .line 260
    invoke-virtual {v0, v1}, Lcom/badlogic/gdx/utils/FloatArray;->get(I)F

    move-result v0

    iget-object v1, p0, Lcom/badlogic/gdx/scenes/scene2d/ui/TextArea;->glyphPositions:Lcom/badlogic/gdx/utils/FloatArray;

    iget-object v2, p0, Lcom/badlogic/gdx/scenes/scene2d/ui/TextArea;->linesBreak:Lcom/badlogic/gdx/utils/IntArray;

    iget-object v2, v2, Lcom/badlogic/gdx/utils/IntArray;->items:[I

    iget v3, p0, Lcom/badlogic/gdx/scenes/scene2d/ui/TextArea;->cursorLine:I

    mul-int/lit8 v3, v3, 0x2

    aget v2, v2, v3

    invoke-virtual {v1, v2}, Lcom/badlogic/gdx/utils/FloatArray;->get(I)F

    move-result v1

    sub-float/2addr v0, v1

    goto :goto_1

    :cond_1
    :goto_0
    const/4 v0, 0x0

    :goto_1
    add-float/2addr p4, v0

    .line 261
    iget v0, p0, Lcom/badlogic/gdx/scenes/scene2d/ui/TextArea;->fontOffset:F

    add-float/2addr p4, v0

    invoke-virtual {p3}, Lcom/badlogic/gdx/graphics/g2d/BitmapFont;->getData()Lcom/badlogic/gdx/graphics/g2d/BitmapFont$BitmapFontData;

    move-result-object v0

    iget v0, v0, Lcom/badlogic/gdx/graphics/g2d/BitmapFont$BitmapFontData;->cursorX:F

    add-float v3, p4, v0

    .line 262
    invoke-virtual {p3}, Lcom/badlogic/gdx/graphics/g2d/BitmapFont;->getDescent()F

    move-result p4

    const/high16 v0, 0x40000000    # 2.0f

    div-float/2addr p4, v0

    sub-float/2addr p5, p4

    iget p4, p0, Lcom/badlogic/gdx/scenes/scene2d/ui/TextArea;->cursorLine:I

    iget v0, p0, Lcom/badlogic/gdx/scenes/scene2d/ui/TextArea;->firstLineShowing:I

    sub-int/2addr p4, v0

    add-int/lit8 p4, p4, 0x1

    int-to-float p4, p4

    invoke-virtual {p3}, Lcom/badlogic/gdx/graphics/g2d/BitmapFont;->getLineHeight()F

    move-result v0

    mul-float p4, p4, v0

    sub-float v4, p5, p4

    invoke-interface {p1}, Lcom/badlogic/gdx/scenes/scene2d/utils/Drawable;->getMinWidth()F

    move-result v5

    .line 263
    invoke-virtual {p3}, Lcom/badlogic/gdx/graphics/g2d/BitmapFont;->getLineHeight()F

    move-result v6

    move-object v1, p1

    move-object v2, p2

    .line 261
    invoke-interface/range {v1 .. v6}, Lcom/badlogic/gdx/scenes/scene2d/utils/Drawable;->draw(Lcom/badlogic/gdx/graphics/g2d/Batch;FFFF)V

    return-void
.end method

.method protected drawSelection(Lcom/badlogic/gdx/scenes/scene2d/utils/Drawable;Lcom/badlogic/gdx/graphics/g2d/Batch;Lcom/badlogic/gdx/graphics/g2d/BitmapFont;FF)V
    .locals 14

    move-object v0, p0

    .line 221
    iget v1, v0, Lcom/badlogic/gdx/scenes/scene2d/ui/TextArea;->firstLineShowing:I

    mul-int/lit8 v1, v1, 0x2

    .line 223
    iget v2, v0, Lcom/badlogic/gdx/scenes/scene2d/ui/TextArea;->cursor:I

    iget v3, v0, Lcom/badlogic/gdx/scenes/scene2d/ui/TextArea;->selectionStart:I

    invoke-static {v2, v3}, Ljava/lang/Math;->min(II)I

    move-result v2

    .line 224
    iget v3, v0, Lcom/badlogic/gdx/scenes/scene2d/ui/TextArea;->cursor:I

    iget v4, v0, Lcom/badlogic/gdx/scenes/scene2d/ui/TextArea;->selectionStart:I

    invoke-static {v3, v4}, Ljava/lang/Math;->max(II)I

    move-result v3

    const/4 v4, 0x0

    :goto_0
    add-int/lit8 v5, v1, 0x1

    .line 225
    iget-object v6, v0, Lcom/badlogic/gdx/scenes/scene2d/ui/TextArea;->linesBreak:Lcom/badlogic/gdx/utils/IntArray;

    iget v6, v6, Lcom/badlogic/gdx/utils/IntArray;->size:I

    if-ge v5, v6, :cond_3

    iget v6, v0, Lcom/badlogic/gdx/scenes/scene2d/ui/TextArea;->firstLineShowing:I

    iget v7, v0, Lcom/badlogic/gdx/scenes/scene2d/ui/TextArea;->linesShowing:I

    add-int/2addr v6, v7

    mul-int/lit8 v6, v6, 0x2

    if-ge v1, v6, :cond_3

    .line 227
    iget-object v6, v0, Lcom/badlogic/gdx/scenes/scene2d/ui/TextArea;->linesBreak:Lcom/badlogic/gdx/utils/IntArray;

    invoke-virtual {v6, v1}, Lcom/badlogic/gdx/utils/IntArray;->get(I)I

    move-result v6

    .line 228
    iget-object v7, v0, Lcom/badlogic/gdx/scenes/scene2d/ui/TextArea;->linesBreak:Lcom/badlogic/gdx/utils/IntArray;

    invoke-virtual {v7, v5}, Lcom/badlogic/gdx/utils/IntArray;->get(I)I

    move-result v7

    if-ge v2, v6, :cond_0

    if-ge v2, v7, :cond_0

    if-ge v3, v6, :cond_0

    if-lt v3, v7, :cond_2

    :cond_0
    if-le v2, v6, :cond_1

    if-le v2, v7, :cond_1

    if-le v3, v6, :cond_1

    if-gt v3, v7, :cond_2

    .line 233
    :cond_1
    iget-object v6, v0, Lcom/badlogic/gdx/scenes/scene2d/ui/TextArea;->linesBreak:Lcom/badlogic/gdx/utils/IntArray;

    invoke-virtual {v6, v1}, Lcom/badlogic/gdx/utils/IntArray;->get(I)I

    move-result v6

    invoke-static {v6, v2}, Ljava/lang/Math;->max(II)I

    move-result v6

    .line 234
    iget-object v7, v0, Lcom/badlogic/gdx/scenes/scene2d/ui/TextArea;->linesBreak:Lcom/badlogic/gdx/utils/IntArray;

    invoke-virtual {v7, v5}, Lcom/badlogic/gdx/utils/IntArray;->get(I)I

    move-result v5

    invoke-static {v5, v3}, Ljava/lang/Math;->min(II)I

    move-result v5

    .line 236
    iget-object v7, v0, Lcom/badlogic/gdx/scenes/scene2d/ui/TextArea;->glyphPositions:Lcom/badlogic/gdx/utils/FloatArray;

    invoke-virtual {v7, v6}, Lcom/badlogic/gdx/utils/FloatArray;->get(I)F

    move-result v7

    iget-object v8, v0, Lcom/badlogic/gdx/scenes/scene2d/ui/TextArea;->glyphPositions:Lcom/badlogic/gdx/utils/FloatArray;

    iget-object v9, v0, Lcom/badlogic/gdx/scenes/scene2d/ui/TextArea;->linesBreak:Lcom/badlogic/gdx/utils/IntArray;

    invoke-virtual {v9, v1}, Lcom/badlogic/gdx/utils/IntArray;->get(I)I

    move-result v9

    invoke-virtual {v8, v9}, Lcom/badlogic/gdx/utils/FloatArray;->get(I)F

    move-result v8

    sub-float/2addr v7, v8

    .line 237
    iget-object v8, v0, Lcom/badlogic/gdx/scenes/scene2d/ui/TextArea;->glyphPositions:Lcom/badlogic/gdx/utils/FloatArray;

    invoke-virtual {v8, v5}, Lcom/badlogic/gdx/utils/FloatArray;->get(I)F

    move-result v5

    iget-object v8, v0, Lcom/badlogic/gdx/scenes/scene2d/ui/TextArea;->glyphPositions:Lcom/badlogic/gdx/utils/FloatArray;

    invoke-virtual {v8, v6}, Lcom/badlogic/gdx/utils/FloatArray;->get(I)F

    move-result v6

    sub-float v12, v5, v6

    add-float v5, p4, v7

    .line 239
    iget v6, v0, Lcom/badlogic/gdx/scenes/scene2d/ui/TextArea;->fontOffset:F

    add-float v10, v5, v6

    iget v5, v0, Lcom/badlogic/gdx/scenes/scene2d/ui/TextArea;->textHeight:F

    sub-float v5, p5, v5

    invoke-virtual/range {p3 .. p3}, Lcom/badlogic/gdx/graphics/g2d/BitmapFont;->getDescent()F

    move-result v6

    sub-float/2addr v5, v6

    sub-float v11, v5, v4

    .line 240
    invoke-virtual/range {p3 .. p3}, Lcom/badlogic/gdx/graphics/g2d/BitmapFont;->getLineHeight()F

    move-result v13

    move-object v8, p1

    move-object/from16 v9, p2

    .line 239
    invoke-interface/range {v8 .. v13}, Lcom/badlogic/gdx/scenes/scene2d/utils/Drawable;->draw(Lcom/badlogic/gdx/graphics/g2d/Batch;FFFF)V

    .line 243
    :cond_2
    invoke-virtual/range {p3 .. p3}, Lcom/badlogic/gdx/graphics/g2d/BitmapFont;->getLineHeight()F

    move-result v5

    add-float/2addr v4, v5

    add-int/lit8 v1, v1, 0x2

    goto/16 :goto_0

    :cond_3
    return-void
.end method

.method protected drawText(Lcom/badlogic/gdx/graphics/g2d/Batch;Lcom/badlogic/gdx/graphics/g2d/BitmapFont;FF)V
    .locals 14

    move-object v0, p0

    .line 251
    iget v1, v0, Lcom/badlogic/gdx/scenes/scene2d/ui/TextArea;->firstLineShowing:I

    mul-int/lit8 v1, v1, 0x2

    const/4 v2, 0x0

    :goto_0
    iget v3, v0, Lcom/badlogic/gdx/scenes/scene2d/ui/TextArea;->firstLineShowing:I

    iget v4, v0, Lcom/badlogic/gdx/scenes/scene2d/ui/TextArea;->linesShowing:I

    add-int/2addr v3, v4

    mul-int/lit8 v3, v3, 0x2

    if-ge v1, v3, :cond_0

    iget-object v3, v0, Lcom/badlogic/gdx/scenes/scene2d/ui/TextArea;->linesBreak:Lcom/badlogic/gdx/utils/IntArray;

    iget v3, v3, Lcom/badlogic/gdx/utils/IntArray;->size:I

    if-ge v1, v3, :cond_0

    .line 252
    iget-object v6, v0, Lcom/badlogic/gdx/scenes/scene2d/ui/TextArea;->displayText:Ljava/lang/CharSequence;

    add-float v8, p4, v2

    iget-object v3, v0, Lcom/badlogic/gdx/scenes/scene2d/ui/TextArea;->linesBreak:Lcom/badlogic/gdx/utils/IntArray;

    iget-object v3, v3, Lcom/badlogic/gdx/utils/IntArray;->items:[I

    aget v9, v3, v1

    iget-object v3, v0, Lcom/badlogic/gdx/scenes/scene2d/ui/TextArea;->linesBreak:Lcom/badlogic/gdx/utils/IntArray;

    iget-object v3, v3, Lcom/badlogic/gdx/utils/IntArray;->items:[I

    add-int/lit8 v4, v1, 0x1

    aget v10, v3, v4

    const/4 v11, 0x0

    const/16 v12, 0x8

    const/4 v13, 0x0

    move-object/from16 v4, p2

    move-object v5, p1

    move/from16 v7, p3

    invoke-virtual/range {v4 .. v13}, Lcom/badlogic/gdx/graphics/g2d/BitmapFont;->draw(Lcom/badlogic/gdx/graphics/g2d/Batch;Ljava/lang/CharSequence;FFIIFIZ)Lcom/badlogic/gdx/graphics/g2d/GlyphLayout;

    .line 253
    invoke-virtual/range {p2 .. p2}, Lcom/badlogic/gdx/graphics/g2d/BitmapFont;->getLineHeight()F

    move-result v3

    sub-float/2addr v2, v3

    add-int/lit8 v1, v1, 0x2

    goto :goto_0

    :cond_0
    return-void
.end method

.method public getCursorLine()I
    .locals 1

    .line 347
    iget v0, p0, Lcom/badlogic/gdx/scenes/scene2d/ui/TextArea;->cursorLine:I

    return v0
.end method

.method public getCursorX()F
    .locals 2

    .line 359
    iget v0, p0, Lcom/badlogic/gdx/scenes/scene2d/ui/TextArea;->textOffset:F

    iget v1, p0, Lcom/badlogic/gdx/scenes/scene2d/ui/TextArea;->fontOffset:F

    add-float/2addr v0, v1

    iget-object v1, p0, Lcom/badlogic/gdx/scenes/scene2d/ui/TextArea;->style:Lcom/badlogic/gdx/scenes/scene2d/ui/TextField$TextFieldStyle;

    iget-object v1, v1, Lcom/badlogic/gdx/scenes/scene2d/ui/TextField$TextFieldStyle;->font:Lcom/badlogic/gdx/graphics/g2d/BitmapFont;

    invoke-virtual {v1}, Lcom/badlogic/gdx/graphics/g2d/BitmapFont;->getData()Lcom/badlogic/gdx/graphics/g2d/BitmapFont$BitmapFontData;

    move-result-object v1

    iget v1, v1, Lcom/badlogic/gdx/graphics/g2d/BitmapFont$BitmapFontData;->cursorX:F

    add-float/2addr v0, v1

    return v0
.end method

.method public getCursorY()F
    .locals 4

    .line 363
    iget-object v0, p0, Lcom/badlogic/gdx/scenes/scene2d/ui/TextArea;->style:Lcom/badlogic/gdx/scenes/scene2d/ui/TextField$TextFieldStyle;

    iget-object v0, v0, Lcom/badlogic/gdx/scenes/scene2d/ui/TextField$TextFieldStyle;->font:Lcom/badlogic/gdx/graphics/g2d/BitmapFont;

    .line 364
    invoke-virtual {v0}, Lcom/badlogic/gdx/graphics/g2d/BitmapFont;->getDescent()F

    move-result v1

    neg-float v1, v1

    const/high16 v2, 0x40000000    # 2.0f

    div-float/2addr v1, v2

    iget v2, p0, Lcom/badlogic/gdx/scenes/scene2d/ui/TextArea;->cursorLine:I

    iget v3, p0, Lcom/badlogic/gdx/scenes/scene2d/ui/TextArea;->firstLineShowing:I

    sub-int/2addr v2, v3

    add-int/lit8 v2, v2, 0x1

    int-to-float v2, v2

    invoke-virtual {v0}, Lcom/badlogic/gdx/graphics/g2d/BitmapFont;->getLineHeight()F

    move-result v0

    mul-float v2, v2, v0

    sub-float/2addr v1, v2

    neg-float v0, v1

    return v0
.end method

.method public getFirstLineShowing()I
    .locals 1

    .line 351
    iget v0, p0, Lcom/badlogic/gdx/scenes/scene2d/ui/TextArea;->firstLineShowing:I

    return v0
.end method

.method public getLines()I
    .locals 2

    .line 120
    iget-object v0, p0, Lcom/badlogic/gdx/scenes/scene2d/ui/TextArea;->linesBreak:Lcom/badlogic/gdx/utils/IntArray;

    iget v0, v0, Lcom/badlogic/gdx/utils/IntArray;->size:I

    div-int/lit8 v0, v0, 0x2

    invoke-virtual {p0}, Lcom/badlogic/gdx/scenes/scene2d/ui/TextArea;->newLineAtEnd()Z

    move-result v1

    add-int/2addr v0, v1

    return v0
.end method

.method public getLinesShowing()I
    .locals 1

    .line 355
    iget v0, p0, Lcom/badlogic/gdx/scenes/scene2d/ui/TextArea;->linesShowing:I

    return v0
.end method

.method public getPrefHeight()F
    .locals 2

    .line 106
    iget v0, p0, Lcom/badlogic/gdx/scenes/scene2d/ui/TextArea;->prefRows:F

    const/4 v1, 0x0

    cmpg-float v0, v0, v1

    if-gtz v0, :cond_0

    .line 107
    invoke-super {p0}, Lcom/badlogic/gdx/scenes/scene2d/ui/TextField;->getPrefHeight()F

    move-result v0

    return v0

    .line 109
    :cond_0
    iget v0, p0, Lcom/badlogic/gdx/scenes/scene2d/ui/TextArea;->textHeight:F

    iget v1, p0, Lcom/badlogic/gdx/scenes/scene2d/ui/TextArea;->prefRows:F

    mul-float v0, v0, v1

    .line 110
    iget-object v1, p0, Lcom/badlogic/gdx/scenes/scene2d/ui/TextArea;->style:Lcom/badlogic/gdx/scenes/scene2d/ui/TextField$TextFieldStyle;

    iget-object v1, v1, Lcom/badlogic/gdx/scenes/scene2d/ui/TextField$TextFieldStyle;->background:Lcom/badlogic/gdx/scenes/scene2d/utils/Drawable;

    if-eqz v1, :cond_1

    .line 111
    iget-object v1, p0, Lcom/badlogic/gdx/scenes/scene2d/ui/TextArea;->style:Lcom/badlogic/gdx/scenes/scene2d/ui/TextField$TextFieldStyle;

    iget-object v1, v1, Lcom/badlogic/gdx/scenes/scene2d/ui/TextField$TextFieldStyle;->background:Lcom/badlogic/gdx/scenes/scene2d/utils/Drawable;

    invoke-interface {v1}, Lcom/badlogic/gdx/scenes/scene2d/utils/Drawable;->getBottomHeight()F

    move-result v1

    add-float/2addr v0, v1

    iget-object v1, p0, Lcom/badlogic/gdx/scenes/scene2d/ui/TextArea;->style:Lcom/badlogic/gdx/scenes/scene2d/ui/TextField$TextFieldStyle;

    iget-object v1, v1, Lcom/badlogic/gdx/scenes/scene2d/ui/TextField$TextFieldStyle;->background:Lcom/badlogic/gdx/scenes/scene2d/utils/Drawable;

    invoke-interface {v1}, Lcom/badlogic/gdx/scenes/scene2d/utils/Drawable;->getTopHeight()F

    move-result v1

    add-float/2addr v0, v1

    iget-object v1, p0, Lcom/badlogic/gdx/scenes/scene2d/ui/TextArea;->style:Lcom/badlogic/gdx/scenes/scene2d/ui/TextField$TextFieldStyle;

    iget-object v1, v1, Lcom/badlogic/gdx/scenes/scene2d/ui/TextField$TextFieldStyle;->background:Lcom/badlogic/gdx/scenes/scene2d/utils/Drawable;

    .line 112
    invoke-interface {v1}, Lcom/badlogic/gdx/scenes/scene2d/utils/Drawable;->getMinHeight()F

    move-result v1

    .line 111
    invoke-static {v0, v1}, Ljava/lang/Math;->max(FF)F

    move-result v0

    :cond_1
    return v0
.end method

.method protected getTextY(Lcom/badlogic/gdx/graphics/g2d/BitmapFont;Lcom/badlogic/gdx/scenes/scene2d/utils/Drawable;)F
    .locals 0

    .line 212
    invoke-virtual {p0}, Lcom/badlogic/gdx/scenes/scene2d/ui/TextArea;->getHeight()F

    move-result p1

    if-eqz p2, :cond_0

    .line 214
    invoke-interface {p2}, Lcom/badlogic/gdx/scenes/scene2d/utils/Drawable;->getTopHeight()F

    move-result p2

    sub-float/2addr p1, p2

    float-to-int p1, p1

    int-to-float p1, p1

    :cond_0
    return p1
.end method

.method protected initialize()V
    .locals 2

    .line 70
    invoke-super {p0}, Lcom/badlogic/gdx/scenes/scene2d/ui/TextField;->initialize()V

    const/4 v0, 0x1

    .line 71
    iput-boolean v0, p0, Lcom/badlogic/gdx/scenes/scene2d/ui/TextArea;->writeEnters:Z

    .line 72
    new-instance v0, Lcom/badlogic/gdx/utils/IntArray;

    invoke-direct {v0}, Lcom/badlogic/gdx/utils/IntArray;-><init>()V

    iput-object v0, p0, Lcom/badlogic/gdx/scenes/scene2d/ui/TextArea;->linesBreak:Lcom/badlogic/gdx/utils/IntArray;

    const/4 v0, 0x0

    .line 73
    iput v0, p0, Lcom/badlogic/gdx/scenes/scene2d/ui/TextArea;->cursorLine:I

    .line 74
    iput v0, p0, Lcom/badlogic/gdx/scenes/scene2d/ui/TextArea;->firstLineShowing:I

    const/high16 v1, -0x40800000    # -1.0f

    .line 75
    iput v1, p0, Lcom/badlogic/gdx/scenes/scene2d/ui/TextArea;->moveOffset:F

    .line 76
    iput v0, p0, Lcom/badlogic/gdx/scenes/scene2d/ui/TextArea;->linesShowing:I

    return-void
.end method

.method protected letterUnderCursor(F)I
    .locals 5

    .line 80
    iget-object v0, p0, Lcom/badlogic/gdx/scenes/scene2d/ui/TextArea;->linesBreak:Lcom/badlogic/gdx/utils/IntArray;

    iget v0, v0, Lcom/badlogic/gdx/utils/IntArray;->size:I

    const/4 v1, 0x0

    if-lez v0, :cond_4

    .line 81
    iget v0, p0, Lcom/badlogic/gdx/scenes/scene2d/ui/TextArea;->cursorLine:I

    mul-int/lit8 v0, v0, 0x2

    iget-object v2, p0, Lcom/badlogic/gdx/scenes/scene2d/ui/TextArea;->linesBreak:Lcom/badlogic/gdx/utils/IntArray;

    iget v2, v2, Lcom/badlogic/gdx/utils/IntArray;->size:I

    if-lt v0, v2, :cond_0

    .line 82
    iget-object p1, p0, Lcom/badlogic/gdx/scenes/scene2d/ui/TextArea;->text:Ljava/lang/String;

    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result p1

    return p1

    .line 84
    :cond_0
    iget-object v0, p0, Lcom/badlogic/gdx/scenes/scene2d/ui/TextArea;->glyphPositions:Lcom/badlogic/gdx/utils/FloatArray;

    iget-object v0, v0, Lcom/badlogic/gdx/utils/FloatArray;->items:[F

    .line 85
    iget-object v2, p0, Lcom/badlogic/gdx/scenes/scene2d/ui/TextArea;->linesBreak:Lcom/badlogic/gdx/utils/IntArray;

    iget-object v2, v2, Lcom/badlogic/gdx/utils/IntArray;->items:[I

    iget v3, p0, Lcom/badlogic/gdx/scenes/scene2d/ui/TextArea;->cursorLine:I

    mul-int/lit8 v3, v3, 0x2

    aget v2, v2, v3

    .line 86
    aget v3, v0, v2

    add-float/2addr p1, v3

    .line 87
    iget-object v3, p0, Lcom/badlogic/gdx/scenes/scene2d/ui/TextArea;->linesBreak:Lcom/badlogic/gdx/utils/IntArray;

    iget-object v3, v3, Lcom/badlogic/gdx/utils/IntArray;->items:[I

    iget v4, p0, Lcom/badlogic/gdx/scenes/scene2d/ui/TextArea;->cursorLine:I

    mul-int/lit8 v4, v4, 0x2

    add-int/lit8 v4, v4, 0x1

    aget v3, v3, v4

    :goto_0
    if-ge v2, v3, :cond_2

    .line 90
    aget v4, v0, v2

    cmpl-float v4, v4, p1

    if-lez v4, :cond_1

    goto :goto_1

    :cond_1
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    :cond_2
    :goto_1
    if-lez v2, :cond_3

    .line 91
    aget v3, v0, v2

    sub-float/2addr v3, p1

    add-int/lit8 v4, v2, -0x1

    aget v0, v0, v4

    sub-float/2addr p1, v0

    cmpg-float p1, v3, p1

    if-gtz p1, :cond_3

    return v2

    :cond_3
    add-int/lit8 v2, v2, -0x1

    .line 92
    invoke-static {v1, v2}, Ljava/lang/Math;->max(II)I

    move-result p1

    return p1

    :cond_4
    return v1
.end method

.method protected moveCursor(ZZ)V
    .locals 4

    if-eqz p1, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, -0x1

    .line 324
    :goto_0
    iget v1, p0, Lcom/badlogic/gdx/scenes/scene2d/ui/TextArea;->cursorLine:I

    mul-int/lit8 v1, v1, 0x2

    add-int/2addr v1, v0

    if-ltz v1, :cond_2

    add-int/lit8 v2, v1, 0x1

    .line 325
    iget-object v3, p0, Lcom/badlogic/gdx/scenes/scene2d/ui/TextArea;->linesBreak:Lcom/badlogic/gdx/utils/IntArray;

    iget v3, v3, Lcom/badlogic/gdx/utils/IntArray;->size:I

    if-ge v2, v3, :cond_2

    iget-object v3, p0, Lcom/badlogic/gdx/scenes/scene2d/ui/TextArea;->linesBreak:Lcom/badlogic/gdx/utils/IntArray;

    iget-object v3, v3, Lcom/badlogic/gdx/utils/IntArray;->items:[I

    aget v1, v3, v1

    iget v3, p0, Lcom/badlogic/gdx/scenes/scene2d/ui/TextArea;->cursor:I

    if-ne v1, v3, :cond_2

    iget-object v1, p0, Lcom/badlogic/gdx/scenes/scene2d/ui/TextArea;->linesBreak:Lcom/badlogic/gdx/utils/IntArray;

    iget-object v1, v1, Lcom/badlogic/gdx/utils/IntArray;->items:[I

    aget v1, v1, v2

    iget v2, p0, Lcom/badlogic/gdx/scenes/scene2d/ui/TextArea;->cursor:I

    if-ne v1, v2, :cond_2

    .line 327
    iget v1, p0, Lcom/badlogic/gdx/scenes/scene2d/ui/TextArea;->cursorLine:I

    add-int/2addr v1, v0

    iput v1, p0, Lcom/badlogic/gdx/scenes/scene2d/ui/TextArea;->cursorLine:I

    if-eqz p2, :cond_1

    .line 329
    invoke-super {p0, p1, p2}, Lcom/badlogic/gdx/scenes/scene2d/ui/TextField;->moveCursor(ZZ)V

    .line 331
    :cond_1
    invoke-virtual {p0}, Lcom/badlogic/gdx/scenes/scene2d/ui/TextArea;->showCursor()V

    goto :goto_1

    .line 333
    :cond_2
    invoke-super {p0, p1, p2}, Lcom/badlogic/gdx/scenes/scene2d/ui/TextField;->moveCursor(ZZ)V

    .line 335
    :goto_1
    invoke-virtual {p0}, Lcom/badlogic/gdx/scenes/scene2d/ui/TextArea;->updateCurrentLine()V

    return-void
.end method

.method public moveCursorLine(I)V
    .locals 4

    const/high16 v0, -0x40800000    # -1.0f

    if-gez p1, :cond_0

    const/4 p1, 0x0

    .line 132
    iput p1, p0, Lcom/badlogic/gdx/scenes/scene2d/ui/TextArea;->cursorLine:I

    .line 133
    iput p1, p0, Lcom/badlogic/gdx/scenes/scene2d/ui/TextArea;->cursor:I

    .line 134
    iput v0, p0, Lcom/badlogic/gdx/scenes/scene2d/ui/TextArea;->moveOffset:F

    goto/16 :goto_3

    .line 135
    :cond_0
    invoke-virtual {p0}, Lcom/badlogic/gdx/scenes/scene2d/ui/TextArea;->getLines()I

    move-result v1

    if-lt p1, v1, :cond_3

    .line 136
    invoke-virtual {p0}, Lcom/badlogic/gdx/scenes/scene2d/ui/TextArea;->getLines()I

    move-result v1

    add-int/lit8 v1, v1, -0x1

    .line 137
    iget-object v2, p0, Lcom/badlogic/gdx/scenes/scene2d/ui/TextArea;->text:Ljava/lang/String;

    invoke-virtual {v2}, Ljava/lang/String;->length()I

    move-result v2

    iput v2, p0, Lcom/badlogic/gdx/scenes/scene2d/ui/TextArea;->cursor:I

    .line 138
    invoke-virtual {p0}, Lcom/badlogic/gdx/scenes/scene2d/ui/TextArea;->getLines()I

    move-result v2

    if-gt p1, v2, :cond_1

    iget p1, p0, Lcom/badlogic/gdx/scenes/scene2d/ui/TextArea;->cursorLine:I

    if-ne v1, p1, :cond_2

    .line 139
    :cond_1
    iput v0, p0, Lcom/badlogic/gdx/scenes/scene2d/ui/TextArea;->moveOffset:F

    .line 141
    :cond_2
    iput v1, p0, Lcom/badlogic/gdx/scenes/scene2d/ui/TextArea;->cursorLine:I

    goto/16 :goto_3

    .line 142
    :cond_3
    iget v0, p0, Lcom/badlogic/gdx/scenes/scene2d/ui/TextArea;->cursorLine:I

    if-eq p1, v0, :cond_8

    .line 143
    iget v0, p0, Lcom/badlogic/gdx/scenes/scene2d/ui/TextArea;->moveOffset:F

    const/4 v1, 0x0

    cmpg-float v0, v0, v1

    if-gez v0, :cond_5

    .line 144
    iget-object v0, p0, Lcom/badlogic/gdx/scenes/scene2d/ui/TextArea;->linesBreak:Lcom/badlogic/gdx/utils/IntArray;

    iget v0, v0, Lcom/badlogic/gdx/utils/IntArray;->size:I

    iget v2, p0, Lcom/badlogic/gdx/scenes/scene2d/ui/TextArea;->cursorLine:I

    mul-int/lit8 v2, v2, 0x2

    if-gt v0, v2, :cond_4

    goto :goto_0

    :cond_4
    iget-object v0, p0, Lcom/badlogic/gdx/scenes/scene2d/ui/TextArea;->glyphPositions:Lcom/badlogic/gdx/utils/FloatArray;

    iget v1, p0, Lcom/badlogic/gdx/scenes/scene2d/ui/TextArea;->cursor:I

    .line 145
    invoke-virtual {v0, v1}, Lcom/badlogic/gdx/utils/FloatArray;->get(I)F

    move-result v0

    iget-object v1, p0, Lcom/badlogic/gdx/scenes/scene2d/ui/TextArea;->glyphPositions:Lcom/badlogic/gdx/utils/FloatArray;

    iget-object v2, p0, Lcom/badlogic/gdx/scenes/scene2d/ui/TextArea;->linesBreak:Lcom/badlogic/gdx/utils/IntArray;

    iget v3, p0, Lcom/badlogic/gdx/scenes/scene2d/ui/TextArea;->cursorLine:I

    mul-int/lit8 v3, v3, 0x2

    invoke-virtual {v2, v3}, Lcom/badlogic/gdx/utils/IntArray;->get(I)I

    move-result v2

    invoke-virtual {v1, v2}, Lcom/badlogic/gdx/utils/FloatArray;->get(I)F

    move-result v1

    sub-float v1, v0, v1

    :goto_0
    iput v1, p0, Lcom/badlogic/gdx/scenes/scene2d/ui/TextArea;->moveOffset:F

    .line 147
    :cond_5
    iput p1, p0, Lcom/badlogic/gdx/scenes/scene2d/ui/TextArea;->cursorLine:I

    .line 148
    iget p1, p0, Lcom/badlogic/gdx/scenes/scene2d/ui/TextArea;->cursorLine:I

    mul-int/lit8 p1, p1, 0x2

    iget-object v0, p0, Lcom/badlogic/gdx/scenes/scene2d/ui/TextArea;->linesBreak:Lcom/badlogic/gdx/utils/IntArray;

    iget v0, v0, Lcom/badlogic/gdx/utils/IntArray;->size:I

    if-lt p1, v0, :cond_6

    iget-object p1, p0, Lcom/badlogic/gdx/scenes/scene2d/ui/TextArea;->text:Ljava/lang/String;

    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result p1

    goto :goto_1

    :cond_6
    iget-object p1, p0, Lcom/badlogic/gdx/scenes/scene2d/ui/TextArea;->linesBreak:Lcom/badlogic/gdx/utils/IntArray;

    iget v0, p0, Lcom/badlogic/gdx/scenes/scene2d/ui/TextArea;->cursorLine:I

    mul-int/lit8 v0, v0, 0x2

    invoke-virtual {p1, v0}, Lcom/badlogic/gdx/utils/IntArray;->get(I)I

    move-result p1

    :goto_1
    iput p1, p0, Lcom/badlogic/gdx/scenes/scene2d/ui/TextArea;->cursor:I

    .line 149
    :goto_2
    iget p1, p0, Lcom/badlogic/gdx/scenes/scene2d/ui/TextArea;->cursor:I

    iget-object v0, p0, Lcom/badlogic/gdx/scenes/scene2d/ui/TextArea;->text:Ljava/lang/String;

    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v0

    if-ge p1, v0, :cond_7

    iget p1, p0, Lcom/badlogic/gdx/scenes/scene2d/ui/TextArea;->cursor:I

    iget-object v0, p0, Lcom/badlogic/gdx/scenes/scene2d/ui/TextArea;->linesBreak:Lcom/badlogic/gdx/utils/IntArray;

    iget v1, p0, Lcom/badlogic/gdx/scenes/scene2d/ui/TextArea;->cursorLine:I

    mul-int/lit8 v1, v1, 0x2

    add-int/lit8 v1, v1, 0x1

    invoke-virtual {v0, v1}, Lcom/badlogic/gdx/utils/IntArray;->get(I)I

    move-result v0

    add-int/lit8 v0, v0, -0x1

    if-gt p1, v0, :cond_7

    iget-object p1, p0, Lcom/badlogic/gdx/scenes/scene2d/ui/TextArea;->glyphPositions:Lcom/badlogic/gdx/utils/FloatArray;

    iget v0, p0, Lcom/badlogic/gdx/scenes/scene2d/ui/TextArea;->cursor:I

    .line 150
    invoke-virtual {p1, v0}, Lcom/badlogic/gdx/utils/FloatArray;->get(I)F

    move-result p1

    iget-object v0, p0, Lcom/badlogic/gdx/scenes/scene2d/ui/TextArea;->glyphPositions:Lcom/badlogic/gdx/utils/FloatArray;

    iget-object v1, p0, Lcom/badlogic/gdx/scenes/scene2d/ui/TextArea;->linesBreak:Lcom/badlogic/gdx/utils/IntArray;

    iget v2, p0, Lcom/badlogic/gdx/scenes/scene2d/ui/TextArea;->cursorLine:I

    mul-int/lit8 v2, v2, 0x2

    invoke-virtual {v1, v2}, Lcom/badlogic/gdx/utils/IntArray;->get(I)I

    move-result v1

    invoke-virtual {v0, v1}, Lcom/badlogic/gdx/utils/FloatArray;->get(I)F

    move-result v0

    sub-float/2addr p1, v0

    iget v0, p0, Lcom/badlogic/gdx/scenes/scene2d/ui/TextArea;->moveOffset:F

    cmpg-float p1, p1, v0

    if-gez p1, :cond_7

    .line 151
    iget p1, p0, Lcom/badlogic/gdx/scenes/scene2d/ui/TextArea;->cursor:I

    add-int/lit8 p1, p1, 0x1

    iput p1, p0, Lcom/badlogic/gdx/scenes/scene2d/ui/TextArea;->cursor:I

    goto :goto_2

    .line 153
    :cond_7
    invoke-virtual {p0}, Lcom/badlogic/gdx/scenes/scene2d/ui/TextArea;->showCursor()V

    :cond_8
    :goto_3
    return-void
.end method

.method public newLineAtEnd()Z
    .locals 3

    .line 125
    iget-object v0, p0, Lcom/badlogic/gdx/scenes/scene2d/ui/TextArea;->text:Ljava/lang/String;

    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v0

    const/4 v1, 0x1

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/badlogic/gdx/scenes/scene2d/ui/TextArea;->text:Ljava/lang/String;

    iget-object v2, p0, Lcom/badlogic/gdx/scenes/scene2d/ui/TextArea;->text:Ljava/lang/String;

    .line 126
    invoke-virtual {v2}, Ljava/lang/String;->length()I

    move-result v2

    sub-int/2addr v2, v1

    invoke-virtual {v0, v2}, Ljava/lang/String;->charAt(I)C

    move-result v0

    const/16 v2, 0xa

    if-eq v0, v2, :cond_1

    iget-object v0, p0, Lcom/badlogic/gdx/scenes/scene2d/ui/TextArea;->text:Ljava/lang/String;

    iget-object v2, p0, Lcom/badlogic/gdx/scenes/scene2d/ui/TextArea;->text:Ljava/lang/String;

    invoke-virtual {v2}, Ljava/lang/String;->length()I

    move-result v2

    sub-int/2addr v2, v1

    invoke-virtual {v0, v2}, Ljava/lang/String;->charAt(I)C

    move-result v0

    const/16 v2, 0xd

    if-ne v0, v2, :cond_0

    goto :goto_0

    :cond_0
    const/4 v1, 0x0

    :cond_1
    :goto_0
    return v1
.end method

.method public setPrefRows(F)V
    .locals 0

    .line 101
    iput p1, p0, Lcom/badlogic/gdx/scenes/scene2d/ui/TextArea;->prefRows:F

    return-void
.end method

.method public setSelection(II)V
    .locals 0

    .line 317
    invoke-super {p0, p1, p2}, Lcom/badlogic/gdx/scenes/scene2d/ui/TextField;->setSelection(II)V

    .line 318
    invoke-virtual {p0}, Lcom/badlogic/gdx/scenes/scene2d/ui/TextArea;->updateCurrentLine()V

    return-void
.end method

.method showCursor()V
    .locals 0

    .line 175
    invoke-virtual {p0}, Lcom/badlogic/gdx/scenes/scene2d/ui/TextArea;->updateCurrentLine()V

    .line 176
    invoke-virtual {p0}, Lcom/badlogic/gdx/scenes/scene2d/ui/TextArea;->updateFirstLineShowing()V

    return-void
.end method

.method protected sizeChanged()V
    .locals 4

    const/4 v0, 0x0

    .line 201
    iput-object v0, p0, Lcom/badlogic/gdx/scenes/scene2d/ui/TextArea;->lastText:Ljava/lang/String;

    .line 204
    iget-object v0, p0, Lcom/badlogic/gdx/scenes/scene2d/ui/TextArea;->style:Lcom/badlogic/gdx/scenes/scene2d/ui/TextField$TextFieldStyle;

    iget-object v0, v0, Lcom/badlogic/gdx/scenes/scene2d/ui/TextField$TextFieldStyle;->font:Lcom/badlogic/gdx/graphics/g2d/BitmapFont;

    .line 205
    iget-object v1, p0, Lcom/badlogic/gdx/scenes/scene2d/ui/TextArea;->style:Lcom/badlogic/gdx/scenes/scene2d/ui/TextField$TextFieldStyle;

    iget-object v1, v1, Lcom/badlogic/gdx/scenes/scene2d/ui/TextField$TextFieldStyle;->background:Lcom/badlogic/gdx/scenes/scene2d/utils/Drawable;

    .line 206
    invoke-virtual {p0}, Lcom/badlogic/gdx/scenes/scene2d/ui/TextArea;->getHeight()F

    move-result v2

    if-nez v1, :cond_0

    const/4 v1, 0x0

    goto :goto_0

    :cond_0
    invoke-interface {v1}, Lcom/badlogic/gdx/scenes/scene2d/utils/Drawable;->getBottomHeight()F

    move-result v3

    invoke-interface {v1}, Lcom/badlogic/gdx/scenes/scene2d/utils/Drawable;->getTopHeight()F

    move-result v1

    add-float/2addr v1, v3

    :goto_0
    sub-float/2addr v2, v1

    .line 207
    invoke-virtual {v0}, Lcom/badlogic/gdx/graphics/g2d/BitmapFont;->getLineHeight()F

    move-result v0

    div-float/2addr v2, v0

    float-to-double v0, v2

    invoke-static {v0, v1}, Ljava/lang/Math;->floor(D)D

    move-result-wide v0

    double-to-int v0, v0

    iput v0, p0, Lcom/badlogic/gdx/scenes/scene2d/ui/TextArea;->linesShowing:I

    return-void
.end method

.method updateCurrentLine()V
    .locals 5

    .line 159
    iget v0, p0, Lcom/badlogic/gdx/scenes/scene2d/ui/TextArea;->cursor:I

    invoke-direct {p0, v0}, Lcom/badlogic/gdx/scenes/scene2d/ui/TextArea;->calculateCurrentLineIndex(I)I

    move-result v0

    .line 160
    div-int/lit8 v1, v0, 0x2

    .line 163
    rem-int/lit8 v2, v0, 0x2

    if-eqz v2, :cond_0

    add-int/lit8 v2, v0, 0x1

    iget-object v3, p0, Lcom/badlogic/gdx/scenes/scene2d/ui/TextArea;->linesBreak:Lcom/badlogic/gdx/utils/IntArray;

    iget v3, v3, Lcom/badlogic/gdx/utils/IntArray;->size:I

    if-ge v2, v3, :cond_0

    iget v3, p0, Lcom/badlogic/gdx/scenes/scene2d/ui/TextArea;->cursor:I

    iget-object v4, p0, Lcom/badlogic/gdx/scenes/scene2d/ui/TextArea;->linesBreak:Lcom/badlogic/gdx/utils/IntArray;

    iget-object v4, v4, Lcom/badlogic/gdx/utils/IntArray;->items:[I

    aget v4, v4, v0

    if-ne v3, v4, :cond_0

    iget-object v3, p0, Lcom/badlogic/gdx/scenes/scene2d/ui/TextArea;->linesBreak:Lcom/badlogic/gdx/utils/IntArray;

    iget-object v3, v3, Lcom/badlogic/gdx/utils/IntArray;->items:[I

    aget v2, v3, v2

    iget-object v3, p0, Lcom/badlogic/gdx/scenes/scene2d/ui/TextArea;->linesBreak:Lcom/badlogic/gdx/utils/IntArray;

    iget-object v3, v3, Lcom/badlogic/gdx/utils/IntArray;->items:[I

    aget v0, v3, v0

    if-eq v2, v0, :cond_2

    .line 165
    :cond_0
    iget-object v0, p0, Lcom/badlogic/gdx/scenes/scene2d/ui/TextArea;->linesBreak:Lcom/badlogic/gdx/utils/IntArray;

    iget v0, v0, Lcom/badlogic/gdx/utils/IntArray;->size:I

    div-int/lit8 v0, v0, 0x2

    if-lt v1, v0, :cond_1

    iget-object v0, p0, Lcom/badlogic/gdx/scenes/scene2d/ui/TextArea;->text:Ljava/lang/String;

    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v0

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/badlogic/gdx/scenes/scene2d/ui/TextArea;->text:Ljava/lang/String;

    iget-object v2, p0, Lcom/badlogic/gdx/scenes/scene2d/ui/TextArea;->text:Ljava/lang/String;

    invoke-virtual {v2}, Ljava/lang/String;->length()I

    move-result v2

    add-int/lit8 v2, v2, -0x1

    invoke-virtual {v0, v2}, Ljava/lang/String;->charAt(I)C

    move-result v0

    const/16 v2, 0xa

    if-eq v0, v2, :cond_1

    iget-object v0, p0, Lcom/badlogic/gdx/scenes/scene2d/ui/TextArea;->text:Ljava/lang/String;

    iget-object v2, p0, Lcom/badlogic/gdx/scenes/scene2d/ui/TextArea;->text:Ljava/lang/String;

    .line 166
    invoke-virtual {v2}, Ljava/lang/String;->length()I

    move-result v2

    add-int/lit8 v2, v2, -0x1

    invoke-virtual {v0, v2}, Ljava/lang/String;->charAt(I)C

    move-result v0

    const/16 v2, 0xd

    if-ne v0, v2, :cond_2

    .line 167
    :cond_1
    iput v1, p0, Lcom/badlogic/gdx/scenes/scene2d/ui/TextArea;->cursorLine:I

    .line 170
    :cond_2
    invoke-virtual {p0}, Lcom/badlogic/gdx/scenes/scene2d/ui/TextArea;->updateFirstLineShowing()V

    return-void
.end method

.method updateFirstLineShowing()V
    .locals 5

    .line 180
    iget v0, p0, Lcom/badlogic/gdx/scenes/scene2d/ui/TextArea;->cursorLine:I

    iget v1, p0, Lcom/badlogic/gdx/scenes/scene2d/ui/TextArea;->firstLineShowing:I

    if-eq v0, v1, :cond_2

    const/4 v2, 0x1

    if-lt v0, v1, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, -0x1

    .line 182
    :goto_0
    iget v1, p0, Lcom/badlogic/gdx/scenes/scene2d/ui/TextArea;->firstLineShowing:I

    iget v3, p0, Lcom/badlogic/gdx/scenes/scene2d/ui/TextArea;->cursorLine:I

    if-gt v1, v3, :cond_1

    iget v4, p0, Lcom/badlogic/gdx/scenes/scene2d/ui/TextArea;->linesShowing:I

    add-int/2addr v1, v4

    sub-int/2addr v1, v2

    if-ge v1, v3, :cond_2

    .line 183
    :cond_1
    iget v1, p0, Lcom/badlogic/gdx/scenes/scene2d/ui/TextArea;->firstLineShowing:I

    add-int/2addr v1, v0

    iput v1, p0, Lcom/badlogic/gdx/scenes/scene2d/ui/TextArea;->firstLineShowing:I

    goto :goto_0

    :cond_2
    return-void
.end method
