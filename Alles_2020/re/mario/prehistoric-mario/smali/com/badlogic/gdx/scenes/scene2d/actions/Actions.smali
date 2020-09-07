.class public Lcom/badlogic/gdx/scenes/scene2d/actions/Actions;
.super Ljava/lang/Object;
.source "Actions.java"


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 30
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static action(Ljava/lang/Class;)Lcom/badlogic/gdx/scenes/scene2d/Action;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Lcom/badlogic/gdx/scenes/scene2d/Action;",
            ">(",
            "Ljava/lang/Class<",
            "TT;>;)TT;"
        }
    .end annotation

    .line 33
    invoke-static {p0}, Lcom/badlogic/gdx/utils/Pools;->get(Ljava/lang/Class;)Lcom/badlogic/gdx/utils/Pool;

    move-result-object p0

    .line 34
    invoke-virtual {p0}, Lcom/badlogic/gdx/utils/Pool;->obtain()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/badlogic/gdx/scenes/scene2d/Action;

    .line 35
    invoke-virtual {v0, p0}, Lcom/badlogic/gdx/scenes/scene2d/Action;->setPool(Lcom/badlogic/gdx/utils/Pool;)V

    return-object v0
.end method

.method public static addAction(Lcom/badlogic/gdx/scenes/scene2d/Action;)Lcom/badlogic/gdx/scenes/scene2d/actions/AddAction;
    .locals 1

    .line 40
    const-class v0, Lcom/badlogic/gdx/scenes/scene2d/actions/AddAction;

    invoke-static {v0}, Lcom/badlogic/gdx/scenes/scene2d/actions/Actions;->action(Ljava/lang/Class;)Lcom/badlogic/gdx/scenes/scene2d/Action;

    move-result-object v0

    check-cast v0, Lcom/badlogic/gdx/scenes/scene2d/actions/AddAction;

    .line 41
    invoke-virtual {v0, p0}, Lcom/badlogic/gdx/scenes/scene2d/actions/AddAction;->setAction(Lcom/badlogic/gdx/scenes/scene2d/Action;)V

    return-object v0
.end method

.method public static addAction(Lcom/badlogic/gdx/scenes/scene2d/Action;Lcom/badlogic/gdx/scenes/scene2d/Actor;)Lcom/badlogic/gdx/scenes/scene2d/actions/AddAction;
    .locals 1

    .line 46
    const-class v0, Lcom/badlogic/gdx/scenes/scene2d/actions/AddAction;

    invoke-static {v0}, Lcom/badlogic/gdx/scenes/scene2d/actions/Actions;->action(Ljava/lang/Class;)Lcom/badlogic/gdx/scenes/scene2d/Action;

    move-result-object v0

    check-cast v0, Lcom/badlogic/gdx/scenes/scene2d/actions/AddAction;

    .line 47
    invoke-virtual {v0, p1}, Lcom/badlogic/gdx/scenes/scene2d/actions/AddAction;->setTarget(Lcom/badlogic/gdx/scenes/scene2d/Actor;)V

    .line 48
    invoke-virtual {v0, p0}, Lcom/badlogic/gdx/scenes/scene2d/actions/AddAction;->setAction(Lcom/badlogic/gdx/scenes/scene2d/Action;)V

    return-object v0
.end method

.method public static addListener(Lcom/badlogic/gdx/scenes/scene2d/EventListener;Z)Lcom/badlogic/gdx/scenes/scene2d/actions/AddListenerAction;
    .locals 1

    .line 468
    const-class v0, Lcom/badlogic/gdx/scenes/scene2d/actions/AddListenerAction;

    invoke-static {v0}, Lcom/badlogic/gdx/scenes/scene2d/actions/Actions;->action(Ljava/lang/Class;)Lcom/badlogic/gdx/scenes/scene2d/Action;

    move-result-object v0

    check-cast v0, Lcom/badlogic/gdx/scenes/scene2d/actions/AddListenerAction;

    .line 469
    invoke-virtual {v0, p0}, Lcom/badlogic/gdx/scenes/scene2d/actions/AddListenerAction;->setListener(Lcom/badlogic/gdx/scenes/scene2d/EventListener;)V

    .line 470
    invoke-virtual {v0, p1}, Lcom/badlogic/gdx/scenes/scene2d/actions/AddListenerAction;->setCapture(Z)V

    return-object v0
.end method

.method public static addListener(Lcom/badlogic/gdx/scenes/scene2d/EventListener;ZLcom/badlogic/gdx/scenes/scene2d/Actor;)Lcom/badlogic/gdx/scenes/scene2d/actions/AddListenerAction;
    .locals 1

    .line 475
    const-class v0, Lcom/badlogic/gdx/scenes/scene2d/actions/AddListenerAction;

    invoke-static {v0}, Lcom/badlogic/gdx/scenes/scene2d/actions/Actions;->action(Ljava/lang/Class;)Lcom/badlogic/gdx/scenes/scene2d/Action;

    move-result-object v0

    check-cast v0, Lcom/badlogic/gdx/scenes/scene2d/actions/AddListenerAction;

    .line 476
    invoke-virtual {v0, p2}, Lcom/badlogic/gdx/scenes/scene2d/actions/AddListenerAction;->setTarget(Lcom/badlogic/gdx/scenes/scene2d/Actor;)V

    .line 477
    invoke-virtual {v0, p0}, Lcom/badlogic/gdx/scenes/scene2d/actions/AddListenerAction;->setListener(Lcom/badlogic/gdx/scenes/scene2d/EventListener;)V

    .line 478
    invoke-virtual {v0, p1}, Lcom/badlogic/gdx/scenes/scene2d/actions/AddListenerAction;->setCapture(Z)V

    return-object v0
.end method

.method public static after(Lcom/badlogic/gdx/scenes/scene2d/Action;)Lcom/badlogic/gdx/scenes/scene2d/actions/AfterAction;
    .locals 1

    .line 462
    const-class v0, Lcom/badlogic/gdx/scenes/scene2d/actions/AfterAction;

    invoke-static {v0}, Lcom/badlogic/gdx/scenes/scene2d/actions/Actions;->action(Ljava/lang/Class;)Lcom/badlogic/gdx/scenes/scene2d/Action;

    move-result-object v0

    check-cast v0, Lcom/badlogic/gdx/scenes/scene2d/actions/AfterAction;

    .line 463
    invoke-virtual {v0, p0}, Lcom/badlogic/gdx/scenes/scene2d/actions/AfterAction;->setAction(Lcom/badlogic/gdx/scenes/scene2d/Action;)V

    return-object v0
.end method

.method public static alpha(F)Lcom/badlogic/gdx/scenes/scene2d/actions/AlphaAction;
    .locals 2

    const/4 v0, 0x0

    const/4 v1, 0x0

    .line 238
    invoke-static {p0, v0, v1}, Lcom/badlogic/gdx/scenes/scene2d/actions/Actions;->alpha(FFLcom/badlogic/gdx/math/Interpolation;)Lcom/badlogic/gdx/scenes/scene2d/actions/AlphaAction;

    move-result-object p0

    return-object p0
.end method

.method public static alpha(FF)Lcom/badlogic/gdx/scenes/scene2d/actions/AlphaAction;
    .locals 1

    const/4 v0, 0x0

    .line 243
    invoke-static {p0, p1, v0}, Lcom/badlogic/gdx/scenes/scene2d/actions/Actions;->alpha(FFLcom/badlogic/gdx/math/Interpolation;)Lcom/badlogic/gdx/scenes/scene2d/actions/AlphaAction;

    move-result-object p0

    return-object p0
.end method

.method public static alpha(FFLcom/badlogic/gdx/math/Interpolation;)Lcom/badlogic/gdx/scenes/scene2d/actions/AlphaAction;
    .locals 1

    .line 248
    const-class v0, Lcom/badlogic/gdx/scenes/scene2d/actions/AlphaAction;

    invoke-static {v0}, Lcom/badlogic/gdx/scenes/scene2d/actions/Actions;->action(Ljava/lang/Class;)Lcom/badlogic/gdx/scenes/scene2d/Action;

    move-result-object v0

    check-cast v0, Lcom/badlogic/gdx/scenes/scene2d/actions/AlphaAction;

    .line 249
    invoke-virtual {v0, p0}, Lcom/badlogic/gdx/scenes/scene2d/actions/AlphaAction;->setAlpha(F)V

    .line 250
    invoke-virtual {v0, p1}, Lcom/badlogic/gdx/scenes/scene2d/actions/AlphaAction;->setDuration(F)V

    .line 251
    invoke-virtual {v0, p2}, Lcom/badlogic/gdx/scenes/scene2d/actions/AlphaAction;->setInterpolation(Lcom/badlogic/gdx/math/Interpolation;)V

    return-object v0
