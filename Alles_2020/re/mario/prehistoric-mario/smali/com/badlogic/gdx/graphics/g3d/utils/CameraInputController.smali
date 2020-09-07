.class public Lcom/badlogic/gdx/graphics/g3d/utils/CameraInputController;
.super Lcom/badlogic/gdx/input/GestureDetector;
.source "CameraInputController.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/badlogic/gdx/graphics/g3d/utils/CameraInputController$CameraGestureListener;
    }
.end annotation


# instance fields
.field public activateKey:I

.field protected activatePressed:Z

.field public alwaysScroll:Z

.field public autoUpdate:Z

.field public backwardKey:I

.field protected backwardPressed:Z

.field protected button:I

.field public camera:Lcom/badlogic/gdx/graphics/Camera;

.field public forwardButton:I

.field public forwardKey:I

.field protected forwardPressed:Z

.field public forwardTarget:Z

.field protected final gestureListener:Lcom/badlogic/gdx/graphics/g3d/utils/CameraInputController$CameraGestureListener;

.field private multiTouch:Z

.field public pinchZoomFactor:F

.field public rotateAngle:F

.field public rotateButton:I

.field public rotateLeftKey:I

.field protected rotateLeftPressed:Z

.field public rotateRightKey:I

.field protected rotateRightPressed:Z

.field public scrollFactor:F

.field public scrollTarget:Z

.field private startX:F

.field private startY:F

.field public target:Lcom/badlogic/gdx/math/Vector3;

.field private final tmpV1:Lcom/badlogic/gdx/math/Vector3;

.field private final tmpV2:Lcom/badlogic/gdx/math/Vector3;

.field private touched:I

.field public translateButton:I

.field public translateTarget:Z

.field public translateUnits:F


# direct methods
.method public constructor <init>(Lcom/badlogic/gdx/graphics/Camera;)V
    .locals 1

    .line 132
    new-instance v0, Lcom/badlogic/gdx/graphics/g3d/utils/CameraInputController$CameraGestureListener;

    invoke-direct {v0}, Lcom/badlogic/gdx/graphics/g3d/utils/CameraInputController$CameraGestureListener;-><init>()V

    invoke-direct {p0, v0, p1}, Lcom/badlogic/gdx/graphics/g3d/utils/CameraInputController;-><init>(Lcom/badlogic/gdx/graphics/g3d/utils/CameraInputController$CameraGestureListener;Lcom/badlogic/gdx/graphics/Camera;)V

    return-void
.end method

.method protected constructor <init>(Lcom/badlogic/gdx/graphics/g3d/utils/CameraInputController$CameraGestureListener;Lcom/badlogic/gdx/graphics/Camera;)V
    .locals 4

    .line 125
    invoke-direct {p0, p1}, Lcom/badlogic/gdx/input/GestureDetector;-><init>(Lcom/badlogic/gdx/input/GestureDetector$GestureListener;)V

    const/4 v0, 0x0

    .line 31
    iput v0, p0, Lcom/badlogic/gdx/graphics/g3d/utils/CameraInputController;->rotateButton:I

    const/high16 v1, 0x43b40000    # 360.0f

    .line 33
    iput v1, p0, Lcom/badlogic/gdx/graphics/g3d/utils/CameraInputController;->rotateAngle:F

    const/4 v1, 0x1

    .line 35
    iput v1, p0, Lcom/badlogic/gdx/graphics/g3d/utils/CameraInputController;->translateButton:I

    const/high16 v2, 0x41200000    # 10.0f

    .line 37
    iput v2, p0, Lcom/badlogic/gdx/graphics/g3d/utils/CameraInputController;->translateUnits:F

    const/4 v3, 0x2

    .line 39
    iput v3, p0, Lcom/badlogic/gdx/graphics/g3d/utils/CameraInputController;->forwardButton:I

    .line 41
    iput v0, p0, Lcom/badlogic/gdx/graphics/g3d/utils/CameraInputController;->activateKey:I

    .line 45
    iput-boolean v1, p0, Lcom/badlogic/gdx/graphics/g3d/utils/CameraInputController;->alwaysScroll:Z

    const v3, -0x42333333    # -0.1f

    .line 47
    iput v3, p0, Lcom/badlogic/gdx/graphics/g3d/utils/CameraInputController;->scrollFactor:F

    .line 49
    iput v2, p0, Lcom/badlogic/gdx/graphics/g3d/utils/CameraInputController;->pinchZoomFactor:F

    .line 51
    iput-boolean v1, p0, Lcom/badlogic/gdx/graphics/g3d/utils/CameraInputController;->autoUpdate:Z

    .line 53
    new-instance v2, Lcom/badlogic/gdx/math/Vector3;

    invoke-direct {v2}, Lcom/badlogic/gdx/math/Vector3;-><init>()V

    iput-object v2, p0, Lcom/badlogic/gdx/graphics/g3d/utils/CameraInputController;->target:Lcom/badlogic/gdx/math/Vector3;

    .line 55
    iput-boolean v1, p0, Lcom/badlogic/gdx/graphics/g3d/utils/CameraInputController;->translateTarget:Z

    .line 57
    iput-boolean v1, p0, Lcom/badlogic/gdx/graphics/g3d/utils/CameraInputController;->forwardTarget:Z

    .line 59
    iput-boolean v0, p0, Lcom/badlogic/gdx/graphics/g3d/utils/CameraInputController;->scrollTarget:Z

    const/16 v0, 0x33

    .line 60
    iput v0, p0, Lcom/badlogic/gdx/graphics/g3d/utils/CameraInputController;->forwardKey:I

    const/16 v0, 0x2f

    .line 62
    iput v0, p0, Lcom/badlogic/gdx/graphics/g3d/utils/CameraInputController;->backwardKey:I

    const/16 v0, 0x1d

    .line 64
    iput v0, p0, Lcom/badlogic/gdx/graphics/g3d/utils/CameraInputController;->rotateRightKey:I

    const/16 v0, 0x20

    .line 66
    iput v0, p0, Lcom/badlogic/gdx/graphics/g3d/utils/CameraInputController;->rotateLeftKey:I

    const/4 v0, -0x1

    .line 71
    iput v0, p0, Lcom/badlogic/gdx/graphics/g3d/utils/CameraInputController;->button:I

    .line 74
    new-instance v0, Lcom/badlogic/gdx/math/Vector3;

    invoke-direct {v0}, Lcom/badlogic/gdx/math/Vector3;-><init>()V

    iput-object v0, p0, Lcom/badlogic/gdx/graphics/g3d/utils/CameraInputController;->tmpV1:Lcom/badlogic/gdx/math/Vector3;

    .line 75
    new-instance v0, Lcom/badlogic/gdx/math/Vector3;

    invoke-direct {v0}, Lcom/badlogic/gdx/math/Vector3;-><init>()V

    iput-object v0, p0, Lcom/badlogic/gdx/graphics/g3d/utils/CameraInputController;->tmpV2:Lcom/badlogic/gdx/math/Vector3;

    .line 126
    iput-object p1, p0, Lcom/badlogic/gdx/graphics/g3d/utils/CameraInputController;->gestureListener:Lcom/badlogic/gdx/graphics/g3d/utils/CameraInputController$CameraGestureListener;

    .line 127
    iget-object p1, p0, Lcom/badlogic/gdx/graphics/g3d/utils/CameraInputController;->gestureListener:Lcom/badlogic/gdx/graphics/g3d/utils/CameraInputController$CameraGestureListener;

    iput-object p0, p1, Lcom/badlogic/gdx/graphics/g3d/utils/CameraInputController$CameraGestureListener;->controller:Lcom/badlogic/gdx/graphics/g3d/utils/CameraInputController;

    .line 128
    iput-object p2, p0, Lcom/badlogic/gdx/graphics/g3d/utils/CameraInputController;->camera:Lcom/badlogic/gdx/graphics/Camera;

    return-void
