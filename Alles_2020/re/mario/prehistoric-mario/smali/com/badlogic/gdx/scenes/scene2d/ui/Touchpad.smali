.class public Lcom/badlogic/gdx/scenes/scene2d/ui/Touchpad;
.super Lcom/badlogic/gdx/scenes/scene2d/ui/Widget;
.source "Touchpad.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/badlogic/gdx/scenes/scene2d/ui/Touchpad$TouchpadStyle;
    }
.end annotation


# instance fields
.field private final deadzoneBounds:Lcom/badlogic/gdx/math/Circle;

.field private deadzoneRadius:F

.field private final knobBounds:Lcom/badlogic/gdx/math/Circle;

.field private final knobPercent:Lcom/badlogic/gdx/math/Vector2;

.field private final knobPosition:Lcom/badlogic/gdx/math/Vector2;

.field resetOnTouchUp:Z

.field private style:Lcom/badlogic/gdx/scenes/scene2d/ui/Touchpad$TouchpadStyle;

.field private final touchBounds:Lcom/badlogic/gdx/math/Circle;

.field touched:Z


# direct methods
.method public constructor <init>(FLcom/badlogic/gdx/scenes/scene2d/ui/Skin;)V
    .locals 1

    .line 52
    const-class v0, Lcom/badlogic/gdx/scenes/scene2d/ui/Touchpad$TouchpadStyle;

    invoke-virtual {p2, v0}, Lcom/badlogic/gdx/scenes/scene2d/ui/Skin;->get(Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object p2

    check-cast p2, Lcom/badlogic/gdx/scenes/scene2d/ui/Touchpad$TouchpadStyle;

    invoke-direct {p0, p1, p2}, Lcom/badlogic/gdx/scenes/scene2d/ui/Touchpad;-><init>(FLcom/badlogic/gdx/scenes/scene2d/ui/Touchpad$TouchpadStyle;)V

    return-void
.end method

.method public constructor <init>(FLcom/badlogic/gdx/scenes/scene2d/ui/Skin;Ljava/lang/String;)V
    .locals 1

    .line 57
    const-class v0, Lcom/badlogic/gdx/scenes/scene2d/ui/Touchpad$TouchpadStyle;

    invoke-virtual {p2, p3, v0}, Lcom/badlogic/gdx/scenes/scene2d/ui/Skin;->get(Ljava/lang/String;Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object p2

    check-cast p2, Lcom/badlogic/gdx/scenes/scene2d/ui/Touchpad$TouchpadStyle;

    invoke-direct {p0, p1, p2}, Lcom/badlogic/gdx/scenes/scene2d/ui/Touchpad;-><init>(FLcom/badlogic/gdx/scenes/scene2d/ui/Touchpad$TouchpadStyle;)V

    return-void
.end method

.method public constructor <init>(FLcom/badlogic/gdx/scenes/scene2d/ui/Touchpad$TouchpadStyle;)V
    .locals 3

    .line 61
    invoke-direct {p0}, Lcom/badlogic/gdx/scenes/scene2d/ui/Widget;-><init>()V

    const/4 v0, 0x1

    .line 42
    iput-boolean v0, p0, Lcom/badlogic/gdx/scenes/scene2d/ui/Touchpad;->resetOnTouchUp:Z

    .line 44
    new-instance v0, Lcom/badlogic/gdx/math/Circle;

    const/4 v1, 0x0

    invoke-direct {v0, v1, v1, v1}, Lcom/badlogic/gdx/math/Circle;-><init>(FFF)V

    iput-object v0, p0, Lcom/badlogic/gdx/scenes/scene2d/ui/Touchpad;->knobBounds:Lcom/badlogic/gdx/math/Circle;

    .line 45
    new-instance v0, Lcom/badlogic/gdx/math/Circle;

    invoke-direct {v0, v1, v1, v1}, Lcom/badlogic/gdx/math/Circle;-><init>(FFF)V

    iput-object v0, p0, Lcom/badlogic/gdx/scenes/scene2d/ui/Touchpad;->touchBounds:Lcom/badlogic/gdx/math/Circle;

    .line 46
    new-instance v0, Lcom/badlogic/gdx/math/Circle;

    invoke-direct {v0, v1, v1, v1}, Lcom/badlogic/gdx/math/Circle;-><init>(FFF)V

    iput-object v0, p0, Lcom/badlogic/gdx/scenes/scene2d/ui/Touchpad;->deadzoneBounds:Lcom/badlogic/gdx/math/Circle;

    .line 47
    new-instance v0, Lcom/badlogic/gdx/math/Vector2;

    invoke-direct {v0}, Lcom/badlogic/gdx/math/Vector2;-><init>()V

    iput-object v0, p0, Lcom/badlogic/gdx/scenes/scene2d/ui/Touchpad;->knobPosition:Lcom/badlogic/gdx/math/Vector2;

    .line 48
    new-instance v0, Lcom/badlogic/gdx/math/Vector2;

    invoke-direct {v0}, Lcom/badlogic/gdx/math/Vector2;-><init>()V

    iput-object v0, p0, Lcom/badlogic/gdx/scenes/scene2d/ui/Touchpad;->knobPercent:Lcom/badlogic/gdx/math/Vector2;

    cmpg-float v0, p1, v1

    if-ltz v0, :cond_0

    .line 63
    iput p1, p0, Lcom/badlogic/gdx/scenes/scene2d/ui/Touchpad;->deadzoneRadius:F

    .line 65
    iget-object p1, p0, Lcom/badlogic/gdx/scenes/scene2d/ui/Touchpad;->knobPosition:Lcom/badlogic/gdx/math/Vector2;

    invoke-virtual {p0}, Lcom/badlogic/gdx/scenes/scene2d/ui/Touchpad;->getWidth()F

    move-result v0

    const/high16 v1, 0x40000000    # 2.0f

    div-float/2addr v0, v1

    invoke-virtual {p0}, Lcom/badlogic/gdx/scenes/scene2d/ui/Touchpad;->getHeight()F

    move-result v2

    div-float/2addr v2, v1

    invoke-virtual {p1, v0, v2}, Lcom/badlogic/gdx/math/Vector2;->set(FF)Lcom/badlogic/gdx/math/Vector2;

    .line 67
    invoke-virtual {p0, p2}, Lcom/badlogic/gdx/scenes/scene2d/ui/Touchpad;->setStyle(Lcom/badlogic/gdx/scenes/scene2d/ui/Touchpad$TouchpadStyle;)V

    .line 68
    invoke-virtual {p0}, Lcom/badlogic/gdx/scenes/scene2d/ui/Touchpad;->getPrefWidth()F

    move-result p1

    invoke-virtual {p0}, Lcom/badlogic/gdx/scenes/scene2d/ui/Touchpad;->getPrefHeight()F

    move-result p2

    invoke-virtual {p0, p1, p2}, Lcom/badlogic/gdx/scenes/scene2d/ui/Touchpad;->setSize(FF)V

    .line 70
    new-instance p1, Lcom/badlogic/gdx/scenes/scene2d/ui/Touchpad$1;

    invoke-direct {p1, p0}, Lcom/badlogic/gdx/scenes/scene2d/ui/Touchpad$1;-><init>(Lcom/badlogic/gdx/scenes/scene2d/ui/Touchpad;)V

    invoke-virtual {p0, p1}, Lcom/badlogic/gdx/scenes/scene2d/ui/Touchpad;->addListener(Lcom/badlogic/gdx/scenes/scene2d/EventListener;)Z

    return-void

    .line 62
    :cond_0
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string p2, "deadzoneRadius must be > 0"

    invoke-direct {p1, p2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1
.end method


# virtual methods
.method calculatePositionAndValue(FFZ)V
    .locals 8

    .line 93
    iget-object v0, p0, Lcom/badlogic/gdx/scenes/scene2d/ui/Touchpad;->knobPosition:Lcom/badlogic/gdx/math/Vector2;

    iget v0, v0, Lcom/badlogic/gdx/math/Vector2;->x:F

    .line 94
    iget-object v1, p0, Lcom/badlogic/gdx/scenes/scene2d/ui/Touchpad;->knobPosition:Lcom/badlogic/gdx/math/Vector2;

    iget v1, v1, Lcom/badlogic/gdx/math/Vector2;->y:F

    .line 95
    iget-object v2, p0, Lcom/badlogic/gdx/scenes/scene2d/ui/Touchpad;->knobPercent:Lcom/badlogic/gdx/math/Vector2;

    iget v2, v2, Lcom/badlogic/gdx/math/Vector2;->x:F

    .line 96
    iget-object v3, p0, Lcom/badlogic/gdx/scenes/scene2d/ui/Touchpad;->knobPercent:Lcom/badlogic/gdx/math/Vector2;

    iget v3, v3, Lcom/badlogic/gdx/math/Vector2;->y:F

    .line 97
    iget-object v4, p0, Lcom/badlogic/gdx/scenes/scene2d/ui/Touchpad;->knobBounds:Lcom/badlogic/gdx/math/Circle;

    iget v4, v4, Lcom/badlogic/gdx/math/Circle;->x:F

    .line 98
    iget-object v5, p0, Lcom/badlogic/gdx/scenes/scene2d/ui/Touchpad;->knobBounds:Lcom/badlogic/gdx/math/Circle;

    iget v5, v5, Lcom/badlogic/gdx/math/Circle;->y:F

    .line 99
    iget-object v6, p0, Lcom/badlogic/gdx/scenes/scene2d/ui/Touchpad;->knobPosition:Lcom/badlogic/gdx/math/Vector2;

    invoke-virtual {v6, v4, v5}, Lcom/badlogic/gdx/math/Vector2;->set(FF)Lcom/badlogic/gdx/math/Vector2;

    .line 100
    iget-object v6, p0, Lcom/badlogic/gdx/scenes/scene2d/ui/Touchpad;->knobPercent:Lcom/badlogic/gdx/math/Vector2;

    const/4 v7, 0x0

    invoke-virtual {v6, v7, v7}, Lcom/badlogic/gdx/math/Vector2;->set(FF)Lcom/badlogic/gdx/math/Vector2;

    if-nez p3, :cond_2

    .line 102
    iget-object p3, p0, Lcom/badlogic/gdx/scenes/scene2d/ui/Touchpad;->deadzoneBounds:Lcom/badlogic/gdx/math/Circle;

    invoke-virtual {p3, p1, p2}, Lcom/badlogic/gdx/math/Circle;->contains(FF)Z

    move-result p3

    if-nez p3, :cond_2

    .line 103
    iget-object p3, p0, Lcom/badlogic/gdx/scenes/scene2d/ui/Touchpad;->knobPercent:Lcom/badlogic/gdx/math/Vector2;

    sub-float v4, p1, v4

    iget-object v6, p0, Lcom/badlogic/gdx/scenes/scene2d/ui/Touchpad;->knobBounds:Lcom/badlogic/gdx/math/Circle;

    iget v6, v6, Lcom/badlogic/gdx/math/Circle;->radius:F

    div-float/2addr v4, v6

    sub-float v5, p2, v5

    iget-object v6, p0, Lcom/badlogic/gdx/scenes/scene2d/ui/Touchpad;->knobBounds:Lcom/badlogic/gdx/math/Circle;

    iget v6, v6, Lcom/badlogic/gdx/math/Circle;->radius:F

    div-float/2addr v5, v6

    invoke-virtual {p3, v4, v5}, Lcom/badlogic/gdx/math/Vector2;->set(FF)Lcom/badlogic/gdx/math/Vector2;

    .line 104
    iget-object p3, p0, Lcom/badlogic/gdx/scenes/scene2d/ui/Touchpad;->knobPercent:Lcom/badlogic/gdx/math/Vector2;

    invoke-virtual {p3}, Lcom/badlogic/gdx/math/Vector2;->len()F

    move-result p3

    const/high16 v4, 0x3f800000    # 1.0f

    cmpl-float v5, p3, v4

    if-lez v5, :cond_0

    .line 105
    iget-object v5, p0, Lcom/badlogic/gdx/scenes/scene2d/ui/Touchpad;->knobPercent:Lcom/badlogic/gdx/math/Vector2;

    div-float/2addr v4, p3

    invoke-virtual {v5, v4}, Lcom/badlogic/gdx/math/Vector2;->scl(F)Lcom/badlogic/gdx/math/Vector2;

    .line 106
    :cond_0
    iget-object p3, p0, Lcom/badlogic/gdx/scenes/scene2d/ui/Touchpad;->knobBounds:Lcom/badlogic/gdx/math/Circle;

    invoke-virtual {p3, p1, p2}, Lcom/badlogic/gdx/math/Circle;->contains(FF)Z

    move-result p3

    if-eqz p3, :cond_1

    .line 107
    iget-object p3, p0, Lcom/badlogic/gdx/scenes/scene2d/ui/Touchpad;->knobPosition:Lcom/badlogic/gdx/math/Vector2;

    invoke-virtual {p3, p1, p2}, Lcom/badlogic/gdx/math/Vector2;->set(FF)Lcom/badlogic/gdx/math/Vector2;

    goto :goto_0

    .line 109
    :cond_1
    iget-object p1, p0, Lcom/badlogic/gdx/scenes/scene2d/ui/Touchpad;->knobPosition:Lcom/badlogic/gdx/math/Vector2;

    iget-object p2, p0, Lcom/badlogic/gdx/scenes/scene2d/ui/Touchpad;->knobPercent:Lcom/badlogic/gdx/math/Vector2;

    invoke-virtual {p1, p2}, Lcom/badlogic/gdx/math/Vector2;->set(Lcom/badlogic/gdx/math/Vector2;)Lcom/badlogic/gdx/math/Vector2;

    move-result-object p1

    invoke-virtual {p1}, Lcom/badlogic/gdx/math/Vector2;->nor()Lcom/badlogic/gdx/math/Vector2;

    move-result-object p1

    iget-object p2, p0, Lcom/badlogic/gdx/scenes/scene2d/ui/Touchpad;->knobBounds:Lcom/badlogic/gdx/math/Circle;

    iget p2, p2, Lcom/badlogic/gdx/math/Circle;->radius:F

    invoke-virtual {p1, p2}, Lcom/badlogic/gdx/math/Vector2;->scl(F)Lcom/badlogic/gdx/math/Vector2;

    move-result-object p1

    iget-object p2, p0, Lcom/badlogic/gdx/scenes/scene2d/ui/Touchpad;->knobBounds:Lcom/badlogic/gdx/math/Circle;

    iget p2, p2, Lcom/badlogic/gdx/math/Circle;->x:F

    iget-object p3, p0, Lcom/badlogic/gdx/scenes/scene2d/ui/Touchpad;->knobBounds:Lcom/badlogic/gdx/math/Circle;

    iget p3, p3, Lcom/badlogic/gdx/math/Circle;->y:F

    invoke-virtual {p1, p2, p3}, Lcom/badlogic/gdx/math/Vector2;->add(FF)Lcom/badlogic/gdx/math/Vector2;

    .line 113
    :cond_2
    :goto_0
    iget-object p1, p0, Lcom/badlogic/gdx/scenes/scene2d/ui/Touchpad;->knobPercent:Lcom/badlogic/gdx/math/Vector2;

    iget p1, p1, Lcom/badlogic/gdx/math/Vector2;->x:F

    cmpl-float p1, v2, p1

    if-nez p1, :cond_3

    iget-object p1, p0, Lcom/badlogic/gdx/scenes/scene2d/ui/Touchpad;->knobPercent:Lcom/badlogic/gdx/math/Vector2;

    iget p1, p1, Lcom/badlogic/gdx/math/Vector2;->y:F

    cmpl-float p1, v3, p1

    if-eqz p1, :cond_5

    .line 114
    :cond_3
    const-class p1, Lcom/badlogic/gdx/scenes/scene2d/utils/ChangeListener$ChangeEvent;

    invoke-static {p1}, Lcom/badlogic/gdx/utils/Pools;->obtain(Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lcom/badlogic/gdx/scenes/scene2d/utils/ChangeListener$ChangeEvent;

    .line 115
    invoke-virtual {p0, p1}, Lcom/badlogic/gdx/scenes/scene2d/ui/Touchpad;->fire(Lcom/badlogic/gdx/scenes/scene2d/Event;)Z

    move-result p2

    if-eqz p2, :cond_4

    .line 116
    iget-object p2, p0, Lcom/badlogic/gdx/scenes/scene2d/ui/Touchpad;->knobPercent:Lcom/badlogic/gdx/math/Vector2;

    invoke-virtual {p2, v2, v3}, Lcom/badlogic/gdx/math/Vector2;->set(FF)Lcom/badlogic/gdx/math/Vector2;

    .line 117
    iget-object p2, p0, Lcom/badlogic/gdx/scenes/scene2d/ui/Touchpad;->knobPosition:Lcom/badlogic/gdx/math/Vector2;

    invoke-virtual {p2, v0, v1}, Lcom/badlogic/gdx/math/Vector2;->set(FF)Lcom/badlogic/gdx/math/Vector2;

    .line 119
    :cond_4
    invoke-static {p1}, Lcom/badlogic/gdx/utils/Pools;->free(Ljava/lang/Object;)V

    :cond_5
    return-void
.end method

.method public draw(Lcom/badlogic/gdx/graphics/g2d/Batch;F)V
    .locals 10

    .line 159
    invoke-virtual {p0}, Lcom/badlogic/gdx/scenes/scene2d/ui/Touchpad;->validate()V

    .line 161
    invoke-virtual {p0}, Lcom/badlogic/gdx/scenes/scene2d/ui/Touchpad;->getColor()Lcom/badlogic/gdx/graphics/Color;

    move-result-object v0

    .line 162
    iget v1, v0, Lcom/badlogic/gdx/graphics/Color;->r:F

    iget v2, v0, Lcom/badlogic/gdx/graphics/Color;->g:F

    iget v3, v0, Lcom/badlogic/gdx/graphics/Color;->b:F

    iget v0, v0, Lcom/badlogic/gdx/graphics/Color;->a:F

    mul-float v0, v0, p2

    invoke-interface {p1, v1, v2, v3, v0}, Lcom/badlogic/gdx/graphics/g2d/Batch;->setColor(FFFF)V

    .line 164
    invoke-virtual {p0}, Lcom/badlogic/gdx/scenes/scene2d/ui/Touchpad;->getX()F

    move-result p2

    .line 165
    invoke-virtual {p0}, Lcom/badlogic/gdx/scenes/scene2d/ui/Touchpad;->getY()F

    move-result v0

    .line 166
    invoke-virtual {p0}, Lcom/badlogic/gdx/scenes/scene2d/ui/Touchpad;->getWidth()F

    move-result v8

    .line 167
    invoke-virtual {p0}, Lcom/badlogic/gdx/scenes/scene2d/ui/Touchpad;->getHeight()F

    move-result v9

    .line 169
    iget-object v1, p0, Lcom/badlogic/gdx/scenes/scene2d/ui/Touchpad;->style:Lcom/badlogic/gdx/scenes/scene2d/ui/Touchpad$TouchpadStyle;

    iget-object v4, v1, Lcom/badlogic/gdx/scenes/scene2d/ui/Touchpad$TouchpadStyle;->background:Lcom/badlogic/gdx/scenes/scene2d/utils/Drawable;

    if-eqz v4, :cond_0

    move-object v5, p1

    move v6, p2

    move v7, v0

    .line 170
    invoke-interface/range {v4 .. v9}, Lcom/badlogic/gdx/scenes/scene2d/utils/Drawable;->draw(Lcom/badlogic/gdx/graphics/g2d/Batch;FFFF)V

    .line 172
    :cond_0
    iget-object v1, p0, Lcom/badlogic/gdx/scenes/scene2d/ui/Touchpad;->style:Lcom/badlogic/gdx/scenes/scene2d/ui/Touchpad$TouchpadStyle;

    iget-object v2, v1, Lcom/badlogic/gdx/scenes/scene2d/ui/Touchpad$TouchpadStyle;->knob:Lcom/badlogic/gdx/scenes/scene2d/utils/Drawable;

    if-eqz v2, :cond_1

    .line 174
    iget-object v1, p0, Lcom/badlogic/gdx/scenes/scene2d/ui/Touchpad;->knobPosition:Lcom/badlogic/gdx/math/Vector2;

    iget v1, v1, Lcom/badlogic/gdx/math/Vector2;->x:F

    invoke-interface {v2}, Lcom/badlogic/gdx/scenes/scene2d/utils/Drawable;->getMinWidth()F

    move-result v3

    const/high16 v4, 0x40000000    # 2.0f

    div-float/2addr v3, v4

    sub-float/2addr v1, v3

    add-float/2addr p2, v1

    .line 175
    iget-object v1, p0, Lcom/badlogic/gdx/scenes/scene2d/ui/Touchpad;->knobPosition:Lcom/badlogic/gdx/math/Vector2;

    iget v1, v1, Lcom/badlogic/gdx/math/Vector2;->y:F

    invoke-interface {v2}, Lcom/badlogic/gdx/scenes/scene2d/utils/Drawable;->getMinHeight()F

    move-result v3

    div-float/2addr v3, v4

    sub-float/2addr v1, v3

    add-float v5, v0, v1

    .line 176
    invoke-interface {v2}, Lcom/badlogic/gdx/scenes/scene2d/utils/Drawable;->getMinWidth()F

    move-result v6

    invoke-interface {v2}, Lcom/badlogic/gdx/scenes/scene2d/utils/Drawable;->getMinHeight()F

    move-result v7

    move-object v3, p1

    move v4, p2

    invoke-interface/range {v2 .. v7}, Lcom/badlogic/gdx/scenes/scene2d/utils/Drawable;->draw(Lcom/badlogic/gdx/graphics/g2d/Batch;FFFF)V

    :cond_1
    return-void
.end method

.method public getKnobPercentX()F
    .locals 1

    .line 223
    iget-object v0, p0, Lcom/badlogic/gdx/scenes/scene2d/ui/Touchpad;->knobPercent:Lcom/badlogic/gdx/math/Vector2;

    iget v0, v0, Lcom/badlogic/gdx/math/Vector2;->x:F

    return v0
.end method

.method public getKnobPercentY()F
    .locals 1

    .line 229
    iget-object v0, p0, Lcom/badlogic/gdx/scenes/scene2d/ui/Touchpad;->knobPercent:Lcom/badlogic/gdx/math/Vector2;

    iget v0, v0, Lcom/badlogic/gdx/math/Vector2;->y:F

    return v0
.end method

.method public getKnobX()F
    .locals 1

    .line 212
    iget-object v0, p0, Lcom/badlogic/gdx/scenes/scene2d/ui/Touchpad;->knobPosition:Lcom/badlogic/gdx/math/Vector2;

    iget v0, v0, Lcom/badlogic/gdx/math/Vector2;->x:F

    return v0
.end method

.method public getKnobY()F
    .locals 1

    .line 217
    iget-object v0, p0, Lcom/badlogic/gdx/scenes/scene2d/ui/Touchpad;->knobPosition:Lcom/badlogic/gdx/math/Vector2;

    iget v0, v0, Lcom/badlogic/gdx/math/Vector2;->y:F

    return v0
.end method

.method public getPrefHeight()F
    .locals 1

    .line 187
    iget-object v0, p0, Lcom/badlogic/gdx/scenes/scene2d/ui/Touchpad;->style:Lcom/badlogic/gdx/scenes/scene2d/ui/Touchpad$TouchpadStyle;

    iget-object v0, v0, Lcom/badlogic/gdx/scenes/scene2d/ui/Touchpad$TouchpadStyle;->background:Lcom/badlogic/gdx/scenes/scene2d/utils/Drawable;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/badlogic/gdx/scenes/scene2d/ui/Touchpad;->style:Lcom/badlogic/gdx/scenes/scene2d/ui/Touchpad$TouchpadStyle;

    iget-object v0, v0, Lcom/badlogic/gdx/scenes/scene2d/ui/Touchpad$TouchpadStyle;->background:Lcom/badlogic/gdx/scenes/scene2d/utils/Drawable;

    invoke-interface {v0}, Lcom/badlogic/gdx/scenes/scene2d/utils/Drawable;->getMinHeight()F

    move-result v0

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method public getPrefWidth()F
    .locals 1

    .line 182
    iget-object v0, p0, Lcom/badlogic/gdx/scenes/scene2d/ui/Touchpad;->style:Lcom/badlogic/gdx/scenes/scene2d/ui/Touchpad$TouchpadStyle;

    iget-object v0, v0, Lcom/badlogic/gdx/scenes/scene2d/ui/Touchpad$TouchpadStyle;->background:Lcom/badlogic/gdx/scenes/scene2d/utils/Drawable;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/badlogic/gdx/scenes/scene2d/ui/Touchpad;->style:Lcom/badlogic/gdx/scenes/scene2d/ui/Touchpad$TouchpadStyle;

    iget-object v0, v0, Lcom/badlogic/gdx/scenes/scene2d/ui/Touchpad$TouchpadStyle;->background:Lcom/badlogic/gdx/scenes/scene2d/utils/Drawable;

    invoke-interface {v0}, Lcom/badlogic/gdx/scenes/scene2d/utils/Drawable;->getMinWidth()F

    move-result v0

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method public getResetOnTouchUp()Z
    .locals 1

    .line 195
    iget-boolean v0, p0, Lcom/badlogic/gdx/scenes/scene2d/ui/Touchpad;->resetOnTouchUp:Z

    return v0
.end method

.method public getStyle()Lcom/badlogic/gdx/scenes/scene2d/ui/Touchpad$TouchpadStyle;
    .locals 1

    .line 132
    iget-object v0, p0, Lcom/badlogic/gdx/scenes/scene2d/ui/Touchpad;->style:Lcom/badlogic/gdx/scenes/scene2d/ui/Touchpad$TouchpadStyle;

    return-object v0
.end method

.method public hit(FFZ)Lcom/badlogic/gdx/scenes/scene2d/Actor;
    .locals 2

    const/4 v0, 0x0

    if-eqz p3, :cond_0

    .line 137
    invoke-virtual {p0}, Lcom/badlogic/gdx/scenes/scene2d/ui/Touchpad;->getTouchable()Lcom/badlogic/gdx/scenes/scene2d/Touchable;

    move-result-object p3

    sget-object v1, Lcom/badlogic/gdx/scenes/scene2d/Touchable;->enabled:Lcom/badlogic/gdx/scenes/scene2d/Touchable;

    if-eq p3, v1, :cond_0

    return-object v0

    .line 138
    :cond_0
    invoke-virtual {p0}, Lcom/badlogic/gdx/scenes/scene2d/ui/Touchpad;->isVisible()Z

    move-result p3

    if-nez p3, :cond_1

    return-object v0

    .line 139
    :cond_1
    iget-object p3, p0, Lcom/badlogic/gdx/scenes/scene2d/ui/Touchpad;->touchBounds:Lcom/badlogic/gdx/math/Circle;

    invoke-virtual {p3, p1, p2}, Lcom/badlogic/gdx/math/Circle;->contains(FF)Z

    move-result p1

    if-eqz p1, :cond_2

    move-object v0, p0

    :cond_2
    return-object v0
.end method

.method public isTouched()Z
    .locals 1

    .line 191
    iget-boolean v0, p0, Lcom/badlogic/gdx/scenes/scene2d/ui/Touchpad;->touched:Z

    return v0
.end method

.method public layout()V
    .locals 6

    .line 145
    invoke-virtual {p0}, Lcom/badlogic/gdx/scenes/scene2d/ui/Touchpad;->getWidth()F

    move-result v0

    const/high16 v1, 0x40000000    # 2.0f

    div-float/2addr v0, v1

    .line 146
    invoke-virtual {p0}, Lcom/badlogic/gdx/scenes/scene2d/ui/Touchpad;->getHeight()F

    move-result v2

    div-float/2addr v2, v1

    .line 147
    invoke-static {v0, v2}, Ljava/lang/Math;->min(FF)F

    move-result v3

    .line 148
    iget-object v4, p0, Lcom/badlogic/gdx/scenes/scene2d/ui/Touchpad;->touchBounds:Lcom/badlogic/gdx/math/Circle;

    invoke-virtual {v4, v0, v2, v3}, Lcom/badlogic/gdx/math/Circle;->set(FFF)V

    .line 149
    iget-object v4, p0, Lcom/badlogic/gdx/scenes/scene2d/ui/Touchpad;->style:Lcom/badlogic/gdx/scenes/scene2d/ui/Touchpad$TouchpadStyle;

    iget-object v4, v4, Lcom/badlogic/gdx/scenes/scene2d/ui/Touchpad$TouchpadStyle;->knob:Lcom/badlogic/gdx/scenes/scene2d/utils/Drawable;

    if-eqz v4, :cond_0

    iget-object v4, p0, Lcom/badlogic/gdx/scenes/scene2d/ui/Touchpad;->style:Lcom/badlogic/gdx/scenes/scene2d/ui/Touchpad$TouchpadStyle;

    iget-object v4, v4, Lcom/badlogic/gdx/scenes/scene2d/ui/Touchpad$TouchpadStyle;->knob:Lcom/badlogic/gdx/scenes/scene2d/utils/Drawable;

    invoke-interface {v4}, Lcom/badlogic/gdx/scenes/scene2d/utils/Drawable;->getMinWidth()F

    move-result v4

    iget-object v5, p0, Lcom/badlogic/gdx/scenes/scene2d/ui/Touchpad;->style:Lcom/badlogic/gdx/scenes/scene2d/ui/Touchpad$TouchpadStyle;

    iget-object v5, v5, Lcom/badlogic/gdx/scenes/scene2d/ui/Touchpad$TouchpadStyle;->knob:Lcom/badlogic/gdx/scenes/scene2d/utils/Drawable;

    invoke-interface {v5}, Lcom/badlogic/gdx/scenes/scene2d/utils/Drawable;->getMinHeight()F

    move-result v5

    invoke-static {v4, v5}, Ljava/lang/Math;->max(FF)F

    move-result v4

    div-float/2addr v4, v1

    sub-float/2addr v3, v4

    .line 150
    :cond_0
    iget-object v1, p0, Lcom/badlogic/gdx/scenes/scene2d/ui/Touchpad;->knobBounds:Lcom/badlogic/gdx/math/Circle;

    invoke-virtual {v1, v0, v2, v3}, Lcom/badlogic/gdx/math/Circle;->set(FFF)V

    .line 151
    iget-object v1, p0, Lcom/badlogic/gdx/scenes/scene2d/ui/Touchpad;->deadzoneBounds:Lcom/badlogic/gdx/math/Circle;

    iget v3, p0, Lcom/badlogic/gdx/scenes/scene2d/ui/Touchpad;->deadzoneRadius:F

    invoke-virtual {v1, v0, v2, v3}, Lcom/badlogic/gdx/math/Circle;->set(FFF)V

    .line 153
    iget-object v1, p0, Lcom/badlogic/gdx/scenes/scene2d/ui/Touchpad;->knobPosition:Lcom/badlogic/gdx/math/Vector2;

    invoke-virtual {v1, v0, v2}, Lcom/badlogic/gdx/math/Vector2;->set(FF)Lcom/badlogic/gdx/math/Vector2;

    .line 154
    iget-object v0, p0, Lcom/badlogic/gdx/scenes/scene2d/ui/Touchpad;->knobPercent:Lcom/badlogic/gdx/math/Vector2;

    const/4 v1, 0x0

    invoke-virtual {v0, v1, v1}, Lcom/badlogic/gdx/math/Vector2;->set(FF)Lcom/badlogic/gdx/math/Vector2;

    return-void
.end method

.method public setDeadzone(F)V
    .locals 1

    const/4 v0, 0x0

    cmpg-float v0, p1, v0

    if-ltz v0, :cond_0

    .line 206
    iput p1, p0, Lcom/badlogic/gdx/scenes/scene2d/ui/Touchpad;->deadzoneRadius:F

    .line 207
    invoke-virtual {p0}, Lcom/badlogic/gdx/scenes/scene2d/ui/Touchpad;->invalidate()V

    return-void

    .line 205
    :cond_0
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string v0, "deadzoneRadius must be > 0"

    invoke-direct {p1, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method public setResetOnTouchUp(Z)V
    .locals 0

    .line 200
    iput-boolean p1, p0, Lcom/badlogic/gdx/scenes/scene2d/ui/Touchpad;->resetOnTouchUp:Z

    return-void
.end method

.method public setStyle(Lcom/badlogic/gdx/scenes/scene2d/ui/Touchpad$TouchpadStyle;)V
    .locals 1

    if-eqz p1, :cond_0

    .line 125
    iput-object p1, p0, Lcom/badlogic/gdx/scenes/scene2d/ui/Touchpad;->style:Lcom/badlogic/gdx/scenes/scene2d/ui/Touchpad$TouchpadStyle;

    .line 126
    invoke-virtual {p0}, Lcom/badlogic/gdx/scenes/scene2d/ui/Touchpad;->invalidateHierarchy()V

    return-void

    .line 124
    :cond_0
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string v0, "style cannot be null"

    invoke-direct {p1, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1
.end method