.end method

.method public static color(Lcom/badlogic/gdx/graphics/Color;)Lcom/badlogic/gdx/scenes/scene2d/actions/ColorAction;
    .locals 2

    const/4 v0, 0x0

    const/4 v1, 0x0

    .line 219
    invoke-static {p0, v0, v1}, Lcom/badlogic/gdx/scenes/scene2d/actions/Actions;->color(Lcom/badlogic/gdx/graphics/Color;FLcom/badlogic/gdx/math/Interpolation;)Lcom/badlogic/gdx/scenes/scene2d/actions/ColorAction;

    move-result-object p0

    return-object p0
.end method

.method public static color(Lcom/badlogic/gdx/graphics/Color;F)Lcom/badlogic/gdx/scenes/scene2d/actions/ColorAction;
    .locals 1

    const/4 v0, 0x0

    .line 224
    invoke-static {p0, p1, v0}, Lcom/badlogic/gdx/scenes/scene2d/actions/Actions;->color(Lcom/badlogic/gdx/graphics/Color;FLcom/badlogic/gdx/math/Interpolation;)Lcom/badlogic/gdx/scenes/scene2d/actions/ColorAction;

    move-result-object p0

    return-object p0
.end method

.method public static color(Lcom/badlogic/gdx/graphics/Color;FLcom/badlogic/gdx/math/Interpolation;)Lcom/badlogic/gdx/scenes/scene2d/actions/ColorAction;
    .locals 1

    .line 229
    const-class v0, Lcom/badlogic/gdx/scenes/scene2d/actions/ColorAction;

    invoke-static {v0}, Lcom/badlogic/gdx/scenes/scene2d/actions/Actions;->action(Ljava/lang/Class;)Lcom/badlogic/gdx/scenes/scene2d/Action;

    move-result-object v0

    check-cast v0, Lcom/badlogic/gdx/scenes/scene2d/actions/ColorAction;

    .line 230
    invoke-virtual {v0, p0}, Lcom/badlogic/gdx/scenes/scene2d/actions/ColorAction;->setEndColor(Lcom/badlogic/gdx/graphics/Color;)V

    .line 231
    invoke-virtual {v0, p1}, Lcom/badlogic/gdx/scenes/scene2d/actions/ColorAction;->setDuration(F)V

    .line 232
    invoke-virtual {v0, p2}, Lcom/badlogic/gdx/scenes/scene2d/actions/ColorAction;->setInterpolation(Lcom/badlogic/gdx/math/Interpolation;)V

    return-object v0
.end method

.method public static delay(F)Lcom/badlogic/gdx/scenes/scene2d/actions/DelayAction;
    .locals 1

    .line 314
    const-class v0, Lcom/badlogic/gdx/scenes/scene2d/actions/DelayAction;

    invoke-static {v0}, Lcom/badlogic/gdx/scenes/scene2d/actions/Actions;->action(Ljava/lang/Class;)Lcom/badlogic/gdx/scenes/scene2d/Action;

    move-result-object v0

    check-cast v0, Lcom/badlogic/gdx/scenes/scene2d/actions/DelayAction;

    .line 315
    invoke-virtual {v0, p0}, Lcom/badlogic/gdx/scenes/scene2d/actions/DelayAction;->setDuration(F)V

    return-object v0
.end method

.method public static delay(FLcom/badlogic/gdx/scenes/scene2d/Action;)Lcom/badlogic/gdx/scenes/scene2d/actions/DelayAction;
    .locals 1

    .line 320
    const-class v0, Lcom/badlogic/gdx/scenes/scene2d/actions/DelayAction;

    invoke-static {v0}, Lcom/badlogic/gdx/scenes/scene2d/actions/Actions;->action(Ljava/lang/Class;)Lcom/badlogic/gdx/scenes/scene2d/Action;

    move-result-object v0

    check-cast v0, Lcom/badlogic/gdx/scenes/scene2d/actions/DelayAction;

    .line 321
    invoke-virtual {v0, p0}, Lcom/badlogic/gdx/scenes/scene2d/actions/DelayAction;->setDuration(F)V

    .line 322
    invoke-virtual {v0, p1}, Lcom/badlogic/gdx/scenes/scene2d/actions/DelayAction;->setAction(Lcom/badlogic/gdx/scenes/scene2d/Action;)V

    return-object v0
.end method

.method public static fadeIn(F)Lcom/badlogic/gdx/scenes/scene2d/actions/AlphaAction;
    .locals 2

    const/high16 v0, 0x3f800000    # 1.0f

    const/4 v1, 0x0

    .line 271
    invoke-static {v0, p0, v1}, Lcom/badlogic/gdx/scenes/scene2d/actions/Actions;->alpha(FFLcom/badlogic/gdx/math/Interpolation;)Lcom/badlogic/gdx/scenes/scene2d/actions/AlphaAction;

    move-result-object p0

    return-object p0
.end method

.method public static fadeIn(FLcom/badlogic/gdx/math/Interpolation;)Lcom/badlogic/gdx/scenes/scene2d/actions/AlphaAction;
    .locals 2

    .line 276
    const-class v0, Lcom/badlogic/gdx/scenes/scene2d/actions/AlphaAction;

    invoke-static {v0}, Lcom/badlogic/gdx/scenes/scene2d/actions/Actions;->action(Ljava/lang/Class;)Lcom/badlogic/gdx/scenes/scene2d/Action;

    move-result-object v0

    check-cast v0, Lcom/badlogic/gdx/scenes/scene2d/actions/AlphaAction;

    const/high16 v1, 0x3f800000    # 1.0f

    .line 277
    invoke-virtual {v0, v1}, Lcom/badlogic/gdx/scenes/scene2d/actions/AlphaAction;->setAlpha(F)V

    .line 278
    invoke-virtual {v0, p0}, Lcom/badlogic/gdx/scenes/scene2d/actions/AlphaAction;->setDuration(F)V

    .line 279
    invoke-virtual {v0, p1}, Lcom/badlogic/gdx/scenes/scene2d/actions/AlphaAction;->setInterpolation(Lcom/badlogic/gdx/math/Interpolation;)V

    return-object v0
.end method

.method public static fadeOut(F)Lcom/badlogic/gdx/scenes/scene2d/actions/AlphaAction;
    .locals 2

    const/4 v0, 0x0

    const/4 v1, 0x0

    .line 257
    invoke-static {v0, p0, v1}, Lcom/badlogic/gdx/scenes/scene2d/actions/Actions;->alpha(FFLcom/badlogic/gdx/math/Interpolation;)Lcom/badlogic/gdx/scenes/scene2d/actions/AlphaAction;

    move-result-object p0

    return-object p0
.end method

.method public static fadeOut(FLcom/badlogic/gdx/math/Interpolation;)Lcom/badlogic/gdx/scenes/scene2d/actions/AlphaAction;
    .locals 2

    .line 262
    const-class v0, Lcom/badlogic/gdx/scenes/scene2d/actions/AlphaAction;

    invoke-static {v0}, Lcom/badlogic/gdx/scenes/scene2d/actions/Actions;->action(Ljava/lang/Class;)Lcom/badlogic/gdx/scenes/scene2d/Action;

    move-result-object v0

    check-cast v0, Lcom/badlogic/gdx/scenes/scene2d/actions/AlphaAction;

    const/4 v1, 0x0

    .line 263
    invoke-virtual {v0, v1}, Lcom/badlogic/gdx/scenes/scene2d/actions/AlphaAction;->setAlpha(F)V

    .line 264
    invoke-virtual {v0, p0}, Lcom/badlogic/gdx/scenes/scene2d/actions/AlphaAction;->setDuration(F)V

    .line 265
    invoke-virtual {v0, p1}, Lcom/badlogic/gdx/scenes/scene2d/actions/AlphaAction;->setInterpolation(Lcom/badlogic/gdx/math/Interpolation;)V

    return-object v0
.end method