.end method


# virtual methods
.method public keyDown(I)Z
    .locals 2

    .line 224
    iget v0, p0, Lcom/badlogic/gdx/graphics/g3d/utils/CameraInputController;->activateKey:I

    const/4 v1, 0x1

    if-ne p1, v0, :cond_0

    iput-boolean v1, p0, Lcom/badlogic/gdx/graphics/g3d/utils/CameraInputController;->activatePressed:Z

    .line 225
    :cond_0
    iget v0, p0, Lcom/badlogic/gdx/graphics/g3d/utils/CameraInputController;->forwardKey:I

    if-ne p1, v0, :cond_1

    .line 226
    iput-boolean v1, p0, Lcom/badlogic/gdx/graphics/g3d/utils/CameraInputController;->forwardPressed:Z

    goto :goto_0

    .line 227
    :cond_1
    iget v0, p0, Lcom/badlogic/gdx/graphics/g3d/utils/CameraInputController;->backwardKey:I

    if-ne p1, v0, :cond_2

    .line 228
    iput-boolean v1, p0, Lcom/badlogic/gdx/graphics/g3d/utils/CameraInputController;->backwardPressed:Z

    goto :goto_0

    .line 229
    :cond_2
    iget v0, p0, Lcom/badlogic/gdx/graphics/g3d/utils/CameraInputController;->rotateRightKey:I

    if-ne p1, v0, :cond_3

    .line 230
    iput-boolean v1, p0, Lcom/badlogic/gdx/graphics/g3d/utils/CameraInputController;->rotateRightPressed:Z

    goto :goto_0

    .line 231
    :cond_3
    iget v0, p0, Lcom/badlogic/gdx/graphics/g3d/utils/CameraInputController;->rotateLeftKey:I

    if-ne p1, v0, :cond_4

    iput-boolean v1, p0, Lcom/badlogic/gdx/graphics/g3d/utils/CameraInputController;->rotateLeftPressed:Z

    :cond_4
    :goto_0
    const/4 p1, 0x0

    return p1
.end method