.method public static forever(Lcom/badlogic/gdx/scenes/scene2d/Action;)Lcom/badlogic/gdx/scenes/scene2d/actions/RepeatAction;
    .locals 2

    .line 443
    const-class v0, Lcom/badlogic/gdx/scenes/scene2d/actions/RepeatAction;

    invoke-static {v0}, Lcom/badlogic/gdx/scenes/scene2d/actions/Actions;->action(Ljava/lang/Class;)Lcom/badlogic/gdx/scenes/scene2d/Action;

    move-result-object v0

    check-cast v0, Lcom/badlogic/gdx/scenes/scene2d/actions/RepeatAction;

    const/4 v1, -0x1

    .line 444
    invoke-virtual {v0, v1}, Lcom/badlogic/gdx/scenes/scene2d/actions/RepeatAction;->setCount(I)V

    .line 445
    invoke-virtual {v0, p0}, Lcom/badlogic/gdx/scenes/scene2d/actions/RepeatAction;->setAction(Lcom/badlogic/gdx/scenes/scene2d/Action;)V

    return-object v0
.end method

.method public static hide()Lcom/badlogic/gdx/scenes/scene2d/actions/VisibleAction;
    .locals 1

    const/4 v0, 0x0

    .line 288
    invoke-static {v0}, Lcom/badlogic/gdx/scenes/scene2d/actions/Actions;->visible(Z)Lcom/badlogic/gdx/scenes/scene2d/actions/VisibleAction;

    move-result-object v0

    return-object v0
.end method

.method public static layout(Z)Lcom/badlogic/gdx/scenes/scene2d/actions/LayoutAction;
    .locals 1

    .line 456
    const-class v0, Lcom/badlogic/gdx/scenes/scene2d/actions/LayoutAction;

    invoke-static {v0}, Lcom/badlogic/gdx/scenes/scene2d/actions/Actions;->action(Ljava/lang/Class;)Lcom/badlogic/gdx/scenes/scene2d/Action;

    move-result-object v0

    check-cast v0, Lcom/badlogic/gdx/scenes/scene2d/actions/LayoutAction;

    .line 457
    invoke-virtual {v0, p0}, Lcom/badlogic/gdx/scenes/scene2d/actions/LayoutAction;->setLayoutEnabled(Z)V

    return-object v0
.end method

.method public static moveBy(FF)Lcom/badlogic/gdx/scenes/scene2d/actions/MoveByAction;
    .locals 2

    const/4 v0, 0x0

    const/4 v1, 0x0

    .line 100
    invoke-static {p0, p1, v0, v1}, Lcom/badlogic/gdx/scenes/scene2d/actions/Actions;->moveBy(FFFLcom/badlogic/gdx/math/Interpolation;)Lcom/badlogic/gdx/scenes/scene2d/actions/MoveByAction;

    move-result-object p0

    return-object p0
.end method

.method public static moveBy(FFF)Lcom/badlogic/gdx/scenes/scene2d/actions/MoveByAction;
    .locals 1

    const/4 v0, 0x0

    .line 104
    invoke-static {p0, p1, p2, v0}, Lcom/badlogic/gdx/scenes/scene2d/actions/Actions;->moveBy(FFFLcom/badlogic/gdx/math/Interpolation;)Lcom/badlogic/gdx/scenes/scene2d/actions/MoveByAction;

    move-result-object p0

    return-object p0
.end method

.method public static moveBy(FFFLcom/badlogic/gdx/math/Interpolation;)Lcom/badlogic/gdx/scenes/scene2d/actions/MoveByAction;
    .locals 1

    .line 108
    const-class v0, Lcom/badlogic/gdx/scenes/scene2d/actions/MoveByAction;

    invoke-static {v0}, Lcom/badlogic/gdx/scenes/scene2d/actions/Actions;->action(Ljava/lang/Class;)Lcom/badlogic/gdx/scenes/scene2d/Action;

    move-result-object v0

    check-cast v0, Lcom/badlogic/gdx/scenes/scene2d/actions/MoveByAction;

    .line 109
    invoke-virtual {v0, p0, p1}, Lcom/badlogic/gdx/scenes/scene2d/actions/MoveByAction;->setAmount(FF)V

    .line 110
    invoke-virtual {v0, p2}, Lcom/badlogic/gdx/scenes/scene2d/actions/MoveByAction;->setDuration(F)V

    .line 111
    invoke-virtual {v0, p3}, Lcom/badlogic/gdx/scenes/scene2d/actions/MoveByAction;->setInterpolation(Lcom/badlogic/gdx/math/Interpolation;)V

    return-object v0
.end method

.method public static moveTo(FF)Lcom/badlogic/gdx/scenes/scene2d/actions/MoveToAction;
    .locals 2

    const/4 v0, 0x0

    const/4 v1, 0x0

    .line 67
    invoke-static {p0, p1, v0, v1}, Lcom/badlogic/gdx/scenes/scene2d/actions/Actions;->moveTo(FFFLcom/badlogic/gdx/math/Interpolation;)Lcom/badlogic/gdx/scenes/scene2d/actions/MoveToAction;

    move-result-object p0

    return-object p0
.end method

.method public static moveTo(FFF)Lcom/badlogic/gdx/scenes/scene2d/actions/MoveToAction;
    .locals 1

    const/4 v0, 0x0

    .line 71
    invoke-static {p0, p1, p2, v0}, Lcom/badlogic/gdx/scenes/scene2d/actions/Actions;->moveTo(FFFLcom/badlogic/gdx/math/Interpolation;)Lcom/badlogic/gdx/scenes/scene2d/actions/MoveToAction;

    move-result-object p0

    return-object p0
.end method

.method public static moveTo(FFFLcom/badlogic/gdx/math/Interpolation;)Lcom/badlogic/gdx/scenes/scene2d/actions/MoveToAction;
    .locals 1

    .line 75
    const-class v0, Lcom/badlogic/gdx/scenes/scene2d/actions/MoveToAction;

    invoke-static {v0}, Lcom/badlogic/gdx/scenes/scene2d/actions/Actions;->action(Ljava/lang/Class;)Lcom/badlogic/gdx/scenes/scene2d/Action;

    move-result-object v0

    check-cast v0, Lcom/badlogic/gdx/scenes/scene2d/actions/MoveToAction;

    .line 76
    invoke-virtual {v0, p0, p1}, Lcom/badlogic/gdx/scenes/scene2d/actions/MoveToAction;->setPosition(FF)V

    .line 77
    invoke-virtual {v0, p2}, Lcom/badlogic/gdx/scenes/scene2d/actions/MoveToAction;->setDuration(F)V

    .line 78
    invoke-virtual {v0, p3}, Lcom/badlogic/gdx/scenes/scene2d/actions/MoveToAction;->setInterpolation(Lcom/badlogic/gdx/math/Interpolation;)V

    return-object v0
.end method

.method public static moveToAligned(FFI)Lcom/badlogic/gdx/scenes/scene2d/actions/MoveToAction;
    .locals 2

    const/4 v0, 0x0

    const/4 v1, 0x0

    .line 83
    invoke-static {p0, p1, p2, v0, v1}, Lcom/badlogic/gdx/scenes/scene2d/actions/Actions;->moveToAligned(FFIFLcom/badlogic/gdx/math/Interpolation;)Lcom/badlogic/gdx/scenes/scene2d/actions/MoveToAction;

    move-result-object p0

    return-object p0
.end method

.method public static moveToAligned(FFIF)Lcom/badlogic/gdx/scenes/scene2d/actions/MoveToAction;
    .locals 1

    const/4 v0, 0x0

    .line 87
    invoke-static {p0, p1, p2, p3, v0}, Lcom/badlogic/gdx/scenes/scene2d/actions/Actions;->moveToAligned(FFIFLcom/badlogic/gdx/math/Interpolation;)Lcom/badlogic/gdx/scenes/scene2d/actions/MoveToAction;

    move-result-object p0

    return-object p0
.end method

.method public static moveToAligned(FFIFLcom/badlogic/gdx/math/Interpolation;)Lcom/badlogic/gdx/scenes/scene2d/actions/MoveToAction;
    .locals 1

    .line 91
    const-class v0, Lcom/badlogic/gdx/scenes/scene2d/actions/MoveToAction;

    invoke-static {v0}, Lcom/badlogic/gdx/scenes/scene2d/actions/Actions;->action(Ljava/lang/Class;)Lcom/badlogic/gdx/scenes/scene2d/Action;

    move-result-object v0

    check-cast v0, Lcom/badlogic/gdx/scenes/scene2d/actions/MoveToAction;

    .line 92
    invoke-virtual {v0, p0, p1, p2}, Lcom/badlogic/gdx/scenes/scene2d/actions/MoveToAction;->setPosition(FFI)V

    .line 93
    invoke-virtual {v0, p3}, Lcom/badlogic/gdx/scenes/scene2d/actions/MoveToAction;->setDuration(F)V

    .line 94
    invoke-virtual {v0, p4}, Lcom/badlogic/gdx/scenes/scene2d/actions/MoveToAction;->setInterpolation(Lcom/badlogic/gdx/math/Interpolation;)V

    return-object v0