.method public keyUp(I)Z
    .locals 2

    .line 237
    iget v0, p0, Lcom/badlogic/gdx/graphics/g3d/utils/CameraInputController;->activateKey:I

    const/4 v1, 0x0

    if-ne p1, v0, :cond_0

    .line 238
    iput-boolean v1, p0, Lcom/badlogic/gdx/graphics/g3d/utils/CameraInputController;->activatePressed:Z

    const/4 v0, -0x1

    .line 239
    iput v0, p0, Lcom/badlogic/gdx/graphics/g3d/utils/CameraInputController;->button:I

    .line 241
    :cond_0
    iget v0, p0, Lcom/badlogic/gdx/graphics/g3d/utils/CameraInputController;->forwardKey:I

    if-ne p1, v0, :cond_1

    .line 242
    iput-boolean v1, p0, Lcom/badlogic/gdx/graphics/g3d/utils/CameraInputController;->forwardPressed:Z

    goto :goto_0

    .line 243
    :cond_1
    iget v0, p0, Lcom/badlogic/gdx/graphics/g3d/utils/CameraInputController;->backwardKey:I

    if-ne p1, v0, :cond_2

    .line 244
    iput-boolean v1, p0, Lcom/badlogic/gdx/graphics/g3d/utils/CameraInputController;->backwardPressed:Z

    goto :goto_0

    .line 245
    :cond_2
    iget v0, p0, Lcom/badlogic/gdx/graphics/g3d/utils/CameraInputController;->rotateRightKey:I

    if-ne p1, v0, :cond_3

    .line 246
    iput-boolean v1, p0, Lcom/badlogic/gdx/graphics/g3d/utils/CameraInputController;->rotateRightPressed:Z

    goto :goto_0

    .line 247
    :cond_3
    iget v0, p0, Lcom/badlogic/gdx/graphics/g3d/utils/CameraInputController;->rotateLeftKey:I

    if-ne p1, v0, :cond_4

    iput-boolean v1, p0, Lcom/badlogic/gdx/graphics/g3d/utils/CameraInputController;->rotateLeftPressed:Z

    :cond_4
    :goto_0
    return v1
.end method

.method protected pinchZoom(F)Z
    .locals 1

    .line 219
    iget v0, p0, Lcom/badlogic/gdx/graphics/g3d/utils/CameraInputController;->pinchZoomFactor:F

    mul-float v0, v0, p1

    invoke-virtual {p0, v0}, Lcom/badlogic/gdx/graphics/g3d/utils/CameraInputController;->zoom(F)Z

    move-result p1

    return p1
.end method

.method protected process(FFI)Z
    .locals 3

    .line 178
    iget v0, p0, Lcom/badlogic/gdx/graphics/g3d/utils/CameraInputController;->rotateButton:I

    if-ne p3, v0, :cond_0

    .line 179
    iget-object p3, p0, Lcom/badlogic/gdx/graphics/g3d/utils/CameraInputController;->tmpV1:Lcom/badlogic/gdx/math/Vector3;

    iget-object v0, p0, Lcom/badlogic/gdx/graphics/g3d/utils/CameraInputController;->camera:Lcom/badlogic/gdx/graphics/Camera;

    iget-object v0, v0, Lcom/badlogic/gdx/graphics/Camera;->direction:Lcom/badlogic/gdx/math/Vector3;

    invoke-virtual {p3, v0}, Lcom/badlogic/gdx/math/Vector3;->set(Lcom/badlogic/gdx/math/Vector3;)Lcom/badlogic/gdx/math/Vector3;

    move-result-object p3

    iget-object v0, p0, Lcom/badlogic/gdx/graphics/g3d/utils/CameraInputController;->camera:Lcom/badlogic/gdx/graphics/Camera;

    iget-object v0, v0, Lcom/badlogic/gdx/graphics/Camera;->up:Lcom/badlogic/gdx/math/Vector3;

    invoke-virtual {p3, v0}, Lcom/badlogic/gdx/math/Vector3;->crs(Lcom/badlogic/gdx/math/Vector3;)Lcom/badlogic/gdx/math/Vector3;

    move-result-object p3

    const/4 v0, 0x0

    iput v0, p3, Lcom/badlogic/gdx/math/Vector3;->y:F

    .line 180
    iget-object p3, p0, Lcom/badlogic/gdx/graphics/g3d/utils/CameraInputController;->camera:Lcom/badlogic/gdx/graphics/Camera;

    iget-object v0, p0, Lcom/badlogic/gdx/graphics/g3d/utils/CameraInputController;->target:Lcom/badlogic/gdx/math/Vector3;

    iget-object v1, p0, Lcom/badlogic/gdx/graphics/g3d/utils/CameraInputController;->tmpV1:Lcom/badlogic/gdx/math/Vector3;

    invoke-virtual {v1}, Lcom/badlogic/gdx/math/Vector3;->nor()Lcom/badlogic/gdx/math/Vector3;

    move-result-object v1

    iget v2, p0, Lcom/badlogic/gdx/graphics/g3d/utils/CameraInputController;->rotateAngle:F

    mul-float p2, p2, v2

    invoke-virtual {p3, v0, v1, p2}, Lcom/badlogic/gdx/graphics/Camera;->rotateAround(Lcom/badlogic/gdx/math/Vector3;Lcom/badlogic/gdx/math/Vector3;F)V

    .line 181
    iget-object p2, p0, Lcom/badlogic/gdx/graphics/g3d/utils/CameraInputController;->camera:Lcom/badlogic/gdx/graphics/Camera;

    iget-object p3, p0, Lcom/badlogic/gdx/graphics/g3d/utils/CameraInputController;->target:Lcom/badlogic/gdx/math/Vector3;

    sget-object v0, Lcom/badlogic/gdx/math/Vector3;->Y:Lcom/badlogic/gdx/math/Vector3;

    iget v1, p0, Lcom/badlogic/gdx/graphics/g3d/utils/CameraInputController;->rotateAngle:F

    neg-float v1, v1

    mul-float p1, p1, v1

    invoke-virtual {p2, p3, v0, p1}, Lcom/badlogic/gdx/graphics/Camera;->rotateAround(Lcom/badlogic/gdx/math/Vector3;Lcom/badlogic/gdx/math/Vector3;F)V

    goto :goto_0

    .line 182
    :cond_0
    iget v0, p0, Lcom/badlogic/gdx/graphics/g3d/utils/CameraInputController;->translateButton:I

    if-ne p3, v0, :cond_1

    .line 183
    iget-object p3, p0, Lcom/badlogic/gdx/graphics/g3d/utils/CameraInputController;->camera:Lcom/badlogic/gdx/graphics/Camera;

    iget-object v0, p0, Lcom/badlogic/gdx/graphics/g3d/utils/CameraInputController;->tmpV1:Lcom/badlogic/gdx/math/Vector3;

    iget-object v1, p3, Lcom/badlogic/gdx/graphics/Camera;->direction:Lcom/badlogic/gdx/math/Vector3;

    invoke-virtual {v0, v1}, Lcom/badlogic/gdx/math/Vector3;->set(Lcom/badlogic/gdx/math/Vector3;)Lcom/badlogic/gdx/math/Vector3;

    move-result-object v0

    iget-object v1, p0, Lcom/badlogic/gdx/graphics/g3d/utils/CameraInputController;->camera:Lcom/badlogic/gdx/graphics/Camera;

    iget-object v1, v1, Lcom/badlogic/gdx/graphics/Camera;->up:Lcom/badlogic/gdx/math/Vector3;

    invoke-virtual {v0, v1}, Lcom/badlogic/gdx/math/Vector3;->crs(Lcom/badlogic/gdx/math/Vector3;)Lcom/badlogic/gdx/math/Vector3;

    move-result-object v0

    invoke-virtual {v0}, Lcom/badlogic/gdx/math/Vector3;->nor()Lcom/badlogic/gdx/math/Vector3;

    move-result-object v0

    neg-float p1, p1

    iget v1, p0, Lcom/badlogic/gdx/graphics/g3d/utils/CameraInputController;->translateUnits:F

    mul-float p1, p1, v1

    invoke-virtual {v0, p1}, Lcom/badlogic/gdx/math/Vector3;->scl(F)Lcom/badlogic/gdx/math/Vector3;

    move-result-object p1

    invoke-virtual {p3, p1}, Lcom/badlogic/gdx/graphics/Camera;->translate(Lcom/badlogic/gdx/math/Vector3;)V

    .line 184
    iget-object p1, p0, Lcom/badlogic/gdx/graphics/g3d/utils/CameraInputController;->camera:Lcom/badlogic/gdx/graphics/Camera;

    iget-object p3, p0, Lcom/badlogic/gdx/graphics/g3d/utils/CameraInputController;->tmpV2:Lcom/badlogic/gdx/math/Vector3;

    iget-object v0, p1, Lcom/badlogic/gdx/graphics/Camera;->up:Lcom/badlogic/gdx/math/Vector3;

    invoke-virtual {p3, v0}, Lcom/badlogic/gdx/math/Vector3;->set(Lcom/badlogic/gdx/math/Vector3;)Lcom/badlogic/gdx/math/Vector3;

    move-result-object p3

    neg-float p2, p2

    iget v0, p0, Lcom/badlogic/gdx/graphics/g3d/utils/CameraInputController;->translateUnits:F

    mul-float p2, p2, v0

    invoke-virtual {p3, p2}, Lcom/badlogic/gdx/math/Vector3;->scl(F)Lcom/badlogic/gdx/math/Vector3;

    move-result-object p2

    invoke-virtual {p1, p2}, Lcom/badlogic/gdx/graphics/Camera;->translate(Lcom/badlogic/gdx/math/Vector3;)V

    .line 185
    iget-boolean p1, p0, Lcom/badlogic/gdx/graphics/g3d/utils/CameraInputController;->translateTarget:Z

    if-eqz p1, :cond_2

    iget-object p1, p0, Lcom/badlogic/gdx/graphics/g3d/utils/CameraInputController;->target:Lcom/badlogic/gdx/math/Vector3;

    iget-object p2, p0, Lcom/badlogic/gdx/graphics/g3d/utils/CameraInputController;->tmpV1:Lcom/badlogic/gdx/math/Vector3;

    invoke-virtual {p1, p2}, Lcom/badlogic/gdx/math/Vector3;->add(Lcom/badlogic/gdx/math/Vector3;)Lcom/badlogic/gdx/math/Vector3;

    move-result-object p1

    iget-object p2, p0, Lcom/badlogic/gdx/graphics/g3d/utils/CameraInputController;->tmpV2:Lcom/badlogic/gdx/math/Vector3;

    invoke-virtual {p1, p2}, Lcom/badlogic/gdx/math/Vector3;->add(Lcom/badlogic/gdx/math/Vector3;)Lcom/badlogic/gdx/math/Vector3;

    goto :goto_0

    .line 186
    :cond_1
    iget p1, p0, Lcom/badlogic/gdx/graphics/g3d/utils/CameraInputController;->forwardButton:I

    if-ne p3, p1, :cond_2

    .line 187
    iget-object p1, p0, Lcom/badlogic/gdx/graphics/g3d/utils/CameraInputController;->camera:Lcom/badlogic/gdx/graphics/Camera;

    iget-object p3, p0, Lcom/badlogic/gdx/graphics/g3d/utils/CameraInputController;->tmpV1:Lcom/badlogic/gdx/math/Vector3;

    iget-object v0, p1, Lcom/badlogic/gdx/graphics/Camera;->direction:Lcom/badlogic/gdx/math/Vector3;

    invoke-virtual {p3, v0}, Lcom/badlogic/gdx/math/Vector3;->set(Lcom/badlogic/gdx/math/Vector3;)Lcom/badlogic/gdx/math/Vector3;

    move-result-object p3

    iget v0, p0, Lcom/badlogic/gdx/graphics/g3d/utils/CameraInputController;->translateUnits:F

    mul-float p2, p2, v0

    invoke-virtual {p3, p2}, Lcom/badlogic/gdx/math/Vector3;->scl(F)Lcom/badlogic/gdx/math/Vector3;

    move-result-object p2

    invoke-virtual {p1, p2}, Lcom/badlogic/gdx/graphics/Camera;->translate(Lcom/badlogic/gdx/math/Vector3;)V

    .line 188
    iget-boolean p1, p0, Lcom/badlogic/gdx/graphics/g3d/utils/CameraInputController;->forwardTarget:Z

    if-eqz p1, :cond_2

    iget-object p1, p0, Lcom/badlogic/gdx/graphics/g3d/utils/CameraInputController;->target:Lcom/badlogic/gdx/math/Vector3;

    iget-object p2, p0, Lcom/badlogic/gdx/graphics/g3d/utils/CameraInputController;->tmpV1:Lcom/badlogic/gdx/math/Vector3;

    invoke-virtual {p1, p2}, Lcom/badlogic/gdx/math/Vector3;->add(Lcom/badlogic/gdx/math/Vector3;)Lcom/badlogic/gdx/math/Vector3;

    .line 190
    :cond_2
    :goto_0
    iget-boolean p1, p0, Lcom/badlogic/gdx/graphics/g3d/utils/CameraInputController;->autoUpdate:Z

    if-eqz p1, :cond_3

    iget-object p1, p0, Lcom/badlogic/gdx/graphics/g3d/utils/CameraInputController;->camera:Lcom/badlogic/gdx/graphics/Camera;

    invoke-virtual {p1}, Lcom/badlogic/gdx/graphics/Camera;->update()V

    :cond_3
    const/4 p1, 0x1

    return p1