.end method

.method public static parallel()Lcom/badlogic/gdx/scenes/scene2d/actions/ParallelAction;
    .locals 1

    .line 432
    const-class v0, Lcom/badlogic/gdx/scenes/scene2d/actions/ParallelAction;

    invoke-static {v0}, Lcom/badlogic/gdx/scenes/scene2d/actions/Actions;->action(Ljava/lang/Class;)Lcom/badlogic/gdx/scenes/scene2d/Action;

    move-result-object v0

    check-cast v0, Lcom/badlogic/gdx/scenes/scene2d/actions/ParallelAction;

    return-object v0
.end method

.method public static parallel(Lcom/badlogic/gdx/scenes/scene2d/Action;)Lcom/badlogic/gdx/scenes/scene2d/actions/ParallelAction;
    .locals 1

    .line 385
    const-class v0, Lcom/badlogic/gdx/scenes/scene2d/actions/ParallelAction;

    invoke-static {v0}, Lcom/badlogic/gdx/scenes/scene2d/actions/Actions;->action(Ljava/lang/Class;)Lcom/badlogic/gdx/scenes/scene2d/Action;

    move-result-object v0

    check-cast v0, Lcom/badlogic/gdx/scenes/scene2d/actions/ParallelAction;

    .line 386
    invoke-virtual {v0, p0}, Lcom/badlogic/gdx/scenes/scene2d/actions/ParallelAction;->addAction(Lcom/badlogic/gdx/scenes/scene2d/Action;)V

    return-object v0
.end method

.method public static parallel(Lcom/badlogic/gdx/scenes/scene2d/Action;Lcom/badlogic/gdx/scenes/scene2d/Action;)Lcom/badlogic/gdx/scenes/scene2d/actions/ParallelAction;
    .locals 1

    .line 391
    const-class v0, Lcom/badlogic/gdx/scenes/scene2d/actions/ParallelAction;

    invoke-static {v0}, Lcom/badlogic/gdx/scenes/scene2d/actions/Actions;->action(Ljava/lang/Class;)Lcom/badlogic/gdx/scenes/scene2d/Action;

    move-result-object v0

    check-cast v0, Lcom/badlogic/gdx/scenes/scene2d/actions/ParallelAction;

    .line 392
    invoke-virtual {v0, p0}, Lcom/badlogic/gdx/scenes/scene2d/actions/ParallelAction;->addAction(Lcom/badlogic/gdx/scenes/scene2d/Action;)V

    .line 393
    invoke-virtual {v0, p1}, Lcom/badlogic/gdx/scenes/scene2d/actions/ParallelAction;->addAction(Lcom/badlogic/gdx/scenes/scene2d/Action;)V

    return-object v0
.end method

.method public static parallel(Lcom/badlogic/gdx/scenes/scene2d/Action;Lcom/badlogic/gdx/scenes/scene2d/Action;Lcom/badlogic/gdx/scenes/scene2d/Action;)Lcom/badlogic/gdx/scenes/scene2d/actions/ParallelAction;
    .locals 1

    .line 398
    const-class v0, Lcom/badlogic/gdx/scenes/scene2d/actions/ParallelAction;

    invoke-static {v0}, Lcom/badlogic/gdx/scenes/scene2d/actions/Actions;->action(Ljava/lang/Class;)Lcom/badlogic/gdx/scenes/scene2d/Action;

    move-result-object v0

    check-cast v0, Lcom/badlogic/gdx/scenes/scene2d/actions/ParallelAction;

    .line 399
    invoke-virtual {v0, p0}, Lcom/badlogic/gdx/scenes/scene2d/actions/ParallelAction;->addAction(Lcom/badlogic/gdx/scenes/scene2d/Action;)V

    .line 400
    invoke-virtual {v0, p1}, Lcom/badlogic/gdx/scenes/scene2d/actions/ParallelAction;->addAction(Lcom/badlogic/gdx/scenes/scene2d/Action;)V

    .line 401
    invoke-virtual {v0, p2}, Lcom/badlogic/gdx/scenes/scene2d/actions/ParallelAction;->addAction(Lcom/badlogic/gdx/scenes/scene2d/Action;)V

    return-object v0
.end method

.method public static parallel(Lcom/badlogic/gdx/scenes/scene2d/Action;Lcom/badlogic/gdx/scenes/scene2d/Action;Lcom/badlogic/gdx/scenes/scene2d/Action;Lcom/badlogic/gdx/scenes/scene2d/Action;)Lcom/badlogic/gdx/scenes/scene2d/actions/ParallelAction;
    .locals 1

    .line 406
    const-class v0, Lcom/badlogic/gdx/scenes/scene2d/actions/ParallelAction;

    invoke-static {v0}, Lcom/badlogic/gdx/scenes/scene2d/actions/Actions;->action(Ljava/lang/Class;)Lcom/badlogic/gdx/scenes/scene2d/Action;

    move-result-object v0

    check-cast v0, Lcom/badlogic/gdx/scenes/scene2d/actions/ParallelAction;

    .line 407
    invoke-virtual {v0, p0}, Lcom/badlogic/gdx/scenes/scene2d/actions/ParallelAction;->addAction(Lcom/badlogic/gdx/scenes/scene2d/Action;)V

    .line 408
    invoke-virtual {v0, p1}, Lcom/badlogic/gdx/scenes/scene2d/actions/ParallelAction;->addAction(Lcom/badlogic/gdx/scenes/scene2d/Action;)V

    .line 409
    invoke-virtual {v0, p2}, Lcom/badlogic/gdx/scenes/scene2d/actions/ParallelAction;->addAction(Lcom/badlogic/gdx/scenes/scene2d/Action;)V

    .line 410
    invoke-virtual {v0, p3}, Lcom/badlogic/gdx/scenes/scene2d/actions/ParallelAction;->addAction(Lcom/badlogic/gdx/scenes/scene2d/Action;)V

    return-object v0
.end method

.method public static parallel(Lcom/badlogic/gdx/scenes/scene2d/Action;Lcom/badlogic/gdx/scenes/scene2d/Action;Lcom/badlogic/gdx/scenes/scene2d/Action;Lcom/badlogic/gdx/scenes/scene2d/Action;Lcom/badlogic/gdx/scenes/scene2d/Action;)Lcom/badlogic/gdx/scenes/scene2d/actions/ParallelAction;
    .locals 1

    .line 415
    const-class v0, Lcom/badlogic/gdx/scenes/scene2d/actions/ParallelAction;

    invoke-static {v0}, Lcom/badlogic/gdx/scenes/scene2d/actions/Actions;->action(Ljava/lang/Class;)Lcom/badlogic/gdx/scenes/scene2d/Action;

    move-result-object v0

    check-cast v0, Lcom/badlogic/gdx/scenes/scene2d/actions/ParallelAction;

    .line 416
    invoke-virtual {v0, p0}, Lcom/badlogic/gdx/scenes/scene2d/actions/ParallelAction;->addAction(Lcom/badlogic/gdx/scenes/scene2d/Action;)V

    .line 417
    invoke-virtual {v0, p1}, Lcom/badlogic/gdx/scenes/scene2d/actions/ParallelAction;->addAction(Lcom/badlogic/gdx/scenes/scene2d/Action;)V

    .line 418
    invoke-virtual {v0, p2}, Lcom/badlogic/gdx/scenes/scene2d/actions/ParallelAction;->addAction(Lcom/badlogic/gdx/scenes/scene2d/Action;)V

    .line 419
    invoke-virtual {v0, p3}, Lcom/badlogic/gdx/scenes/scene2d/actions/ParallelAction;->addAction(Lcom/badlogic/gdx/scenes/scene2d/Action;)V

    .line 420
    invoke-virtual {v0, p4}, Lcom/badlogic/gdx/scenes/scene2d/actions/ParallelAction;->addAction(Lcom/badlogic/gdx/scenes/scene2d/Action;)V

    return-object v0
.end method