.end method

.method public scrolled(I)Z
    .locals 1

    int-to-float p1, p1

    .line 207
    iget v0, p0, Lcom/badlogic/gdx/graphics/g3d/utils/CameraInputController;->scrollFactor:F

    mul-float p1, p1, v0

    iget v0, p0, Lcom/badlogic/gdx/graphics/g3d/utils/CameraInputController;->translateUnits:F

    mul-float p1, p1, v0

    invoke-virtual {p0, p1}, Lcom/badlogic/gdx/graphics/g3d/utils/CameraInputController;->zoom(F)Z

    move-result p1

    return p1
.end method

.method public touchDown(IIII)Z
    .locals 3

    .line 157
    iget v0, p0, Lcom/badlogic/gdx/graphics/g3d/utils/CameraInputController;->touched:I

    const/4 v1, 0x1

    shl-int v2, v1, p3

    or-int/2addr v0, v2

    iput v0, p0, Lcom/badlogic/gdx/graphics/g3d/utils/CameraInputController;->touched:I

    .line 158
    iget v0, p0, Lcom/badlogic/gdx/graphics/g3d/utils/CameraInputController;->touched:I

    invoke-static {v0}, Lcom/badlogic/gdx/math/MathUtils;->isPowerOfTwo(I)Z

    move-result v0

    xor-int/2addr v0, v1

    iput-boolean v0, p0, Lcom/badlogic/gdx/graphics/g3d/utils/CameraInputController;->multiTouch:Z

    .line 159
    iget-boolean v0, p0, Lcom/badlogic/gdx/graphics/g3d/utils/CameraInputController;->multiTouch:Z

    if-eqz v0, :cond_0

    const/4 v0, -0x1

    .line 160
    iput v0, p0, Lcom/badlogic/gdx/graphics/g3d/utils/CameraInputController;->button:I

    goto :goto_0

    .line 161
    :cond_0
    iget v0, p0, Lcom/badlogic/gdx/graphics/g3d/utils/CameraInputController;->button:I

    if-gez v0, :cond_2

    iget v0, p0, Lcom/badlogic/gdx/graphics/g3d/utils/CameraInputController;->activateKey:I

    if-eqz v0, :cond_1

    iget-boolean v0, p0, Lcom/badlogic/gdx/graphics/g3d/utils/CameraInputController;->activatePressed:Z

    if-eqz v0, :cond_2

    :cond_1
    int-to-float v0, p1

    .line 162
    iput v0, p0, Lcom/badlogic/gdx/graphics/g3d/utils/CameraInputController;->startX:F

    int-to-float v0, p2

    .line 163
    iput v0, p0, Lcom/badlogic/gdx/graphics/g3d/utils/CameraInputController;->startY:F

    .line 164
    iput p4, p0, Lcom/badlogic/gdx/graphics/g3d/utils/CameraInputController;->button:I

    .line 166
    :cond_2
    :goto_0
    invoke-super {p0, p1, p2, p3, p4}, Lcom/badlogic/gdx/input/GestureDetector;->touchDown(IIII)Z

    move-result p1

    if-nez p1, :cond_4

    iget p1, p0, Lcom/badlogic/gdx/graphics/g3d/utils/CameraInputController;->activateKey:I

    if-eqz p1, :cond_4

    iget-boolean p1, p0, Lcom/badlogic/gdx/graphics/g3d/utils/CameraInputController;->activatePressed:Z

    if-eqz p1, :cond_3

    goto :goto_1

    :cond_3
    const/4 v1, 0x0

    :cond_4
    :goto_1
    return v1