.method public static varargs parallel([Lcom/badlogic/gdx/scenes/scene2d/Action;)Lcom/badlogic/gdx/scenes/scene2d/actions/ParallelAction;
    .locals 4

    .line 425
    const-class v0, Lcom/badlogic/gdx/scenes/scene2d/actions/ParallelAction;

    invoke-static {v0}, Lcom/badlogic/gdx/scenes/scene2d/actions/Actions;->action(Ljava/lang/Class;)Lcom/badlogic/gdx/scenes/scene2d/Action;

    move-result-object v0

    check-cast v0, Lcom/badlogic/gdx/scenes/scene2d/actions/ParallelAction;

    .line 426
    array-length v1, p0

    const/4 v2, 0x0

    :goto_0
    if-ge v2, v1, :cond_0

    .line 427
    aget-object v3, p0, v2

    invoke-virtual {v0, v3}, Lcom/badlogic/gdx/scenes/scene2d/actions/ParallelAction;->addAction(Lcom/badlogic/gdx/scenes/scene2d/Action;)V

    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    :cond_0
    return-object v0
.end method

.method public static removeAction(Lcom/badlogic/gdx/scenes/scene2d/Action;)Lcom/badlogic/gdx/scenes/scene2d/actions/RemoveAction;
    .locals 1

    .line 53
    const-class v0, Lcom/badlogic/gdx/scenes/scene2d/actions/RemoveAction;

    invoke-static {v0}, Lcom/badlogic/gdx/scenes/scene2d/actions/Actions;->action(Ljava/lang/Class;)Lcom/badlogic/gdx/scenes/scene2d/Action;

    move-result-object v0

    check-cast v0, Lcom/badlogic/gdx/scenes/scene2d/actions/RemoveAction;

    .line 54
    invoke-virtual {v0, p0}, Lcom/badlogic/gdx/scenes/scene2d/actions/RemoveAction;->setAction(Lcom/badlogic/gdx/scenes/scene2d/Action;)V

    return-object v0
.end method

.method public static removeAction(Lcom/badlogic/gdx/scenes/scene2d/Action;Lcom/badlogic/gdx/scenes/scene2d/Actor;)Lcom/badlogic/gdx/scenes/scene2d/actions/RemoveAction;
    .locals 1

    .line 59
    const-class v0, Lcom/badlogic/gdx/scenes/scene2d/actions/RemoveAction;

    invoke-static {v0}, Lcom/badlogic/gdx/scenes/scene2d/actions/Actions;->action(Ljava/lang/Class;)Lcom/badlogic/gdx/scenes/scene2d/Action;

    move-result-object v0

    check-cast v0, Lcom/badlogic/gdx/scenes/scene2d/actions/RemoveAction;

    .line 60
    invoke-virtual {v0, p1}, Lcom/badlogic/gdx/scenes/scene2d/actions/RemoveAction;->setTarget(Lcom/badlogic/gdx/scenes/scene2d/Actor;)V

    .line 61
    invoke-virtual {v0, p0}, Lcom/badlogic/gdx/scenes/scene2d/actions/RemoveAction;->setAction(Lcom/badlogic/gdx/scenes/scene2d/Action;)V

    return-object v0
.end method

.method public static removeActor()Lcom/badlogic/gdx/scenes/scene2d/actions/RemoveActorAction;
    .locals 1

    .line 304
    const-class v0, Lcom/badlogic/gdx/scenes/scene2d/actions/RemoveActorAction;

    invoke-static {v0}, Lcom/badlogic/gdx/scenes/scene2d/actions/Actions;->action(Ljava/lang/Class;)Lcom/badlogic/gdx/scenes/scene2d/Action;

    move-result-object v0

    check-cast v0, Lcom/badlogic/gdx/scenes/scene2d/actions/RemoveActorAction;

    return-object v0
.end method

.method public static removeActor(Lcom/badlogic/gdx/scenes/scene2d/Actor;)Lcom/badlogic/gdx/scenes/scene2d/actions/RemoveActorAction;
    .locals 1

    .line 308
    const-class v0, Lcom/badlogic/gdx/scenes/scene2d/actions/RemoveActorAction;

    invoke-static {v0}, Lcom/badlogic/gdx/scenes/scene2d/actions/Actions;->action(Ljava/lang/Class;)Lcom/badlogic/gdx/scenes/scene2d/Action;

    move-result-object v0

    check-cast v0, Lcom/badlogic/gdx/scenes/scene2d/actions/RemoveActorAction;

    .line 309
    invoke-virtual {v0, p0}, Lcom/badlogic/gdx/scenes/scene2d/actions/RemoveActorAction;->setTarget(Lcom/badlogic/gdx/scenes/scene2d/Actor;)V

    return-object v0
.end method

.method public static removeListener(Lcom/badlogic/gdx/scenes/scene2d/EventListener;Z)Lcom/badlogic/gdx/scenes/scene2d/actions/RemoveListenerAction;
    .locals 1

    .line 483
    const-class v0, Lcom/badlogic/gdx/scenes/scene2d/actions/RemoveListenerAction;

    invoke-static {v0}, Lcom/badlogic/gdx/scenes/scene2d/actions/Actions;->action(Ljava/lang/Class;)Lcom/badlogic/gdx/scenes/scene2d/Action;

    move-result-object v0

    check-cast v0, Lcom/badlogic/gdx/scenes/scene2d/actions/RemoveListenerAction;

    .line 484
    invoke-virtual {v0, p0}, Lcom/badlogic/gdx/scenes/scene2d/actions/RemoveListenerAction;->setListener(Lcom/badlogic/gdx/scenes/scene2d/EventListener;)V

    .line 485
    invoke-virtual {v0, p1}, Lcom/badlogic/gdx/scenes/scene2d/actions/RemoveListenerAction;->setCapture(Z)V

    return-object v0
.end method

.method public static removeListener(Lcom/badlogic/gdx/scenes/scene2d/EventListener;ZLcom/badlogic/gdx/scenes/scene2d/Actor;)Lcom/badlogic/gdx/scenes/scene2d/actions/RemoveListenerAction;
    .locals 1

    .line 490
    const-class v0, Lcom/badlogic/gdx/scenes/scene2d/actions/RemoveListenerAction;

    invoke-static {v0}, Lcom/badlogic/gdx/scenes/scene2d/actions/Actions;->action(Ljava/lang/Class;)Lcom/badlogic/gdx/scenes/scene2d/Action;

    move-result-object v0

    check-cast v0, Lcom/badlogic/gdx/scenes/scene2d/actions/RemoveListenerAction;

    .line 491
    invoke-virtual {v0, p2}, Lcom/badlogic/gdx/scenes/scene2d/actions/RemoveListenerAction;->setTarget(Lcom/badlogic/gdx/scenes/scene2d/Actor;)V

    .line 492
    invoke-virtual {v0, p0}, Lcom/badlogic/gdx/scenes/scene2d/actions/RemoveListenerAction;->setListener(Lcom/badlogic/gdx/scenes/scene2d/EventListener;)V

    .line 493
    invoke-virtual {v0, p1}, Lcom/badlogic/gdx/scenes/scene2d/actions/RemoveListenerAction;->setCapture(Z)V

    return-object v0
.end method

.method public static repeat(ILcom/badlogic/gdx/scenes/scene2d/Action;)Lcom/badlogic/gdx/scenes/scene2d/actions/RepeatAction;
    .locals 1

    .line 436
    const-class v0, Lcom/badlogic/gdx/scenes/scene2d/actions/RepeatAction;

    invoke-static {v0}, Lcom/badlogic/gdx/scenes/scene2d/actions/Actions;->action(Ljava/lang/Class;)Lcom/badlogic/gdx/scenes/scene2d/Action;

    move-result-object v0

    check-cast v0, Lcom/badlogic/gdx/scenes/scene2d/actions/RepeatAction;

    .line 437
    invoke-virtual {v0, p0}, Lcom/badlogic/gdx/scenes/scene2d/actions/RepeatAction;->setCount(I)V

    .line 438
    invoke-virtual {v0, p1}, Lcom/badlogic/gdx/scenes/scene2d/actions/RepeatAction;->setAction(Lcom/badlogic/gdx/scenes/scene2d/Action;)V

    return-object v0
.end method

.method public static rotateBy(F)Lcom/badlogic/gdx/scenes/scene2d/actions/RotateByAction;
    .locals 2

    const/4 v0, 0x0

    const/4 v1, 0x0

    .line 202
    invoke-static {p0, v0, v1}, Lcom/badlogic/gdx/scenes/scene2d/actions/Actions;->rotateBy(FFLcom/badlogic/gdx/math/Interpolation;)Lcom/badlogic/gdx/scenes/scene2d/actions/RotateByAction;

    move-result-object p0

    return-object p0
.end method

.method public static rotateBy(FF)Lcom/badlogic/gdx/scenes/scene2d/actions/RotateByAction;
    .locals 1

    const/4 v0, 0x0

    .line 206
    invoke-static {p0, p1, v0}, Lcom/badlogic/gdx/scenes/scene2d/actions/Actions;->rotateBy(FFLcom/badlogic/gdx/math/Interpolation;)Lcom/badlogic/gdx/scenes/scene2d/actions/RotateByAction;

    move-result-object p0

    return-object p0
.end method

.method public static rotateBy(FFLcom/badlogic/gdx/math/Interpolation;)Lcom/badlogic/gdx/scenes/scene2d/actions/RotateByAction;
    .locals 1

    .line 210
    const-class v0, Lcom/badlogic/gdx/scenes/scene2d/actions/RotateByAction;

    invoke-static {v0}, Lcom/badlogic/gdx/scenes/scene2d/actions/Actions;->action(Ljava/lang/Class;)Lcom/badlogic/gdx/scenes/scene2d/Action;

    move-result-object v0

    check-cast v0, Lcom/badlogic/gdx/scenes/scene2d/actions/RotateByAction;

    .line 211
    invoke-virtual {v0, p0}, Lcom/badlogic/gdx/scenes/scene2d/actions/RotateByAction;->setAmount(F)V

    .line 212
    invoke-virtual {v0, p1}, Lcom/badlogic/gdx/scenes/scene2d/actions/RotateByAction;->setDuration(F)V

    .line 213
    invoke-virtual {v0, p2}, Lcom/badlogic/gdx/scenes/scene2d/actions/RotateByAction;->setInterpolation(Lcom/badlogic/gdx/math/Interpolation;)V

    return-object v0
.end method

.method public static rotateTo(F)Lcom/badlogic/gdx/scenes/scene2d/actions/RotateToAction;
    .locals 2

    const/4 v0, 0x0

    const/4 v1, 0x0

    .line 185
    invoke-static {p0, v0, v1}, Lcom/badlogic/gdx/scenes/scene2d/actions/Actions;->rotateTo(FFLcom/badlogic/gdx/math/Interpolation;)Lcom/badlogic/gdx/scenes/scene2d/actions/RotateToAction;

    move-result-object p0

    return-object p0
.end method

.method public static rotateTo(FF)Lcom/badlogic/gdx/scenes/scene2d/actions/RotateToAction;
    .locals 1

    const/4 v0, 0x0

    .line 189
    invoke-static {p0, p1, v0}, Lcom/badlogic/gdx/scenes/scene2d/actions/Actions;->rotateTo(FFLcom/badlogic/gdx/math/Interpolation;)Lcom/badlogic/gdx/scenes/scene2d/actions/RotateToAction;

    move-result-object p0

    return-object p0
.end method

.method public static rotateTo(FFLcom/badlogic/gdx/math/Interpolation;)Lcom/badlogic/gdx/scenes/scene2d/actions/RotateToAction;
    .locals 1

    .line 193
    const-class v0, Lcom/badlogic/gdx/scenes/scene2d/actions/RotateToAction;

    invoke-static {v0}, Lcom/badlogic/gdx/scenes/scene2d/actions/Actions;->action(Ljava/lang/Class;)Lcom/badlogic/gdx/scenes/scene2d/Action;

    move-result-object v0

    check-cast v0, Lcom/badlogic/gdx/scenes/scene2d/actions/RotateToAction;

    .line 194
    invoke-virtual {v0, p0}, Lcom/badlogic/gdx/scenes/scene2d/actions/RotateToAction;->setRotation(F)V

    .line 195
    invoke-virtual {v0, p1}, Lcom/badlogic/gdx/scenes/scene2d/actions/RotateToAction;->setDuration(F)V

    .line 196
    invoke-virtual {v0, p2}, Lcom/badlogic/gdx/scenes/scene2d/actions/RotateToAction;->setInterpolation(Lcom/badlogic/gdx/math/Interpolation;)V

    return-object v0
.end method

.method public static run(Ljava/lang/Runnable;)Lcom/badlogic/gdx/scenes/scene2d/actions/RunnableAction;
    .locals 1

    .line 450
    const-class v0, Lcom/badlogic/gdx/scenes/scene2d/actions/RunnableAction;

    invoke-static {v0}, Lcom/badlogic/gdx/scenes/scene2d/actions/Actions;->action(Ljava/lang/Class;)Lcom/badlogic/gdx/scenes/scene2d/Action;

    move-result-object v0

    check-cast v0, Lcom/badlogic/gdx/scenes/scene2d/actions/RunnableAction;

    .line 451
    invoke-virtual {v0, p0}, Lcom/badlogic/gdx/scenes/scene2d/actions/RunnableAction;->setRunnable(Ljava/lang/Runnable;)V

    return-object v0
.end method

.method public static scaleBy(FF)Lcom/badlogic/gdx/scenes/scene2d/actions/ScaleByAction;
    .locals 2

    const/4 v0, 0x0

    const/4 v1, 0x0

    .line 168
    invoke-static {p0, p1, v0, v1}, Lcom/badlogic/gdx/scenes/scene2d/actions/Actions;->scaleBy(FFFLcom/badlogic/gdx/math/Interpolation;)Lcom/badlogic/gdx/scenes/scene2d/actions/ScaleByAction;

    move-result-object p0

    return-object p0
.end method

.method public static scaleBy(FFF)Lcom/badlogic/gdx/scenes/scene2d/actions/ScaleByAction;
    .locals 1

    const/4 v0, 0x0

    .line 172
    invoke-static {p0, p1, p2, v0}, Lcom/badlogic/gdx/scenes/scene2d/actions/Actions;->scaleBy(FFFLcom/badlogic/gdx/math/Interpolation;)Lcom/badlogic/gdx/scenes/scene2d/actions/ScaleByAction;

    move-result-object p0

    return-object p0
.end method

.method public static scaleBy(FFFLcom/badlogic/gdx/math/Interpolation;)Lcom/badlogic/gdx/scenes/scene2d/actions/ScaleByAction;
    .locals 1

    .line 176
    const-class v0, Lcom/badlogic/gdx/scenes/scene2d/actions/ScaleByAction;

    invoke-static {v0}, Lcom/badlogic/gdx/scenes/scene2d/actions/Actions;->action(Ljava/lang/Class;)Lcom/badlogic/gdx/scenes/scene2d/Action;

    move-result-object v0

    check-cast v0, Lcom/badlogic/gdx/scenes/scene2d/actions/ScaleByAction;

    .line 177
    invoke-virtual {v0, p0, p1}, Lcom/badlogic/gdx/scenes/scene2d/actions/ScaleByAction;->setAmount(FF)V

    .line 178
    invoke-virtual {v0, p2}, Lcom/badlogic/gdx/scenes/scene2d/actions/ScaleByAction;->setDuration(F)V

    .line 179
    invoke-virtual {v0, p3}, Lcom/badlogic/gdx/scenes/scene2d/actions/ScaleByAction;->setInterpolation(Lcom/badlogic/gdx/math/Interpolation;)V

    return-object v0
.end method

.method public static scaleTo(FF)Lcom/badlogic/gdx/scenes/scene2d/actions/ScaleToAction;
    .locals 2

    const/4 v0, 0x0

    const/4 v1, 0x0

    .line 151
    invoke-static {p0, p1, v0, v1}, Lcom/badlogic/gdx/scenes/scene2d/actions/Actions;->scaleTo(FFFLcom/badlogic/gdx/math/Interpolation;)Lcom/badlogic/gdx/scenes/scene2d/actions/ScaleToAction;

    move-result-object p0

    return-object p0
.end method

.method public static scaleTo(FFF)Lcom/badlogic/gdx/scenes/scene2d/actions/ScaleToAction;
    .locals 1

    const/4 v0, 0x0

    .line 155
    invoke-static {p0, p1, p2, v0}, Lcom/badlogic/gdx/scenes/scene2d/actions/Actions;->scaleTo(FFFLcom/badlogic/gdx/math/Interpolation;)Lcom/badlogic/gdx/scenes/scene2d/actions/ScaleToAction;

    move-result-object p0

    return-object p0
.end method

.method public static scaleTo(FFFLcom/badlogic/gdx/math/Interpolation;)Lcom/badlogic/gdx/scenes/scene2d/actions/ScaleToAction;
    .locals 1

    .line 159
    const-class v0, Lcom/badlogic/gdx/scenes/scene2d/actions/ScaleToAction;

    invoke-static {v0}, Lcom/badlogic/gdx/scenes/scene2d/actions/Actions;->action(Ljava/lang/Class;)Lcom/badlogic/gdx/scenes/scene2d/Action;

    move-result-object v0

    check-cast v0, Lcom/badlogic/gdx/scenes/scene2d/actions/ScaleToAction;

    .line 160
    invoke-virtual {v0, p0, p1}, Lcom/badlogic/gdx/scenes/scene2d/actions/ScaleToAction;->setScale(FF)V

    .line 161
    invoke-virtual {v0, p2}, Lcom/badlogic/gdx/scenes/scene2d/actions/ScaleToAction;->setDuration(F)V

    .line 162
    invoke-virtual {v0, p3}, Lcom/badlogic/gdx/scenes/scene2d/actions/ScaleToAction;->setInterpolation(Lcom/badlogic/gdx/math/Interpolation;)V

    return-object v0
.end method

.method public static sequence()Lcom/badlogic/gdx/scenes/scene2d/actions/SequenceAction;
    .locals 1

    .line 381
    const-class v0, Lcom/badlogic/gdx/scenes/scene2d/actions/SequenceAction;

    invoke-static {v0}, Lcom/badlogic/gdx/scenes/scene2d/actions/Actions;->action(Ljava/lang/Class;)Lcom/badlogic/gdx/scenes/scene2d/Action;

    move-result-object v0

    check-cast v0, Lcom/badlogic/gdx/scenes/scene2d/actions/SequenceAction;

    return-object v0
.end method

.method public static sequence(Lcom/badlogic/gdx/scenes/scene2d/Action;)Lcom/badlogic/gdx/scenes/scene2d/actions/SequenceAction;
    .locals 1

    .line 334
    const-class v0, Lcom/badlogic/gdx/scenes/scene2d/actions/SequenceAction;

    invoke-static {v0}, Lcom/badlogic/gdx/scenes/scene2d/actions/Actions;->action(Ljava/lang/Class;)Lcom/badlogic/gdx/scenes/scene2d/Action;

    move-result-object v0

    check-cast v0, Lcom/badlogic/gdx/scenes/scene2d/actions/SequenceAction;

    .line 335
    invoke-virtual {v0, p0}, Lcom/badlogic/gdx/scenes/scene2d/actions/SequenceAction;->addAction(Lcom/badlogic/gdx/scenes/scene2d/Action;)V

    return-object v0
.end method

.method public static sequence(Lcom/badlogic/gdx/scenes/scene2d/Action;Lcom/badlogic/gdx/scenes/scene2d/Action;)Lcom/badlogic/gdx/scenes/scene2d/actions/SequenceAction;
    .locals 1

    .line 340
    const-class v0, Lcom/badlogic/gdx/scenes/scene2d/actions/SequenceAction;

    invoke-static {v0}, Lcom/badlogic/gdx/scenes/scene2d/actions/Actions;->action(Ljava/lang/Class;)Lcom/badlogic/gdx/scenes/scene2d/Action;

    move-result-object v0

    check-cast v0, Lcom/badlogic/gdx/scenes/scene2d/actions/SequenceAction;

    .line 341
    invoke-virtual {v0, p0}, Lcom/badlogic/gdx/scenes/scene2d/actions/SequenceAction;->addAction(Lcom/badlogic/gdx/scenes/scene2d/Action;)V

    .line 342
    invoke-virtual {v0, p1}, Lcom/badlogic/gdx/scenes/scene2d/actions/SequenceAction;->addAction(Lcom/badlogic/gdx/scenes/scene2d/Action;)V

    return-object v0
.end method

.method public static sequence(Lcom/badlogic/gdx/scenes/scene2d/Action;Lcom/badlogic/gdx/scenes/scene2d/Action;Lcom/badlogic/gdx/scenes/scene2d/Action;)Lcom/badlogic/gdx/scenes/scene2d/actions/SequenceAction;
    .locals 1

    .line 347
    const-class v0, Lcom/badlogic/gdx/scenes/scene2d/actions/SequenceAction;

    invoke-static {v0}, Lcom/badlogic/gdx/scenes/scene2d/actions/Actions;->action(Ljava/lang/Class;)Lcom/badlogic/gdx/scenes/scene2d/Action;

    move-result-object v0

    check-cast v0, Lcom/badlogic/gdx/scenes/scene2d/actions/SequenceAction;

    .line 348
    invoke-virtual {v0, p0}, Lcom/badlogic/gdx/scenes/scene2d/actions/SequenceAction;->addAction(Lcom/badlogic/gdx/scenes/scene2d/Action;)V

    .line 349
    invoke-virtual {v0, p1}, Lcom/badlogic/gdx/scenes/scene2d/actions/SequenceAction;->addAction(Lcom/badlogic/gdx/scenes/scene2d/Action;)V

    .line 350
    invoke-virtual {v0, p2}, Lcom/badlogic/gdx/scenes/scene2d/actions/SequenceAction;->addAction(Lcom/badlogic/gdx/scenes/scene2d/Action;)V

    return-object v0
.end method

.method public static sequence(Lcom/badlogic/gdx/scenes/scene2d/Action;Lcom/badlogic/gdx/scenes/scene2d/Action;Lcom/badlogic/gdx/scenes/scene2d/Action;Lcom/badlogic/gdx/scenes/scene2d/Action;)Lcom/badlogic/gdx/scenes/scene2d/actions/SequenceAction;
    .locals 1

    .line 355
    const-class v0, Lcom/badlogic/gdx/scenes/scene2d/actions/SequenceAction;

    invoke-static {v0}, Lcom/badlogic/gdx/scenes/scene2d/actions/Actions;->action(Ljava/lang/Class;)Lcom/badlogic/gdx/scenes/scene2d/Action;

    move-result-object v0

    check-cast v0, Lcom/badlogic/gdx/scenes/scene2d/actions/SequenceAction;

    .line 356
    invoke-virtual {v0, p0}, Lcom/badlogic/gdx/scenes/scene2d/actions/SequenceAction;->addAction(Lcom/badlogic/gdx/scenes/scene2d/Action;)V

    .line 357
    invoke-virtual {v0, p1}, Lcom/badlogic/gdx/scenes/scene2d/actions/SequenceAction;->addAction(Lcom/badlogic/gdx/scenes/scene2d/Action;)V

    .line 358
    invoke-virtual {v0, p2}, Lcom/badlogic/gdx/scenes/scene2d/actions/SequenceAction;->addAction(Lcom/badlogic/gdx/scenes/scene2d/Action;)V

    .line 359
    invoke-virtual {v0, p3}, Lcom/badlogic/gdx/scenes/scene2d/actions/SequenceAction;->addAction(Lcom/badlogic/gdx/scenes/scene2d/Action;)V

    return-object v0
.end method

.method public static sequence(Lcom/badlogic/gdx/scenes/scene2d/Action;Lcom/badlogic/gdx/scenes/scene2d/Action;Lcom/badlogic/gdx/scenes/scene2d/Action;Lcom/badlogic/gdx/scenes/scene2d/Action;Lcom/badlogic/gdx/scenes/scene2d/Action;)Lcom/badlogic/gdx/scenes/scene2d/actions/SequenceAction;
    .locals 1

    .line 364
    const-class v0, Lcom/badlogic/gdx/scenes/scene2d/actions/SequenceAction;

    invoke-static {v0}, Lcom/badlogic/gdx/scenes/scene2d/actions/Actions;->action(Ljava/lang/Class;)Lcom/badlogic/gdx/scenes/scene2d/Action;

    move-result-object v0

    check-cast v0, Lcom/badlogic/gdx/scenes/scene2d/actions/SequenceAction;

    .line 365
    invoke-virtual {v0, p0}, Lcom/badlogic/gdx/scenes/scene2d/actions/SequenceAction;->addAction(Lcom/badlogic/gdx/scenes/scene2d/Action;)V

    .line 366
    invoke-virtual {v0, p1}, Lcom/badlogic/gdx/scenes/scene2d/actions/SequenceAction;->addAction(Lcom/badlogic/gdx/scenes/scene2d/Action;)V

    .line 367
    invoke-virtual {v0, p2}, Lcom/badlogic/gdx/scenes/scene2d/actions/SequenceAction;->addAction(Lcom/badlogic/gdx/scenes/scene2d/Action;)V

    .line 368
    invoke-virtual {v0, p3}, Lcom/badlogic/gdx/scenes/scene2d/actions/SequenceAction;->addAction(Lcom/badlogic/gdx/scenes/scene2d/Action;)V

    .line 369
    invoke-virtual {v0, p4}, Lcom/badlogic/gdx/scenes/scene2d/actions/SequenceAction;->addAction(Lcom/badlogic/gdx/scenes/scene2d/Action;)V

    return-object v0
.end method

.method public static varargs sequence([Lcom/badlogic/gdx/scenes/scene2d/Action;)Lcom/badlogic/gdx/scenes/scene2d/actions/SequenceAction;
    .locals 4

    .line 374
    const-class v0, Lcom/badlogic/gdx/scenes/scene2d/actions/SequenceAction;

    invoke-static {v0}, Lcom/badlogic/gdx/scenes/scene2d/actions/Actions;->action(Ljava/lang/Class;)Lcom/badlogic/gdx/scenes/scene2d/Action;

    move-result-object v0

    check-cast v0, Lcom/badlogic/gdx/scenes/scene2d/actions/SequenceAction;

    .line 375
    array-length v1, p0

    const/4 v2, 0x0

    :goto_0
    if-ge v2, v1, :cond_0

    .line 376
    aget-object v3, p0, v2

    invoke-virtual {v0, v3}, Lcom/badlogic/gdx/scenes/scene2d/actions/SequenceAction;->addAction(Lcom/badlogic/gdx/scenes/scene2d/Action;)V

    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    :cond_0
    return-object v0
.end method

.method public static show()Lcom/badlogic/gdx/scenes/scene2d/actions/VisibleAction;
    .locals 1

    const/4 v0, 0x1

    .line 284
    invoke-static {v0}, Lcom/badlogic/gdx/scenes/scene2d/actions/Actions;->visible(Z)Lcom/badlogic/gdx/scenes/scene2d/actions/VisibleAction;

    move-result-object v0

    return-object v0
.end method

.method public static sizeBy(FF)Lcom/badlogic/gdx/scenes/scene2d/actions/SizeByAction;
    .locals 2

    const/4 v0, 0x0

    const/4 v1, 0x0

    .line 134
    invoke-static {p0, p1, v0, v1}, Lcom/badlogic/gdx/scenes/scene2d/actions/Actions;->sizeBy(FFFLcom/badlogic/gdx/math/Interpolation;)Lcom/badlogic/gdx/scenes/scene2d/actions/SizeByAction;

    move-result-object p0

    return-object p0
.end method

.method public static sizeBy(FFF)Lcom/badlogic/gdx/scenes/scene2d/actions/SizeByAction;
    .locals 1

    const/4 v0, 0x0

    .line 138
    invoke-static {p0, p1, p2, v0}, Lcom/badlogic/gdx/scenes/scene2d/actions/Actions;->sizeBy(FFFLcom/badlogic/gdx/math/Interpolation;)Lcom/badlogic/gdx/scenes/scene2d/actions/SizeByAction;

    move-result-object p0

    return-object p0
.end method

.method public static sizeBy(FFFLcom/badlogic/gdx/math/Interpolation;)Lcom/badlogic/gdx/scenes/scene2d/actions/SizeByAction;
    .locals 1

    .line 142
    const-class v0, Lcom/badlogic/gdx/scenes/scene2d/actions/SizeByAction;

    invoke-static {v0}, Lcom/badlogic/gdx/scenes/scene2d/actions/Actions;->action(Ljava/lang/Class;)Lcom/badlogic/gdx/scenes/scene2d/Action;

    move-result-object v0

    check-cast v0, Lcom/badlogic/gdx/scenes/scene2d/actions/SizeByAction;

    .line 143
    invoke-virtual {v0, p0, p1}, Lcom/badlogic/gdx/scenes/scene2d/actions/SizeByAction;->setAmount(FF)V

    .line 144
    invoke-virtual {v0, p2}, Lcom/badlogic/gdx/scenes/scene2d/actions/SizeByAction;->setDuration(F)V

    .line 145
    invoke-virtual {v0, p3}, Lcom/badlogic/gdx/scenes/scene2d/actions/SizeByAction;->setInterpolation(Lcom/badlogic/gdx/math/Interpolation;)V

    return-object v0
.end method

.method public static sizeTo(FF)Lcom/badlogic/gdx/scenes/scene2d/actions/SizeToAction;
    .locals 2

    const/4 v0, 0x0

    const/4 v1, 0x0

    .line 117
    invoke-static {p0, p1, v0, v1}, Lcom/badlogic/gdx/scenes/scene2d/actions/Actions;->sizeTo(FFFLcom/badlogic/gdx/math/Interpolation;)Lcom/badlogic/gdx/scenes/scene2d/actions/SizeToAction;

    move-result-object p0

    return-object p0
.end method

.method public static sizeTo(FFF)Lcom/badlogic/gdx/scenes/scene2d/actions/SizeToAction;
    .locals 1

    const/4 v0, 0x0

    .line 121
    invoke-static {p0, p1, p2, v0}, Lcom/badlogic/gdx/scenes/scene2d/actions/Actions;->sizeTo(FFFLcom/badlogic/gdx/math/Interpolation;)Lcom/badlogic/gdx/scenes/scene2d/actions/SizeToAction;

    move-result-object p0

    return-object p0
.end method

.method public static sizeTo(FFFLcom/badlogic/gdx/math/Interpolation;)Lcom/badlogic/gdx/scenes/scene2d/actions/SizeToAction;
    .locals 1

    .line 125
    const-class v0, Lcom/badlogic/gdx/scenes/scene2d/actions/SizeToAction;

    invoke-static {v0}, Lcom/badlogic/gdx/scenes/scene2d/actions/Actions;->action(Ljava/lang/Class;)Lcom/badlogic/gdx/scenes/scene2d/Action;

    move-result-object v0

    check-cast v0, Lcom/badlogic/gdx/scenes/scene2d/actions/SizeToAction;

    .line 126
    invoke-virtual {v0, p0, p1}, Lcom/badlogic/gdx/scenes/scene2d/actions/SizeToAction;->setSize(FF)V

    .line 127
    invoke-virtual {v0, p2}, Lcom/badlogic/gdx/scenes/scene2d/actions/SizeToAction;->setDuration(F)V

    .line 128
    invoke-virtual {v0, p3}, Lcom/badlogic/gdx/scenes/scene2d/actions/SizeToAction;->setInterpolation(Lcom/badlogic/gdx/math/Interpolation;)V

    return-object v0
.end method

.method public static timeScale(FLcom/badlogic/gdx/scenes/scene2d/Action;)Lcom/badlogic/gdx/scenes/scene2d/actions/TimeScaleAction;
    .locals 1

    .line 327
    const-class v0, Lcom/badlogic/gdx/scenes/scene2d/actions/TimeScaleAction;

    invoke-static {v0}, Lcom/badlogic/gdx/scenes/scene2d/actions/Actions;->action(Ljava/lang/Class;)Lcom/badlogic/gdx/scenes/scene2d/Action;

    move-result-object v0

    check-cast v0, Lcom/badlogic/gdx/scenes/scene2d/actions/TimeScaleAction;

    .line 328
    invoke-virtual {v0, p0}, Lcom/badlogic/gdx/scenes/scene2d/actions/TimeScaleAction;->setScale(F)V

    .line 329
    invoke-virtual {v0, p1}, Lcom/badlogic/gdx/scenes/scene2d/actions/TimeScaleAction;->setAction(Lcom/badlogic/gdx/scenes/scene2d/Action;)V

    return-object v0
.end method

.method public static touchable(Lcom/badlogic/gdx/scenes/scene2d/Touchable;)Lcom/badlogic/gdx/scenes/scene2d/actions/TouchableAction;
    .locals 1

    .line 298
    const-class v0, Lcom/badlogic/gdx/scenes/scene2d/actions/TouchableAction;

    invoke-static {v0}, Lcom/badlogic/gdx/scenes/scene2d/actions/Actions;->action(Ljava/lang/Class;)Lcom/badlogic/gdx/scenes/scene2d/Action;

    move-result-object v0

    check-cast v0, Lcom/badlogic/gdx/scenes/scene2d/actions/TouchableAction;

    .line 299
    invoke-virtual {v0, p0}, Lcom/badlogic/gdx/scenes/scene2d/actions/TouchableAction;->setTouchable(Lcom/badlogic/gdx/scenes/scene2d/Touchable;)V

    return-object v0
.end method

.method public static visible(Z)Lcom/badlogic/gdx/scenes/scene2d/actions/VisibleAction;
    .locals 1

    .line 292
    const-class v0, Lcom/badlogic/gdx/scenes/scene2d/actions/VisibleAction;

    invoke-static {v0}, Lcom/badlogic/gdx/scenes/scene2d/actions/Actions;->action(Ljava/lang/Class;)Lcom/badlogic/gdx/scenes/scene2d/Action;

    move-result-object v0

    check-cast v0, Lcom/badlogic/gdx/scenes/scene2d/actions/VisibleAction;

    .line 293
    invoke-virtual {v0, p0}, Lcom/badlogic/gdx/scenes/scene2d/actions/VisibleAction;->setVisible(Z)V

    return-object v0
.end method