.end method

.method public touchDragged(III)Z
    .locals 2

    .line 196
    invoke-super {p0, p1, p2, p3}, Lcom/badlogic/gdx/input/GestureDetector;->touchDragged(III)Z

    move-result p3

    if-nez p3, :cond_1

    .line 197
    iget v0, p0, Lcom/badlogic/gdx/graphics/g3d/utils/CameraInputController;->button:I

    if-gez v0, :cond_0

    goto :goto_0

    :cond_0
    int-to-float p1, p1

    .line 198
    iget p3, p0, Lcom/badlogic/gdx/graphics/g3d/utils/CameraInputController;->startX:F

    sub-float p3, p1, p3

    sget-object v0, Lcom/badlogic/gdx/Gdx;->graphics:Lcom/badlogic/gdx/Graphics;

    invoke-interface {v0}, Lcom/badlogic/gdx/Graphics;->getWidth()I

    move-result v0

    int-to-float v0, v0

    div-float/2addr p3, v0

    .line 199
    iget v0, p0, Lcom/badlogic/gdx/graphics/g3d/utils/CameraInputController;->startY:F

    int-to-float p2, p2

    sub-float/2addr v0, p2

    sget-object v1, Lcom/badlogic/gdx/Gdx;->graphics:Lcom/badlogic/gdx/Graphics;

    invoke-interface {v1}, Lcom/badlogic/gdx/Graphics;->getHeight()I

    move-result v1

    int-to-float v1, v1

    div-float/2addr v0, v1

    .line 200
    iput p1, p0, Lcom/badlogic/gdx/graphics/g3d/utils/CameraInputController;->startX:F

    .line 201
    iput p2, p0, Lcom/badlogic/gdx/graphics/g3d/utils/CameraInputController;->startY:F

    .line 202
    iget p1, p0, Lcom/badlogic/gdx/graphics/g3d/utils/CameraInputController;->button:I

    invoke-virtual {p0, p3, v0, p1}, Lcom/badlogic/gdx/graphics/g3d/utils/CameraInputController;->process(FFI)Z

    move-result p1

    return p1

    :cond_1
    :goto_0
    return p3
.end method

.method public touchUp(IIII)Z
    .locals 4

    .line 171
    iget v0, p0, Lcom/badlogic/gdx/graphics/g3d/utils/CameraInputController;->touched:I

    const/4 v1, 0x1

    shl-int v2, v1, p3

    const/4 v3, -0x1

    xor-int/2addr v2, v3

    and-int/2addr v0, v2

    iput v0, p0, Lcom/badlogic/gdx/graphics/g3d/utils/CameraInputController;->touched:I

    .line 172
    iget v0, p0, Lcom/badlogic/gdx/graphics/g3d/utils/CameraInputController;->touched:I

    invoke-static {v0}, Lcom/badlogic/gdx/math/MathUtils;->isPowerOfTwo(I)Z

    move-result v0

    xor-int/2addr v0, v1

    iput-boolean v0, p0, Lcom/badlogic/gdx/graphics/g3d/utils/CameraInputController;->multiTouch:Z

    .line 173
    iget v0, p0, Lcom/badlogic/gdx/graphics/g3d/utils/CameraInputController;->button:I

    if-ne p4, v0, :cond_0

    iput v3, p0, Lcom/badlogic/gdx/graphics/g3d/utils/CameraInputController;->button:I

    .line 174
    :cond_0
    invoke-super {p0, p1, p2, p3, p4}, Lcom/badlogic/gdx/input/GestureDetector;->touchUp(IIII)Z

    move-result p1

    if-nez p1, :cond_2

    iget-boolean p1, p0, Lcom/badlogic/gdx/graphics/g3d/utils/CameraInputController;->activatePressed:Z

    if-eqz p1, :cond_1

    goto :goto_0

    :cond_1
    const/4 v1, 0x0

    :cond_2
    :goto_0
    return v1
.end method

.method public update()V
    .locals 5

    .line 136
    iget-boolean v0, p0, Lcom/badlogic/gdx/graphics/g3d/utils/CameraInputController;->rotateRightPressed:Z

    if-nez v0, :cond_0

    iget-boolean v0, p0, Lcom/badlogic/gdx/graphics/g3d/utils/CameraInputController;->rotateLeftPressed:Z

    if-nez v0, :cond_0

    iget-boolean v0, p0, Lcom/badlogic/gdx/graphics/g3d/utils/CameraInputController;->forwardPressed:Z

    if-nez v0, :cond_0

    iget-boolean v0, p0, Lcom/badlogic/gdx/graphics/g3d/utils/CameraInputController;->backwardPressed:Z

    if-eqz v0, :cond_5

    .line 137
    :cond_0
    sget-object v0, Lcom/badlogic/gdx/Gdx;->graphics:Lcom/badlogic/gdx/Graphics;

    invoke-interface {v0}, Lcom/badlogic/gdx/Graphics;->getDeltaTime()F

    move-result v0

    .line 138
    iget-boolean v1, p0, Lcom/badlogic/gdx/graphics/g3d/utils/CameraInputController;->rotateRightPressed:Z

    if-eqz v1, :cond_1

    iget-object v1, p0, Lcom/badlogic/gdx/graphics/g3d/utils/CameraInputController;->camera:Lcom/badlogic/gdx/graphics/Camera;

    iget-object v2, v1, Lcom/badlogic/gdx/graphics/Camera;->up:Lcom/badlogic/gdx/math/Vector3;

    neg-float v3, v0

    iget v4, p0, Lcom/badlogic/gdx/graphics/g3d/utils/CameraInputController;->rotateAngle:F

    mul-float v3, v3, v4

    invoke-virtual {v1, v2, v3}, Lcom/badlogic/gdx/graphics/Camera;->rotate(Lcom/badlogic/gdx/math/Vector3;F)V

    .line 139
    :cond_1
    iget-boolean v1, p0, Lcom/badlogic/gdx/graphics/g3d/utils/CameraInputController;->rotateLeftPressed:Z

    if-eqz v1, :cond_2

    iget-object v1, p0, Lcom/badlogic/gdx/graphics/g3d/utils/CameraInputController;->camera:Lcom/badlogic/gdx/graphics/Camera;

    iget-object v2, v1, Lcom/badlogic/gdx/graphics/Camera;->up:Lcom/badlogic/gdx/math/Vector3;

    iget v3, p0, Lcom/badlogic/gdx/graphics/g3d/utils/CameraInputController;->rotateAngle:F

    mul-float v3, v3, v0

    invoke-virtual {v1, v2, v3}, Lcom/badlogic/gdx/graphics/Camera;->rotate(Lcom/badlogic/gdx/math/Vector3;F)V

    .line 140
    :cond_2
    iget-boolean v1, p0, Lcom/badlogic/gdx/graphics/g3d/utils/CameraInputController;->forwardPressed:Z

    if-eqz v1, :cond_3

    .line 141
    iget-object v1, p0, Lcom/badlogic/gdx/graphics/g3d/utils/CameraInputController;->camera:Lcom/badlogic/gdx/graphics/Camera;

    iget-object v2, p0, Lcom/badlogic/gdx/graphics/g3d/utils/CameraInputController;->tmpV1:Lcom/badlogic/gdx/math/Vector3;

    iget-object v3, v1, Lcom/badlogic/gdx/graphics/Camera;->direction:Lcom/badlogic/gdx/math/Vector3;

    invoke-virtual {v2, v3}, Lcom/badlogic/gdx/math/Vector3;->set(Lcom/badlogic/gdx/math/Vector3;)Lcom/badlogic/gdx/math/Vector3;

    move-result-object v2

    iget v3, p0, Lcom/badlogic/gdx/graphics/g3d/utils/CameraInputController;->translateUnits:F

    mul-float v3, v3, v0

    invoke-virtual {v2, v3}, Lcom/badlogic/gdx/math/Vector3;->scl(F)Lcom/badlogic/gdx/math/Vector3;

    move-result-object v2

    invoke-virtual {v1, v2}, Lcom/badlogic/gdx/graphics/Camera;->translate(Lcom/badlogic/gdx/math/Vector3;)V

    .line 142
    iget-boolean v1, p0, Lcom/badlogic/gdx/graphics/g3d/utils/CameraInputController;->forwardTarget:Z

    if-eqz v1, :cond_3

    iget-object v1, p0, Lcom/badlogic/gdx/graphics/g3d/utils/CameraInputController;->target:Lcom/badlogic/gdx/math/Vector3;

    iget-object v2, p0, Lcom/badlogic/gdx/graphics/g3d/utils/CameraInputController;->tmpV1:Lcom/badlogic/gdx/math/Vector3;

    invoke-virtual {v1, v2}, Lcom/badlogic/gdx/math/Vector3;->add(Lcom/badlogic/gdx/math/Vector3;)Lcom/badlogic/gdx/math/Vector3;

    .line 144
    :cond_3
    iget-boolean v1, p0, Lcom/badlogic/gdx/graphics/g3d/utils/CameraInputController;->backwardPressed:Z

    if-eqz v1, :cond_4

    .line 145
    iget-object v1, p0, Lcom/badlogic/gdx/graphics/g3d/utils/CameraInputController;->camera:Lcom/badlogic/gdx/graphics/Camera;

    iget-object v2, p0, Lcom/badlogic/gdx/graphics/g3d/utils/CameraInputController;->tmpV1:Lcom/badlogic/gdx/math/Vector3;

    iget-object v3, v1, Lcom/badlogic/gdx/graphics/Camera;->direction:Lcom/badlogic/gdx/math/Vector3;

    invoke-virtual {v2, v3}, Lcom/badlogic/gdx/math/Vector3;->set(Lcom/badlogic/gdx/math/Vector3;)Lcom/badlogic/gdx/math/Vector3;

    move-result-object v2

    neg-float v0, v0

    iget v3, p0, Lcom/badlogic/gdx/graphics/g3d/utils/CameraInputController;->translateUnits:F

    mul-float v0, v0, v3

    invoke-virtual {v2, v0}, Lcom/badlogic/gdx/math/Vector3;->scl(F)Lcom/badlogic/gdx/math/Vector3;

    move-result-object v0

    invoke-virtual {v1, v0}, Lcom/badlogic/gdx/graphics/Camera;->translate(Lcom/badlogic/gdx/math/Vector3;)V

    .line 146
    iget-boolean v0, p0, Lcom/badlogic/gdx/graphics/g3d/utils/CameraInputController;->forwardTarget:Z

    if-eqz v0, :cond_4

    iget-object v0, p0, Lcom/badlogic/gdx/graphics/g3d/utils/CameraInputController;->target:Lcom/badlogic/gdx/math/Vector3;

    iget-object v1, p0, Lcom/badlogic/gdx/graphics/g3d/utils/CameraInputController;->tmpV1:Lcom/badlogic/gdx/math/Vector3;

    invoke-virtual {v0, v1}, Lcom/badlogic/gdx/math/Vector3;->add(Lcom/badlogic/gdx/math/Vector3;)Lcom/badlogic/gdx/math/Vector3;

    .line 148
    :cond_4
    iget-boolean v0, p0, Lcom/badlogic/gdx/graphics/g3d/utils/CameraInputController;->autoUpdate:Z

    if-eqz v0, :cond_5

    iget-object v0, p0, Lcom/badlogic/gdx/graphics/g3d/utils/CameraInputController;->camera:Lcom/badlogic/gdx/graphics/Camera;

    invoke-virtual {v0}, Lcom/badlogic/gdx/graphics/Camera;->update()V

    :cond_5
    return-void
.end method

.method public zoom(F)Z
    .locals 3

    .line 211
    iget-boolean v0, p0, Lcom/badlogic/gdx/graphics/g3d/utils/CameraInputController;->alwaysScroll:Z

    if-nez v0, :cond_0

    iget v0, p0, Lcom/badlogic/gdx/graphics/g3d/utils/CameraInputController;->activateKey:I

    if-eqz v0, :cond_0

    iget-boolean v0, p0, Lcom/badlogic/gdx/graphics/g3d/utils/CameraInputController;->activatePressed:Z

    if-nez v0, :cond_0

    const/4 p1, 0x0

    return p1

    .line 212
    :cond_0
    iget-object v0, p0, Lcom/badlogic/gdx/graphics/g3d/utils/CameraInputController;->camera:Lcom/badlogic/gdx/graphics/Camera;

    iget-object v1, p0, Lcom/badlogic/gdx/graphics/g3d/utils/CameraInputController;->tmpV1:Lcom/badlogic/gdx/math/Vector3;

    iget-object v2, v0, Lcom/badlogic/gdx/graphics/Camera;->direction:Lcom/badlogic/gdx/math/Vector3;

    invoke-virtual {v1, v2}, Lcom/badlogic/gdx/math/Vector3;->set(Lcom/badlogic/gdx/math/Vector3;)Lcom/badlogic/gdx/math/Vector3;

    move-result-object v1

    invoke-virtual {v1, p1}, Lcom/badlogic/gdx/math/Vector3;->scl(F)Lcom/badlogic/gdx/math/Vector3;

    move-result-object p1

    invoke-virtual {v0, p1}, Lcom/badlogic/gdx/graphics/Camera;->translate(Lcom/badlogic/gdx/math/Vector3;)V

    .line 213
    iget-boolean p1, p0, Lcom/badlogic/gdx/graphics/g3d/utils/CameraInputController;->scrollTarget:Z

    if-eqz p1, :cond_1

    iget-object p1, p0, Lcom/badlogic/gdx/graphics/g3d/utils/CameraInputController;->target:Lcom/badlogic/gdx/math/Vector3;

    iget-object v0, p0, Lcom/badlogic/gdx/graphics/g3d/utils/CameraInputController;->tmpV1:Lcom/badlogic/gdx/math/Vector3;

    invoke-virtual {p1, v0}, Lcom/badlogic/gdx/math/Vector3;->add(Lcom/badlogic/gdx/math/Vector3;)Lcom/badlogic/gdx/math/Vector3;

    .line 214
    :cond_1
    iget-boolean p1, p0, Lcom/badlogic/gdx/graphics/g3d/utils/CameraInputController;->autoUpdate:Z

    if-eqz p1, :cond_2

    iget-object p1, p0, Lcom/badlogic/gdx/graphics/g3d/utils/CameraInputController;->camera:Lcom/badlogic/gdx/graphics/Camera;

    invoke-virtual {p1}, Lcom/badlogic/gdx/graphics/Camera;->update()V

    :cond_2
    const/4 p1, 0x1

    return p1
.end method
