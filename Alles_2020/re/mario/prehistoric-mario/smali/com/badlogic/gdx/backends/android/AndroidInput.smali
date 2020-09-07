.class public Lcom/badlogic/gdx/backends/android/AndroidInput;
.super Ljava/lang/Object;
.source "AndroidInput.java"

# interfaces
.implements Lcom/badlogic/gdx/Input;
.implements Landroid/view/View$OnKeyListener;
.implements Landroid/view/View$OnTouchListener;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/badlogic/gdx/backends/android/AndroidInput$SensorListener;,
        Lcom/badlogic/gdx/backends/android/AndroidInput$TouchEvent;,
        Lcom/badlogic/gdx/backends/android/AndroidInput$KeyEvent;
    }
.end annotation


# static fields
.field public static final NUM_TOUCHES:I = 0x14

.field public static final SUPPORTED_KEYS:I = 0x104


# instance fields
.field final R:[F

.field public accelerometerAvailable:Z

.field private accelerometerListener:Landroid/hardware/SensorEventListener;

.field protected final accelerometerValues:[F

.field final app:Lcom/badlogic/gdx/Application;

.field private azimuth:F

.field button:[I

.field private compassAvailable:Z

.field private compassListener:Landroid/hardware/SensorEventListener;

.field private final config:Lcom/badlogic/gdx/backends/android/AndroidApplicationConfiguration;

.field final context:Landroid/content/Context;

.field private currentEventTimeStamp:J

.field deltaX:[I

.field deltaY:[I

.field public gyroscopeAvailable:Z

.field private gyroscopeListener:Landroid/hardware/SensorEventListener;

.field protected final gyroscopeValues:[F

.field private handle:Landroid/os/Handler;

.field final hasMultitouch:Z

.field private inclination:F

.field private justPressedButtons:[Z

.field private justPressedKeys:[Z

.field private justTouched:Z

.field private keyCount:I

.field keyEvents:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Lcom/badlogic/gdx/backends/android/AndroidInput$KeyEvent;",
            ">;"
        }
    .end annotation
.end field

.field private keyJustPressed:Z

.field keyListeners:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Landroid/view/View$OnKeyListener;",
            ">;"
        }
    .end annotation
.end field

.field keyboardAvailable:Z

.field private keys:[Z

.field private keysToCatch:Lcom/badlogic/gdx/utils/IntSet;

.field protected final magneticFieldValues:[F

.field private manager:Landroid/hardware/SensorManager;

.field protected final nativeOrientation:Lcom/badlogic/gdx/Input$Orientation;

.field private final onscreenKeyboard:Lcom/badlogic/gdx/backends/android/AndroidOnscreenKeyboard;

.field final orientation:[F

.field private pitch:F

.field pressure:[F

.field private processor:Lcom/badlogic/gdx/InputProcessor;

.field realId:[I

.field requestFocus:Z

.field private roll:F

.field private rotationVectorAvailable:Z

.field private rotationVectorListener:Landroid/hardware/SensorEventListener;

.field protected final rotationVectorValues:[F

.field private sleepTime:I

.field private text:Ljava/lang/String;

.field private textListener:Lcom/badlogic/gdx/Input$TextInputListener;

.field touchEvents:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Lcom/badlogic/gdx/backends/android/AndroidInput$TouchEvent;",
            ">;"
        }
    .end annotation
.end field

.field protected final touchHandler:Lcom/badlogic/gdx/backends/android/AndroidTouchHandler;

.field touchX:[I

.field touchY:[I

.field touched:[Z

.field usedKeyEvents:Lcom/badlogic/gdx/utils/Pool;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/badlogic/gdx/utils/Pool<",
            "Lcom/badlogic/gdx/backends/android/AndroidInput$KeyEvent;",
            ">;"
        }
    .end annotation
.end field

.field usedTouchEvents:Lcom/badlogic/gdx/utils/Pool;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/badlogic/gdx/utils/Pool<",
            "Lcom/badlogic/gdx/backends/android/AndroidInput$TouchEvent;",
            ">;"
        }
    .end annotation
.end field

.field protected final vibrator:Landroid/os/Vibrator;


# direct methods
.method public constructor <init>(Lcom/badlogic/gdx/Application;Landroid/content/Context;Ljava/lang/Object;Lcom/badlogic/gdx/backends/android/AndroidApplicationConfiguration;)V
    .locals 4

    .line 155
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 88
    new-instance v0, Lcom/badlogic/gdx/backends/android/AndroidInput$1;

    const/16 v1, 0x3e8

    const/16 v2, 0x10

    invoke-direct {v0, p0, v2, v1}, Lcom/badlogic/gdx/backends/android/AndroidInput$1;-><init>(Lcom/badlogic/gdx/backends/android/AndroidInput;II)V

    iput-object v0, p0, Lcom/badlogic/gdx/backends/android/AndroidInput;->usedKeyEvents:Lcom/badlogic/gdx/utils/Pool;

    .line 94
    new-instance v0, Lcom/badlogic/gdx/backends/android/AndroidInput$2;

    invoke-direct {v0, p0, v2, v1}, Lcom/badlogic/gdx/backends/android/AndroidInput$2;-><init>(Lcom/badlogic/gdx/backends/android/AndroidInput;II)V

    iput-object v0, p0, Lcom/badlogic/gdx/backends/android/AndroidInput;->usedTouchEvents:Lcom/badlogic/gdx/utils/Pool;

    .line 103
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/badlogic/gdx/backends/android/AndroidInput;->keyListeners:Ljava/util/ArrayList;

    .line 104
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/badlogic/gdx/backends/android/AndroidInput;->keyEvents:Ljava/util/ArrayList;

    .line 105
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/badlogic/gdx/backends/android/AndroidInput;->touchEvents:Ljava/util/ArrayList;

    const/16 v0, 0x14

    .line 106
    new-array v1, v0, [I

    iput-object v1, p0, Lcom/badlogic/gdx/backends/android/AndroidInput;->touchX:[I

    .line 107
    new-array v1, v0, [I

    iput-object v1, p0, Lcom/badlogic/gdx/backends/android/AndroidInput;->touchY:[I

    .line 108
    new-array v1, v0, [I

    iput-object v1, p0, Lcom/badlogic/gdx/backends/android/AndroidInput;->deltaX:[I

    .line 109
    new-array v1, v0, [I

    iput-object v1, p0, Lcom/badlogic/gdx/backends/android/AndroidInput;->deltaY:[I

    .line 110
    new-array v1, v0, [Z

    iput-object v1, p0, Lcom/badlogic/gdx/backends/android/AndroidInput;->touched:[Z

    .line 111
    new-array v1, v0, [I

    iput-object v1, p0, Lcom/badlogic/gdx/backends/android/AndroidInput;->button:[I

    .line 112
    new-array v1, v0, [I

    iput-object v1, p0, Lcom/badlogic/gdx/backends/android/AndroidInput;->realId:[I

    .line 113
    new-array v1, v0, [F

    iput-object v1, p0, Lcom/badlogic/gdx/backends/android/AndroidInput;->pressure:[F

    const/4 v1, 0x0

    .line 115
    iput v1, p0, Lcom/badlogic/gdx/backends/android/AndroidInput;->keyCount:I

    const/16 v2, 0x104

    .line 116
    new-array v3, v2, [Z

    iput-object v3, p0, Lcom/badlogic/gdx/backends/android/AndroidInput;->keys:[Z

    .line 117
    iput-boolean v1, p0, Lcom/badlogic/gdx/backends/android/AndroidInput;->keyJustPressed:Z

    .line 118
    new-array v2, v2, [Z

    iput-object v2, p0, Lcom/badlogic/gdx/backends/android/AndroidInput;->justPressedKeys:[Z

    .line 119
    new-array v0, v0, [Z

    iput-object v0, p0, Lcom/badlogic/gdx/backends/android/AndroidInput;->justPressedButtons:[Z

    .line 121
    iput-boolean v1, p0, Lcom/badlogic/gdx/backends/android/AndroidInput;->accelerometerAvailable:Z

    const/4 v0, 0x3

    .line 122
    new-array v2, v0, [F

    iput-object v2, p0, Lcom/badlogic/gdx/backends/android/AndroidInput;->accelerometerValues:[F

    .line 123
    iput-boolean v1, p0, Lcom/badlogic/gdx/backends/android/AndroidInput;->gyroscopeAvailable:Z

    .line 124
    new-array v2, v0, [F

    iput-object v2, p0, Lcom/badlogic/gdx/backends/android/AndroidInput;->gyroscopeValues:[F

    const/4 v2, 0x0

    .line 125
    iput-object v2, p0, Lcom/badlogic/gdx/backends/android/AndroidInput;->text:Ljava/lang/String;

    .line 126
    iput-object v2, p0, Lcom/badlogic/gdx/backends/android/AndroidInput;->textListener:Lcom/badlogic/gdx/Input$TextInputListener;

    .line 131
    iput v1, p0, Lcom/badlogic/gdx/backends/android/AndroidInput;->sleepTime:I

    .line 132
    new-instance v2, Lcom/badlogic/gdx/utils/IntSet;

    invoke-direct {v2}, Lcom/badlogic/gdx/utils/IntSet;-><init>()V

    iput-object v2, p0, Lcom/badlogic/gdx/backends/android/AndroidInput;->keysToCatch:Lcom/badlogic/gdx/utils/IntSet;

    .line 134
    iput-boolean v1, p0, Lcom/badlogic/gdx/backends/android/AndroidInput;->compassAvailable:Z

    .line 135
    iput-boolean v1, p0, Lcom/badlogic/gdx/backends/android/AndroidInput;->rotationVectorAvailable:Z

    .line 137
    new-array v2, v0, [F

    iput-object v2, p0, Lcom/badlogic/gdx/backends/android/AndroidInput;->magneticFieldValues:[F

    .line 138
    new-array v2, v0, [F

    iput-object v2, p0, Lcom/badlogic/gdx/backends/android/AndroidInput;->rotationVectorValues:[F

    const/4 v2, 0x0

    .line 139
    iput v2, p0, Lcom/badlogic/gdx/backends/android/AndroidInput;->azimuth:F

    .line 140
    iput v2, p0, Lcom/badlogic/gdx/backends/android/AndroidInput;->pitch:F

    .line 141
    iput v2, p0, Lcom/badlogic/gdx/backends/android/AndroidInput;->roll:F

    .line 142
    iput v2, p0, Lcom/badlogic/gdx/backends/android/AndroidInput;->inclination:F

    .line 143
    iput-boolean v1, p0, Lcom/badlogic/gdx/backends/android/AndroidInput;->justTouched:Z

    const-wide/16 v2, 0x0

    .line 147
    iput-wide v2, p0, Lcom/badlogic/gdx/backends/android/AndroidInput;->currentEventTimeStamp:J

    const/4 v2, 0x1

    .line 449
    iput-boolean v2, p0, Lcom/badlogic/gdx/backends/android/AndroidInput;->requestFocus:Z

    const/16 v3, 0x9

    .line 696
    new-array v3, v3, [F

    iput-object v3, p0, Lcom/badlogic/gdx/backends/android/AndroidInput;->R:[F

    .line 697
    new-array v0, v0, [F

    iput-object v0, p0, Lcom/badlogic/gdx/backends/android/AndroidInput;->orientation:[F

    .line 158
    instance-of v0, p3, Landroid/view/View;

    if-eqz v0, :cond_0

    .line 159
    check-cast p3, Landroid/view/View;

    .line 160
    invoke-virtual {p3, p0}, Landroid/view/View;->setOnKeyListener(Landroid/view/View$OnKeyListener;)V

    .line 161
    invoke-virtual {p3, p0}, Landroid/view/View;->setOnTouchListener(Landroid/view/View$OnTouchListener;)V

    .line 162
    invoke-virtual {p3, v2}, Landroid/view/View;->setFocusable(Z)V

    .line 163
    invoke-virtual {p3, v2}, Landroid/view/View;->setFocusableInTouchMode(Z)V

    .line 164
    invoke-virtual {p3}, Landroid/view/View;->requestFocus()Z

    .line 166
    :cond_0
    iput-object p4, p0, Lcom/badlogic/gdx/backends/android/AndroidInput;->config:Lcom/badlogic/gdx/backends/android/AndroidApplicationConfiguration;

    .line 167
    new-instance p3, Lcom/badlogic/gdx/backends/android/AndroidOnscreenKeyboard;

    new-instance v0, Landroid/os/Handler;

    invoke-direct {v0}, Landroid/os/Handler;-><init>()V

    invoke-direct {p3, p2, v0, p0}, Lcom/badlogic/gdx/backends/android/AndroidOnscreenKeyboard;-><init>(Landroid/content/Context;Landroid/os/Handler;Lcom/badlogic/gdx/backends/android/AndroidInput;)V

    iput-object p3, p0, Lcom/badlogic/gdx/backends/android/AndroidInput;->onscreenKeyboard:Lcom/badlogic/gdx/backends/android/AndroidOnscreenKeyboard;

    .line 169
    :goto_0
    iget-object p3, p0, Lcom/badlogic/gdx/backends/android/AndroidInput;->realId:[I

    array-length v0, p3

    if-ge v1, v0, :cond_1

    const/4 v0, -0x1

    .line 170
    aput v0, p3, v1

    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 171
    :cond_1
    new-instance p3, Landroid/os/Handler;

    invoke-direct {p3}, Landroid/os/Handler;-><init>()V

    iput-object p3, p0, Lcom/badlogic/gdx/backends/android/AndroidInput;->handle:Landroid/os/Handler;

    .line 172
    iput-object p1, p0, Lcom/badlogic/gdx/backends/android/AndroidInput;->app:Lcom/badlogic/gdx/Application;

    .line 173
    iput-object p2, p0, Lcom/badlogic/gdx/backends/android/AndroidInput;->context:Landroid/content/Context;

    .line 174
    iget p1, p4, Lcom/badlogic/gdx/backends/android/AndroidApplicationConfiguration;->touchSleepTime:I

    iput p1, p0, Lcom/badlogic/gdx/backends/android/AndroidInput;->sleepTime:I

    .line 175
    new-instance p1, Lcom/badlogic/gdx/backends/android/AndroidMultiTouchHandler;

    invoke-direct {p1}, Lcom/badlogic/gdx/backends/android/AndroidMultiTouchHandler;-><init>()V

    iput-object p1, p0, Lcom/badlogic/gdx/backends/android/AndroidInput;->touchHandler:Lcom/badlogic/gdx/backends/android/AndroidTouchHandler;

    .line 176
    iget-object p1, p0, Lcom/badlogic/gdx/backends/android/AndroidInput;->touchHandler:Lcom/badlogic/gdx/backends/android/AndroidTouchHandler;

    invoke-interface {p1, p2}, Lcom/badlogic/gdx/backends/android/AndroidTouchHandler;->supportsMultitouch(Landroid/content/Context;)Z

    move-result p1

    iput-boolean p1, p0, Lcom/badlogic/gdx/backends/android/AndroidInput;->hasMultitouch:Z

    const-string p1, "vibrator"

    .line 178
    invoke-virtual {p2, p1}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Landroid/os/Vibrator;

    iput-object p1, p0, Lcom/badlogic/gdx/backends/android/AndroidInput;->vibrator:Landroid/os/Vibrator;

    .line 180
    invoke-virtual {p0}, Lcom/badlogic/gdx/backends/android/AndroidInput;->getRotation()I

    move-result p1

    .line 181
    iget-object p2, p0, Lcom/badlogic/gdx/backends/android/AndroidInput;->app:Lcom/badlogic/gdx/Application;

    invoke-interface {p2}, Lcom/badlogic/gdx/Application;->getGraphics()Lcom/badlogic/gdx/Graphics;

    move-result-object p2

    invoke-interface {p2}, Lcom/badlogic/gdx/Graphics;->getDisplayMode()Lcom/badlogic/gdx/Graphics$DisplayMode;

    move-result-object p2

    if-eqz p1, :cond_2

    const/16 p3, 0xb4

    if-ne p1, p3, :cond_3

    .line 182
    :cond_2
    iget p3, p2, Lcom/badlogic/gdx/Graphics$DisplayMode;->width:I

    iget p4, p2, Lcom/badlogic/gdx/Graphics$DisplayMode;->height:I

    if-ge p3, p4, :cond_6

    :cond_3
    const/16 p3, 0x5a

    if-eq p1, p3, :cond_4

    const/16 p3, 0x10e

    if-ne p1, p3, :cond_5

    :cond_4
    iget p1, p2, Lcom/badlogic/gdx/Graphics$DisplayMode;->width:I

    iget p2, p2, Lcom/badlogic/gdx/Graphics$DisplayMode;->height:I

    if-gt p1, p2, :cond_5

    goto :goto_1

    .line 186
    :cond_5
    sget-object p1, Lcom/badlogic/gdx/Input$Orientation;->Portrait:Lcom/badlogic/gdx/Input$Orientation;

    iput-object p1, p0, Lcom/badlogic/gdx/backends/android/AndroidInput;->nativeOrientation:Lcom/badlogic/gdx/Input$Orientation;

    goto :goto_2

    .line 184
    :cond_6
    :goto_1
    sget-object p1, Lcom/badlogic/gdx/Input$Orientation;->Landscape:Lcom/badlogic/gdx/Input$Orientation;

    iput-object p1, p0, Lcom/badlogic/gdx/backends/android/AndroidInput;->nativeOrientation:Lcom/badlogic/gdx/Input$Orientation;

    .line 191
    :goto_2
    iget-object p1, p0, Lcom/badlogic/gdx/backends/android/AndroidInput;->keysToCatch:Lcom/badlogic/gdx/utils/IntSet;

    const/16 p2, 0xff

    invoke-virtual {p1, p2}, Lcom/badlogic/gdx/utils/IntSet;->add(I)Z

    return-void
.end method

.method private resize([I)[I
    .locals 3

    .line 876
    array-length v0, p1

    add-int/lit8 v0, v0, 0x2

    new-array v0, v0, [I

    .line 877
    array-length v1, p1

    const/4 v2, 0x0

    invoke-static {p1, v2, v0, v2, v1}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    return-object v0
.end method

.method private resize([Z)[Z
    .locals 3

    .line 882
    array-length v0, p1

    add-int/lit8 v0, v0, 0x2

    new-array v0, v0, [Z

    .line 883
    array-length v1, p1

    const/4 v2, 0x0

    invoke-static {p1, v2, v0, v2, v1}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    return-object v0
.end method

.method private updateOrientation()V
    .locals 4

    .line 700
    iget-boolean v0, p0, Lcom/badlogic/gdx/backends/android/AndroidInput;->rotationVectorAvailable:Z

    if-eqz v0, :cond_0

    .line 701
    iget-object v0, p0, Lcom/badlogic/gdx/backends/android/AndroidInput;->R:[F

    iget-object v1, p0, Lcom/badlogic/gdx/backends/android/AndroidInput;->rotationVectorValues:[F

    invoke-static {v0, v1}, Landroid/hardware/SensorManager;->getRotationMatrixFromVector([F[F)V

    goto :goto_0

    .line 702
    :cond_0
    iget-object v0, p0, Lcom/badlogic/gdx/backends/android/AndroidInput;->R:[F

    const/4 v1, 0x0

    iget-object v2, p0, Lcom/badlogic/gdx/backends/android/AndroidInput;->accelerometerValues:[F

    iget-object v3, p0, Lcom/badlogic/gdx/backends/android/AndroidInput;->magneticFieldValues:[F

    invoke-static {v0, v1, v2, v3}, Landroid/hardware/SensorManager;->getRotationMatrix([F[F[F[F)Z

    move-result v0

    if-nez v0, :cond_1

    return-void

    .line 705
    :cond_1
    :goto_0
    iget-object v0, p0, Lcom/badlogic/gdx/backends/android/AndroidInput;->R:[F

    iget-object v1, p0, Lcom/badlogic/gdx/backends/android/AndroidInput;->orientation:[F

    invoke-static {v0, v1}, Landroid/hardware/SensorManager;->getOrientation([F[F)[F

    .line 706
    iget-object v0, p0, Lcom/badlogic/gdx/backends/android/AndroidInput;->orientation:[F

    const/4 v1, 0x0

    aget v0, v0, v1

    float-to-double v0, v0

    invoke-static {v0, v1}, Ljava/lang/Math;->toDegrees(D)D

    move-result-wide v0

    double-to-float v0, v0

    iput v0, p0, Lcom/badlogic/gdx/backends/android/AndroidInput;->azimuth:F

    .line 707
    iget-object v0, p0, Lcom/badlogic/gdx/backends/android/AndroidInput;->orientation:[F

    const/4 v1, 0x1

    aget v0, v0, v1

    float-to-double v0, v0

    invoke-static {v0, v1}, Ljava/lang/Math;->toDegrees(D)D

    move-result-wide v0

    double-to-float v0, v0

    iput v0, p0, Lcom/badlogic/gdx/backends/android/AndroidInput;->pitch:F

    .line 708
    iget-object v0, p0, Lcom/badlogic/gdx/backends/android/AndroidInput;->orientation:[F

    const/4 v1, 0x2

    aget v0, v0, v1

    float-to-double v0, v0

    invoke-static {v0, v1}, Ljava/lang/Math;->toDegrees(D)D

    move-result-wide v0

    double-to-float v0, v0

    iput v0, p0, Lcom/badlogic/gdx/backends/android/AndroidInput;->roll:F

    return-void
.end method


# virtual methods
.method public addKeyListener(Landroid/view/View$OnKeyListener;)V
    .locals 1

    .line 969
    iget-object v0, p0, Lcom/badlogic/gdx/backends/android/AndroidInput;->keyListeners:Ljava/util/ArrayList;

    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    return-void
.end method

.method public cancelVibrate()V
    .locals 1

    .line 668
    iget-object v0, p0, Lcom/badlogic/gdx/backends/android/AndroidInput;->vibrator:Landroid/os/Vibrator;

    invoke-virtual {v0}, Landroid/os/Vibrator;->cancel()V

    return-void
.end method

.method public getAccelerometerX()F
    .locals 2

    .line 196
    iget-object v0, p0, Lcom/badlogic/gdx/backends/android/AndroidInput;->accelerometerValues:[F

    const/4 v1, 0x0

    aget v0, v0, v1

    return v0
.end method

.method public getAccelerometerY()F
    .locals 2

    .line 201
    iget-object v0, p0, Lcom/badlogic/gdx/backends/android/AndroidInput;->accelerometerValues:[F

    const/4 v1, 0x1

    aget v0, v0, v1

    return v0
.end method

.method public getAccelerometerZ()F
    .locals 2

    .line 206
    iget-object v0, p0, Lcom/badlogic/gdx/backends/android/AndroidInput;->accelerometerValues:[F

    const/4 v1, 0x2

    aget v0, v0, v1

    return v0
.end method

.method public getAzimuth()F
    .locals 1

    .line 725
    iget-boolean v0, p0, Lcom/badlogic/gdx/backends/android/AndroidInput;->compassAvailable:Z

    if-nez v0, :cond_0

    iget-boolean v0, p0, Lcom/badlogic/gdx/backends/android/AndroidInput;->rotationVectorAvailable:Z

    if-nez v0, :cond_0

    const/4 v0, 0x0

    return v0

    .line 727
    :cond_0
    invoke-direct {p0}, Lcom/badlogic/gdx/backends/android/AndroidInput;->updateOrientation()V

    .line 728
    iget v0, p0, Lcom/badlogic/gdx/backends/android/AndroidInput;->azimuth:F

    return v0
.end method

.method public getCurrentEventTime()J
    .locals 2

    .line 965
    iget-wide v0, p0, Lcom/badlogic/gdx/backends/android/AndroidInput;->currentEventTimeStamp:J

    return-wide v0
.end method

.method public getDeltaX()I
    .locals 2

    .line 941
    iget-object v0, p0, Lcom/badlogic/gdx/backends/android/AndroidInput;->deltaX:[I

    const/4 v1, 0x0

    aget v0, v0, v1

    return v0
.end method

.method public getDeltaX(I)I
    .locals 1

    .line 946
    iget-object v0, p0, Lcom/badlogic/gdx/backends/android/AndroidInput;->deltaX:[I

    aget p1, v0, p1

    return p1
.end method

.method public getDeltaY()I
    .locals 2

    .line 951
    iget-object v0, p0, Lcom/badlogic/gdx/backends/android/AndroidInput;->deltaY:[I

    const/4 v1, 0x0

    aget v0, v0, v1

    return v0
.end method

.method public getDeltaY(I)I
    .locals 1

    .line 956
    iget-object v0, p0, Lcom/badlogic/gdx/backends/android/AndroidInput;->deltaY:[I

    aget p1, v0, p1

    return p1
.end method

.method public getFreePointerIndex()I
    .locals 4

    .line 859
    iget-object v0, p0, Lcom/badlogic/gdx/backends/android/AndroidInput;->realId:[I

    array-length v0, v0

    const/4 v1, 0x0

    :goto_0
    if-ge v1, v0, :cond_1

    .line 861
    iget-object v2, p0, Lcom/badlogic/gdx/backends/android/AndroidInput;->realId:[I

    aget v2, v2, v1

    const/4 v3, -0x1

    if-ne v2, v3, :cond_0

    return v1

    :cond_0
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 864
    :cond_1
    iget-object v1, p0, Lcom/badlogic/gdx/backends/android/AndroidInput;->realId:[I

    invoke-direct {p0, v1}, Lcom/badlogic/gdx/backends/android/AndroidInput;->resize([I)[I

    move-result-object v1

    iput-object v1, p0, Lcom/badlogic/gdx/backends/android/AndroidInput;->realId:[I

    .line 865
    iget-object v1, p0, Lcom/badlogic/gdx/backends/android/AndroidInput;->touchX:[I

    invoke-direct {p0, v1}, Lcom/badlogic/gdx/backends/android/AndroidInput;->resize([I)[I

    move-result-object v1

    iput-object v1, p0, Lcom/badlogic/gdx/backends/android/AndroidInput;->touchX:[I

    .line 866
    iget-object v1, p0, Lcom/badlogic/gdx/backends/android/AndroidInput;->touchY:[I

    invoke-direct {p0, v1}, Lcom/badlogic/gdx/backends/android/AndroidInput;->resize([I)[I

    move-result-object v1

    iput-object v1, p0, Lcom/badlogic/gdx/backends/android/AndroidInput;->touchY:[I

    .line 867
    iget-object v1, p0, Lcom/badlogic/gdx/backends/android/AndroidInput;->deltaX:[I

    invoke-direct {p0, v1}, Lcom/badlogic/gdx/backends/android/AndroidInput;->resize([I)[I

    move-result-object v1

    iput-object v1, p0, Lcom/badlogic/gdx/backends/android/AndroidInput;->deltaX:[I

    .line 868
    iget-object v1, p0, Lcom/badlogic/gdx/backends/android/AndroidInput;->deltaY:[I

    invoke-direct {p0, v1}, Lcom/badlogic/gdx/backends/android/AndroidInput;->resize([I)[I

    move-result-object v1

    iput-object v1, p0, Lcom/badlogic/gdx/backends/android/AndroidInput;->deltaY:[I

    .line 869
    iget-object v1, p0, Lcom/badlogic/gdx/backends/android/AndroidInput;->touched:[Z

    invoke-direct {p0, v1}, Lcom/badlogic/gdx/backends/android/AndroidInput;->resize([Z)[Z

    move-result-object v1

    iput-object v1, p0, Lcom/badlogic/gdx/backends/android/AndroidInput;->touched:[Z

    .line 870
    iget-object v1, p0, Lcom/badlogic/gdx/backends/android/AndroidInput;->button:[I

    invoke-direct {p0, v1}, Lcom/badlogic/gdx/backends/android/AndroidInput;->resize([I)[I

    move-result-object v1

    iput-object v1, p0, Lcom/badlogic/gdx/backends/android/AndroidInput;->button:[I

    return v0
.end method

.method public getGyroscopeX()F
    .locals 2

    .line 211
    iget-object v0, p0, Lcom/badlogic/gdx/backends/android/AndroidInput;->gyroscopeValues:[F

    const/4 v1, 0x0

    aget v0, v0, v1

    return v0
.end method

.method public getGyroscopeY()F
    .locals 2

    .line 216
    iget-object v0, p0, Lcom/badlogic/gdx/backends/android/AndroidInput;->gyroscopeValues:[F

    const/4 v1, 0x1

    aget v0, v0, v1

    return v0
.end method

.method public getGyroscopeZ()F
    .locals 2

    .line 221
    iget-object v0, p0, Lcom/badlogic/gdx/backends/android/AndroidInput;->gyroscopeValues:[F

    const/4 v1, 0x2

    aget v0, v0, v1

    return v0
.end method

.method public getInputProcessor()Lcom/badlogic/gdx/InputProcessor;
    .locals 1

    .line 835
    iget-object v0, p0, Lcom/badlogic/gdx/backends/android/AndroidInput;->processor:Lcom/badlogic/gdx/InputProcessor;

    return-object v0
.end method

.method public getMaxPointers()I
    .locals 1

    const/16 v0, 0x14

    return v0
.end method

.method public getNativeOrientation()Lcom/badlogic/gdx/Input$Orientation;
    .locals 1

    .line 927
    iget-object v0, p0, Lcom/badlogic/gdx/backends/android/AndroidInput;->nativeOrientation:Lcom/badlogic/gdx/Input$Orientation;

    return-object v0
.end method

.method public getPitch()F
    .locals 1

    .line 733
    iget-boolean v0, p0, Lcom/badlogic/gdx/backends/android/AndroidInput;->compassAvailable:Z

    if-nez v0, :cond_0

    iget-boolean v0, p0, Lcom/badlogic/gdx/backends/android/AndroidInput;->rotationVectorAvailable:Z

    if-nez v0, :cond_0

    const/4 v0, 0x0

    return v0

    .line 735
    :cond_0
    invoke-direct {p0}, Lcom/badlogic/gdx/backends/android/AndroidInput;->updateOrientation()V

    .line 736
    iget v0, p0, Lcom/badlogic/gdx/backends/android/AndroidInput;->pitch:F

    return v0
.end method

.method public getPressure()F
    .locals 1

    const/4 v0, 0x0

    .line 312
    invoke-virtual {p0, v0}, Lcom/badlogic/gdx/backends/android/AndroidInput;->getPressure(I)F

    move-result v0

    return v0
.end method

.method public getPressure(I)F
    .locals 1

    .line 317
    iget-object v0, p0, Lcom/badlogic/gdx/backends/android/AndroidInput;->pressure:[F

    aget p1, v0, p1

    return p1
.end method

.method public getRoll()F
    .locals 1

    .line 741
    iget-boolean v0, p0, Lcom/badlogic/gdx/backends/android/AndroidInput;->compassAvailable:Z

    if-nez v0, :cond_0

    iget-boolean v0, p0, Lcom/badlogic/gdx/backends/android/AndroidInput;->rotationVectorAvailable:Z

    if-nez v0, :cond_0

    const/4 v0, 0x0

    return v0

    .line 743
    :cond_0
    invoke-direct {p0}, Lcom/badlogic/gdx/backends/android/AndroidInput;->updateOrientation()V

    .line 744
    iget v0, p0, Lcom/badlogic/gdx/backends/android/AndroidInput;->roll:F

    return v0
.end method

.method public getRotation()I
    .locals 3

    .line 905
    iget-object v0, p0, Lcom/badlogic/gdx/backends/android/AndroidInput;->context:Landroid/content/Context;

    instance-of v1, v0, Landroid/app/Activity;

    if-eqz v1, :cond_0

    .line 906
    check-cast v0, Landroid/app/Activity;

    invoke-virtual {v0}, Landroid/app/Activity;->getWindowManager()Landroid/view/WindowManager;

    move-result-object v0

    invoke-interface {v0}, Landroid/view/WindowManager;->getDefaultDisplay()Landroid/view/Display;

    move-result-object v0

    invoke-virtual {v0}, Landroid/view/Display;->getRotation()I

    move-result v0

    goto :goto_0

    :cond_0
    const-string v1, "window"

    .line 908
    invoke-virtual {v0, v1}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/view/WindowManager;

    invoke-interface {v0}, Landroid/view/WindowManager;->getDefaultDisplay()Landroid/view/Display;

    move-result-object v0

    invoke-virtual {v0}, Landroid/view/Display;->getRotation()I

    move-result v0

    :goto_0
    const/4 v1, 0x0

    if-eqz v0, :cond_4

    const/4 v2, 0x1

    if-eq v0, v2, :cond_3

    const/4 v2, 0x2

    if-eq v0, v2, :cond_2

    const/4 v2, 0x3

    if-eq v0, v2, :cond_1

    return v1

    :cond_1
    const/16 v0, 0x10e

    return v0

    :cond_2
    const/16 v0, 0xb4

    return v0

    :cond_3
    const/16 v0, 0x5a

    return v0

    :cond_4
    return v1
.end method

.method public getRotationMatrix([F)V
    .locals 3

    .line 717
    iget-boolean v0, p0, Lcom/badlogic/gdx/backends/android/AndroidInput;->rotationVectorAvailable:Z

    if-eqz v0, :cond_0

    .line 718
    iget-object v0, p0, Lcom/badlogic/gdx/backends/android/AndroidInput;->rotationVectorValues:[F

    invoke-static {p1, v0}, Landroid/hardware/SensorManager;->getRotationMatrixFromVector([F[F)V

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    .line 720
    iget-object v1, p0, Lcom/badlogic/gdx/backends/android/AndroidInput;->accelerometerValues:[F

    iget-object v2, p0, Lcom/badlogic/gdx/backends/android/AndroidInput;->magneticFieldValues:[F

    invoke-static {p1, v0, v1, v2}, Landroid/hardware/SensorManager;->getRotationMatrix([F[F[F[F)Z

    :goto_0
    return-void
.end method

.method public getTextInput(Lcom/badlogic/gdx/Input$TextInputListener;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .locals 8

    .line 226
    iget-object v0, p0, Lcom/badlogic/gdx/backends/android/AndroidInput;->handle:Landroid/os/Handler;

    new-instance v7, Lcom/badlogic/gdx/backends/android/AndroidInput$3;

    move-object v1, v7

    move-object v2, p0

    move-object v3, p2

    move-object v4, p4

    move-object v5, p3

    move-object v6, p1

    invoke-direct/range {v1 .. v6}, Lcom/badlogic/gdx/backends/android/AndroidInput$3;-><init>(Lcom/badlogic/gdx/backends/android/AndroidInput;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lcom/badlogic/gdx/Input$TextInputListener;)V

    invoke-virtual {v0, v7}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    return-void
.end method

.method public getX()I
    .locals 2

    .line 278
    monitor-enter p0

    .line 279
    :try_start_0
    iget-object v0, p0, Lcom/badlogic/gdx/backends/android/AndroidInput;->touchX:[I

    const/4 v1, 0x0

    aget v0, v0, v1

    monitor-exit p0

    return v0

    :catchall_0
    move-exception v0

    .line 280
    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v0
.end method

.method public getX(I)I
    .locals 1

    .line 292
    monitor-enter p0

    .line 293
    :try_start_0
    iget-object v0, p0, Lcom/badlogic/gdx/backends/android/AndroidInput;->touchX:[I

    aget p1, v0, p1

    monitor-exit p0

    return p1

    :catchall_0
    move-exception p1

    .line 294
    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw p1
.end method

.method public getY()I
    .locals 2

    .line 285
    monitor-enter p0

    .line 286
    :try_start_0
    iget-object v0, p0, Lcom/badlogic/gdx/backends/android/AndroidInput;->touchY:[I

    const/4 v1, 0x0

    aget v0, v0, v1

    monitor-exit p0

    return v0

    :catchall_0
    move-exception v0

    .line 287
    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v0
.end method

.method public getY(I)I
    .locals 1

    .line 299
    monitor-enter p0

    .line 300
    :try_start_0
    iget-object v0, p0, Lcom/badlogic/gdx/backends/android/AndroidInput;->touchY:[I

    aget p1, v0, p1

    monitor-exit p0

    return p1

    :catchall_0
    move-exception p1

    .line 301
    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw p1
.end method

.method public isButtonJustPressed(I)Z
    .locals 1

    if-ltz p1, :cond_1

    const/16 v0, 0x14

    if-le p1, v0, :cond_0

    goto :goto_0

    .line 693
    :cond_0
    iget-object v0, p0, Lcom/badlogic/gdx/backends/android/AndroidInput;->justPressedButtons:[Z

    aget-boolean p1, v0, p1

    return p1

    :cond_1
    :goto_0
    const/4 p1, 0x0

    return p1
.end method

.method public isButtonPressed(I)Z
    .locals 4

    .line 678
    monitor-enter p0

    .line 679
    :try_start_0
    iget-boolean v0, p0, Lcom/badlogic/gdx/backends/android/AndroidInput;->hasMultitouch:Z

    const/4 v1, 0x1

    const/4 v2, 0x0

    if-eqz v0, :cond_1

    const/4 v0, 0x0

    :goto_0
    const/16 v3, 0x14

    if-ge v0, v3, :cond_1

    .line 681
    iget-object v3, p0, Lcom/badlogic/gdx/backends/android/AndroidInput;->touched:[Z

    aget-boolean v3, v3, v0

    if-eqz v3, :cond_0

    iget-object v3, p0, Lcom/badlogic/gdx/backends/android/AndroidInput;->button:[I

    aget v3, v3, v0

    if-ne v3, p1, :cond_0

    .line 682
    monitor-exit p0

    return v1

    :cond_0
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 686
    :cond_1
    iget-object v0, p0, Lcom/badlogic/gdx/backends/android/AndroidInput;->touched:[Z

    aget-boolean v0, v0, v2

    if-eqz v0, :cond_2

    iget-object v0, p0, Lcom/badlogic/gdx/backends/android/AndroidInput;->button:[I

    aget v0, v0, v2

    if-ne v0, p1, :cond_2

    goto :goto_1

    :cond_2
    const/4 v1, 0x0

    :goto_1
    monitor-exit p0

    return v1

    :catchall_0
    move-exception p1

    .line 687
    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    goto :goto_3

    :goto_2
    throw p1

    :goto_3
    goto :goto_2
.end method

.method public isCatchBackKey()Z
    .locals 2

    .line 623
    iget-object v0, p0, Lcom/badlogic/gdx/backends/android/AndroidInput;->keysToCatch:Lcom/badlogic/gdx/utils/IntSet;

    const/4 v1, 0x4

    invoke-virtual {v0, v1}, Lcom/badlogic/gdx/utils/IntSet;->contains(I)Z

    move-result v0

    return v0
.end method

.method public isCatchKey(I)Z
    .locals 1

    .line 647
    iget-object p1, p0, Lcom/badlogic/gdx/backends/android/AndroidInput;->keysToCatch:Lcom/badlogic/gdx/utils/IntSet;

    iget v0, p0, Lcom/badlogic/gdx/backends/android/AndroidInput;->keyCount:I

    invoke-virtual {p1, v0}, Lcom/badlogic/gdx/utils/IntSet;->contains(I)Z

    move-result p1

    return p1
.end method

.method public isCatchMenuKey()Z
    .locals 2

    .line 633
    iget-object v0, p0, Lcom/badlogic/gdx/backends/android/AndroidInput;->keysToCatch:Lcom/badlogic/gdx/utils/IntSet;

    const/16 v1, 0x52

    invoke-virtual {v0, v1}, Lcom/badlogic/gdx/utils/IntSet;->contains(I)Z

    move-result v0

    return v0
.end method

.method public isCursorCatched()Z
    .locals 1

    const/4 v0, 0x0

    return v0
.end method

.method public declared-synchronized isKeyJustPressed(I)Z
    .locals 1

    monitor-enter p0

    const/4 v0, -0x1

    if-ne p1, v0, :cond_0

    .line 334
    :try_start_0
    iget-boolean p1, p0, Lcom/badlogic/gdx/backends/android/AndroidInput;->keyJustPressed:Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit p0

    return p1

    :catchall_0
    move-exception p1

    goto :goto_0

    :cond_0
    if-ltz p1, :cond_2

    const/16 v0, 0x104

    if-lt p1, v0, :cond_1

    goto :goto_1

    .line 339
    :cond_1
    :try_start_1
    iget-object v0, p0, Lcom/badlogic/gdx/backends/android/AndroidInput;->justPressedKeys:[Z

    aget-boolean p1, v0, p1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    monitor-exit p0

    return p1

    :goto_0
    monitor-exit p0

    throw p1

    :cond_2
    :goto_1
    const/4 p1, 0x0

    .line 337
    monitor-exit p0

    return p1
.end method

.method public declared-synchronized isKeyPressed(I)Z
    .locals 2

    monitor-enter p0

    const/4 v0, -0x1

    const/4 v1, 0x0

    if-ne p1, v0, :cond_1

    .line 323
    :try_start_0
    iget p1, p0, Lcom/badlogic/gdx/backends/android/AndroidInput;->keyCount:I
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    if-lez p1, :cond_0

    const/4 v1, 0x1

    :cond_0
    monitor-exit p0

    return v1

    :catchall_0
    move-exception p1

    goto :goto_0

    :cond_1
    if-ltz p1, :cond_3

    const/16 v0, 0x104

    if-lt p1, v0, :cond_2

    goto :goto_1

    .line 328
    :cond_2
    :try_start_1
    iget-object v0, p0, Lcom/badlogic/gdx/backends/android/AndroidInput;->keys:[Z

    aget-boolean p1, v0, p1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    monitor-exit p0

    return p1

    :goto_0
    monitor-exit p0

    throw p1

    .line 326
    :cond_3
    :goto_1
    monitor-exit p0

    return v1
.end method

.method public isPeripheralAvailable(Lcom/badlogic/gdx/Input$Peripheral;)Z
    .locals 3

    .line 840
    sget-object v0, Lcom/badlogic/gdx/Input$Peripheral;->Accelerometer:Lcom/badlogic/gdx/Input$Peripheral;

    if-ne p1, v0, :cond_0

    iget-boolean p1, p0, Lcom/badlogic/gdx/backends/android/AndroidInput;->accelerometerAvailable:Z

    return p1

    .line 841
    :cond_0
    sget-object v0, Lcom/badlogic/gdx/Input$Peripheral;->Gyroscope:Lcom/badlogic/gdx/Input$Peripheral;

    if-ne p1, v0, :cond_1

    iget-boolean p1, p0, Lcom/badlogic/gdx/backends/android/AndroidInput;->gyroscopeAvailable:Z

    return p1

    .line 842
    :cond_1
    sget-object v0, Lcom/badlogic/gdx/Input$Peripheral;->Compass:Lcom/badlogic/gdx/Input$Peripheral;

    if-ne p1, v0, :cond_2

    iget-boolean p1, p0, Lcom/badlogic/gdx/backends/android/AndroidInput;->compassAvailable:Z

    return p1

    .line 843
    :cond_2
    sget-object v0, Lcom/badlogic/gdx/Input$Peripheral;->HardwareKeyboard:Lcom/badlogic/gdx/Input$Peripheral;

    if-ne p1, v0, :cond_3

    iget-boolean p1, p0, Lcom/badlogic/gdx/backends/android/AndroidInput;->keyboardAvailable:Z

    return p1

    .line 844
    :cond_3
    sget-object v0, Lcom/badlogic/gdx/Input$Peripheral;->OnscreenKeyboard:Lcom/badlogic/gdx/Input$Peripheral;

    const/4 v1, 0x1

    if-ne p1, v0, :cond_4

    return v1

    .line 845
    :cond_4
    sget-object v0, Lcom/badlogic/gdx/Input$Peripheral;->Vibrator:Lcom/badlogic/gdx/Input$Peripheral;

    const/4 v2, 0x0

    if-ne p1, v0, :cond_8

    .line 846
    sget p1, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v0, 0xb

    if-lt p1, v0, :cond_6

    .line 847
    iget-object p1, p0, Lcom/badlogic/gdx/backends/android/AndroidInput;->vibrator:Landroid/os/Vibrator;

    if-eqz p1, :cond_5

    invoke-virtual {p1}, Landroid/os/Vibrator;->hasVibrator()Z

    move-result p1

    if-eqz p1, :cond_5

    goto :goto_0

    :cond_5
    const/4 v1, 0x0

    :goto_0
    return v1

    .line 849
    :cond_6
    iget-object p1, p0, Lcom/badlogic/gdx/backends/android/AndroidInput;->vibrator:Landroid/os/Vibrator;

    if-eqz p1, :cond_7

    goto :goto_1

    :cond_7
    const/4 v1, 0x0

    :goto_1
    return v1

    .line 852
    :cond_8
    sget-object v0, Lcom/badlogic/gdx/Input$Peripheral;->MultitouchScreen:Lcom/badlogic/gdx/Input$Peripheral;

    if-ne p1, v0, :cond_9

    iget-boolean p1, p0, Lcom/badlogic/gdx/backends/android/AndroidInput;->hasMultitouch:Z

    return p1

    .line 853
    :cond_9
    sget-object v0, Lcom/badlogic/gdx/Input$Peripheral;->RotationVector:Lcom/badlogic/gdx/Input$Peripheral;

    if-ne p1, v0, :cond_a

    iget-boolean p1, p0, Lcom/badlogic/gdx/backends/android/AndroidInput;->rotationVectorAvailable:Z

    return p1

    .line 854
    :cond_a
    sget-object v0, Lcom/badlogic/gdx/Input$Peripheral;->Pressure:Lcom/badlogic/gdx/Input$Peripheral;

    if-ne p1, v0, :cond_b

    return v1

    :cond_b
    return v2
.end method

.method public isTouched()Z
    .locals 3

    .line 344
    monitor-enter p0

    .line 345
    :try_start_0
    iget-boolean v0, p0, Lcom/badlogic/gdx/backends/android/AndroidInput;->hasMultitouch:Z

    const/4 v1, 0x0

    if-eqz v0, :cond_1

    const/4 v0, 0x0

    :goto_0
    const/16 v2, 0x14

    if-ge v0, v2, :cond_1

    .line 347
    iget-object v2, p0, Lcom/badlogic/gdx/backends/android/AndroidInput;->touched:[Z

    aget-boolean v2, v2, v0

    if-eqz v2, :cond_0

    .line 348
    monitor-exit p0

    const/4 v0, 0x1

    return v0

    :cond_0
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 352
    :cond_1
    iget-object v0, p0, Lcom/badlogic/gdx/backends/android/AndroidInput;->touched:[Z

    aget-boolean v0, v0, v1

    monitor-exit p0

    return v0

    :catchall_0
    move-exception v0

    .line 353
    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    goto :goto_2

    :goto_1
    throw v0

    :goto_2
    goto :goto_1
.end method

.method public isTouched(I)Z
    .locals 1

    .line 305
    monitor-enter p0

    .line 306
    :try_start_0
    iget-object v0, p0, Lcom/badlogic/gdx/backends/android/AndroidInput;->touched:[Z

    aget-boolean p1, v0, p1

    monitor-exit p0

    return p1

    :catchall_0
    move-exception p1

    .line 307
    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw p1
.end method

.method public justTouched()Z
    .locals 1

    .line 673
    iget-boolean v0, p0, Lcom/badlogic/gdx/backends/android/AndroidInput;->justTouched:Z

    return v0
.end method

.method public lookUpPointerIndex(I)I
    .locals 5

    .line 888
    iget-object v0, p0, Lcom/badlogic/gdx/backends/android/AndroidInput;->realId:[I

    array-length v0, v0

    const/4 v1, 0x0

    const/4 v2, 0x0

    :goto_0
    if-ge v2, v0, :cond_1

    .line 890
    iget-object v3, p0, Lcom/badlogic/gdx/backends/android/AndroidInput;->realId:[I

    aget v3, v3, v2

    if-ne v3, p1, :cond_0

    return v2

    :cond_0
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 893
    :cond_1
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    :goto_1
    if-ge v1, v0, :cond_2

    .line 895
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v4, ":"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v4, p0, Lcom/badlogic/gdx/backends/android/AndroidInput;->realId:[I

    aget v4, v4, v1

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v4, " "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    add-int/lit8 v1, v1, 0x1

    goto :goto_1

    .line 897
    :cond_2
    sget-object v0, Lcom/badlogic/gdx/Gdx;->app:Lcom/badlogic/gdx/Application;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Pointer ID lookup failed: "

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string p1, ", "

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    const-string v1, "AndroidInput"

    invoke-interface {v0, v1, p1}, Lcom/badlogic/gdx/Application;->log(Ljava/lang/String;Ljava/lang/String;)V

    const/4 p1, -0x1

    return p1
.end method

.method public onDrop(II)V
    .locals 0

    .line 482
    invoke-virtual {p0, p1, p2}, Lcom/badlogic/gdx/backends/android/AndroidInput;->postTap(II)V

    return-void
.end method

.method public onKey(Landroid/view/View;ILandroid/view/KeyEvent;)Z
    .locals 9

    .line 508
    iget-object v0, p0, Lcom/badlogic/gdx/backends/android/AndroidInput;->keyListeners:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    const/4 v1, 0x0

    const/4 v2, 0x0

    :goto_0
    const/4 v3, 0x1

    if-ge v2, v0, :cond_1

    .line 509
    iget-object v4, p0, Lcom/badlogic/gdx/backends/android/AndroidInput;->keyListeners:Ljava/util/ArrayList;

    invoke-virtual {v4, v2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Landroid/view/View$OnKeyListener;

    invoke-interface {v4, p1, p2, p3}, Landroid/view/View$OnKeyListener;->onKey(Landroid/view/View;ILandroid/view/KeyEvent;)Z

    move-result v4

    if-eqz v4, :cond_0

    return v3

    :cond_0
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 514
    :cond_1
    invoke-virtual {p3}, Landroid/view/KeyEvent;->getAction()I

    move-result p1

    if-nez p1, :cond_2

    invoke-virtual {p3}, Landroid/view/KeyEvent;->getRepeatCount()I

    move-result p1

    if-lez p1, :cond_2

    .line 515
    iget-object p1, p0, Lcom/badlogic/gdx/backends/android/AndroidInput;->keysToCatch:Lcom/badlogic/gdx/utils/IntSet;

    invoke-virtual {p1, p2}, Lcom/badlogic/gdx/utils/IntSet;->contains(I)Z

    move-result p1

    return p1

    .line 517
    :cond_2
    monitor-enter p0

    .line 520
    :try_start_0
    invoke-virtual {p3}, Landroid/view/KeyEvent;->getKeyCode()I

    move-result p1

    const/4 v0, 0x2

    if-nez p1, :cond_4

    invoke-virtual {p3}, Landroid/view/KeyEvent;->getAction()I

    move-result p1

    if-ne p1, v0, :cond_4

    .line 521
    invoke-virtual {p3}, Landroid/view/KeyEvent;->getCharacters()Ljava/lang/String;

    move-result-object p1

    const/4 p2, 0x0

    .line 522
    :goto_1
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result p3

    if-ge p2, p3, :cond_3

    .line 523
    iget-object p3, p0, Lcom/badlogic/gdx/backends/android/AndroidInput;->usedKeyEvents:Lcom/badlogic/gdx/utils/Pool;

    invoke-virtual {p3}, Lcom/badlogic/gdx/utils/Pool;->obtain()Ljava/lang/Object;

    move-result-object p3

    check-cast p3, Lcom/badlogic/gdx/backends/android/AndroidInput$KeyEvent;

    .line 524
    invoke-static {}, Ljava/lang/System;->nanoTime()J

    move-result-wide v2

    iput-wide v2, p3, Lcom/badlogic/gdx/backends/android/AndroidInput$KeyEvent;->timeStamp:J

    .line 525
    iput v1, p3, Lcom/badlogic/gdx/backends/android/AndroidInput$KeyEvent;->keyCode:I

    .line 526
    invoke-virtual {p1, p2}, Ljava/lang/String;->charAt(I)C

    move-result v2

    iput-char v2, p3, Lcom/badlogic/gdx/backends/android/AndroidInput$KeyEvent;->keyChar:C

    .line 527
    iput v0, p3, Lcom/badlogic/gdx/backends/android/AndroidInput$KeyEvent;->type:I

    .line 528
    iget-object v2, p0, Lcom/badlogic/gdx/backends/android/AndroidInput;->keyEvents:Ljava/util/ArrayList;

    invoke-virtual {v2, p3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    add-int/lit8 p2, p2, 0x1

    goto :goto_1

    .line 530
    :cond_3
    monitor-exit p0

    return v1

    .line 533
    :cond_4
    invoke-virtual {p3}, Landroid/view/KeyEvent;->getUnicodeChar()I

    move-result p1

    int-to-char p1, p1

    const/16 v2, 0x43

    if-ne p2, v2, :cond_5

    const/16 p1, 0x8

    .line 536
    :cond_5
    invoke-virtual {p3}, Landroid/view/KeyEvent;->getKeyCode()I

    move-result v2

    if-ltz v2, :cond_d

    invoke-virtual {p3}, Landroid/view/KeyEvent;->getKeyCode()I

    move-result v2

    const/16 v4, 0x104

    if-lt v2, v4, :cond_6

    goto/16 :goto_3

    .line 540
    :cond_6
    invoke-virtual {p3}, Landroid/view/KeyEvent;->getAction()I

    move-result v2

    const/4 v4, 0x4

    const/16 v5, 0xff

    if-eqz v2, :cond_a

    if-eq v2, v3, :cond_7

    goto/16 :goto_2

    .line 561
    :cond_7
    invoke-static {}, Ljava/lang/System;->nanoTime()J

    move-result-wide v6

    .line 562
    iget-object v2, p0, Lcom/badlogic/gdx/backends/android/AndroidInput;->usedKeyEvents:Lcom/badlogic/gdx/utils/Pool;

    invoke-virtual {v2}, Lcom/badlogic/gdx/utils/Pool;->obtain()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/badlogic/gdx/backends/android/AndroidInput$KeyEvent;

    .line 563
    iput-wide v6, v2, Lcom/badlogic/gdx/backends/android/AndroidInput$KeyEvent;->timeStamp:J

    .line 564
    iput-char v1, v2, Lcom/badlogic/gdx/backends/android/AndroidInput$KeyEvent;->keyChar:C

    .line 565
    invoke-virtual {p3}, Landroid/view/KeyEvent;->getKeyCode()I

    move-result v8

    iput v8, v2, Lcom/badlogic/gdx/backends/android/AndroidInput$KeyEvent;->keyCode:I

    .line 566
    iput v3, v2, Lcom/badlogic/gdx/backends/android/AndroidInput$KeyEvent;->type:I

    if-ne p2, v4, :cond_8

    .line 568
    invoke-virtual {p3}, Landroid/view/KeyEvent;->isAltPressed()Z

    move-result v4

    if-eqz v4, :cond_8

    .line 570
    iput v5, v2, Lcom/badlogic/gdx/backends/android/AndroidInput$KeyEvent;->keyCode:I

    const/16 p2, 0xff

    .line 572
    :cond_8
    iget-object v4, p0, Lcom/badlogic/gdx/backends/android/AndroidInput;->keyEvents:Ljava/util/ArrayList;

    invoke-virtual {v4, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 574
    iget-object v2, p0, Lcom/badlogic/gdx/backends/android/AndroidInput;->usedKeyEvents:Lcom/badlogic/gdx/utils/Pool;

    invoke-virtual {v2}, Lcom/badlogic/gdx/utils/Pool;->obtain()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/badlogic/gdx/backends/android/AndroidInput$KeyEvent;

    .line 575
    iput-wide v6, v2, Lcom/badlogic/gdx/backends/android/AndroidInput$KeyEvent;->timeStamp:J

    .line 576
    iput-char p1, v2, Lcom/badlogic/gdx/backends/android/AndroidInput$KeyEvent;->keyChar:C

    .line 577
    iput v1, v2, Lcom/badlogic/gdx/backends/android/AndroidInput$KeyEvent;->keyCode:I

    .line 578
    iput v0, v2, Lcom/badlogic/gdx/backends/android/AndroidInput$KeyEvent;->type:I

    .line 579
    iget-object p1, p0, Lcom/badlogic/gdx/backends/android/AndroidInput;->keyEvents:Ljava/util/ArrayList;

    invoke-virtual {p1, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    if-ne p2, v5, :cond_9

    .line 582
    iget-object p1, p0, Lcom/badlogic/gdx/backends/android/AndroidInput;->keys:[Z

    aget-boolean p1, p1, v5

    if-eqz p1, :cond_c

    .line 583
    iget p1, p0, Lcom/badlogic/gdx/backends/android/AndroidInput;->keyCount:I

    sub-int/2addr p1, v3

    iput p1, p0, Lcom/badlogic/gdx/backends/android/AndroidInput;->keyCount:I

    .line 584
    iget-object p1, p0, Lcom/badlogic/gdx/backends/android/AndroidInput;->keys:[Z

    aput-boolean v1, p1, v5

    goto :goto_2

    .line 587
    :cond_9
    iget-object p1, p0, Lcom/badlogic/gdx/backends/android/AndroidInput;->keys:[Z

    invoke-virtual {p3}, Landroid/view/KeyEvent;->getKeyCode()I

    move-result v0

    aget-boolean p1, p1, v0

    if-eqz p1, :cond_c

    .line 588
    iget p1, p0, Lcom/badlogic/gdx/backends/android/AndroidInput;->keyCount:I

    sub-int/2addr p1, v3

    iput p1, p0, Lcom/badlogic/gdx/backends/android/AndroidInput;->keyCount:I

    .line 589
    iget-object p1, p0, Lcom/badlogic/gdx/backends/android/AndroidInput;->keys:[Z

    invoke-virtual {p3}, Landroid/view/KeyEvent;->getKeyCode()I

    move-result p3

    aput-boolean v1, p1, p3

    goto :goto_2

    .line 542
    :cond_a
    iget-object p1, p0, Lcom/badlogic/gdx/backends/android/AndroidInput;->usedKeyEvents:Lcom/badlogic/gdx/utils/Pool;

    invoke-virtual {p1}, Lcom/badlogic/gdx/utils/Pool;->obtain()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lcom/badlogic/gdx/backends/android/AndroidInput$KeyEvent;

    .line 543
    invoke-static {}, Ljava/lang/System;->nanoTime()J

    move-result-wide v6

    iput-wide v6, p1, Lcom/badlogic/gdx/backends/android/AndroidInput$KeyEvent;->timeStamp:J

    .line 544
    iput-char v1, p1, Lcom/badlogic/gdx/backends/android/AndroidInput$KeyEvent;->keyChar:C

    .line 545
    invoke-virtual {p3}, Landroid/view/KeyEvent;->getKeyCode()I

    move-result v0

    iput v0, p1, Lcom/badlogic/gdx/backends/android/AndroidInput$KeyEvent;->keyCode:I

    .line 546
    iput v1, p1, Lcom/badlogic/gdx/backends/android/AndroidInput$KeyEvent;->type:I

    if-ne p2, v4, :cond_b

    .line 549
    invoke-virtual {p3}, Landroid/view/KeyEvent;->isAltPressed()Z

    move-result p3

    if-eqz p3, :cond_b

    .line 551
    iput v5, p1, Lcom/badlogic/gdx/backends/android/AndroidInput$KeyEvent;->keyCode:I

    const/16 p2, 0xff

    .line 554
    :cond_b
    iget-object p3, p0, Lcom/badlogic/gdx/backends/android/AndroidInput;->keyEvents:Ljava/util/ArrayList;

    invoke-virtual {p3, p1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 555
    iget-object p3, p0, Lcom/badlogic/gdx/backends/android/AndroidInput;->keys:[Z

    iget v0, p1, Lcom/badlogic/gdx/backends/android/AndroidInput$KeyEvent;->keyCode:I

    aget-boolean p3, p3, v0

    if-nez p3, :cond_c

    .line 556
    iget p3, p0, Lcom/badlogic/gdx/backends/android/AndroidInput;->keyCount:I

    add-int/2addr p3, v3

    iput p3, p0, Lcom/badlogic/gdx/backends/android/AndroidInput;->keyCount:I

    .line 557
    iget-object p3, p0, Lcom/badlogic/gdx/backends/android/AndroidInput;->keys:[Z

    iget p1, p1, Lcom/badlogic/gdx/backends/android/AndroidInput$KeyEvent;->keyCode:I

    aput-boolean v3, p3, p1

    .line 593
    :cond_c
    :goto_2
    iget-object p1, p0, Lcom/badlogic/gdx/backends/android/AndroidInput;->app:Lcom/badlogic/gdx/Application;

    invoke-interface {p1}, Lcom/badlogic/gdx/Application;->getGraphics()Lcom/badlogic/gdx/Graphics;

    move-result-object p1

    invoke-interface {p1}, Lcom/badlogic/gdx/Graphics;->requestRendering()V

    .line 594
    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 596
    iget-object p1, p0, Lcom/badlogic/gdx/backends/android/AndroidInput;->keysToCatch:Lcom/badlogic/gdx/utils/IntSet;

    invoke-virtual {p1, p2}, Lcom/badlogic/gdx/utils/IntSet;->contains(I)Z

    move-result p1

    return p1

    .line 537
    :cond_d
    :goto_3
    :try_start_1
    monitor-exit p0

    return v1

    :catchall_0
    move-exception p1

    .line 594
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto :goto_5

    :goto_4
    throw p1

    :goto_5
    goto :goto_4
.end method

.method public onPause()V
    .locals 2

    .line 973
    invoke-virtual {p0}, Lcom/badlogic/gdx/backends/android/AndroidInput;->unregisterSensorListeners()V

    .line 976
    iget-object v0, p0, Lcom/badlogic/gdx/backends/android/AndroidInput;->realId:[I

    const/4 v1, -0x1

    invoke-static {v0, v1}, Ljava/util/Arrays;->fill([II)V

    .line 979
    iget-object v0, p0, Lcom/badlogic/gdx/backends/android/AndroidInput;->touched:[Z

    const/4 v1, 0x0

    invoke-static {v0, v1}, Ljava/util/Arrays;->fill([ZZ)V

    return-void
.end method

.method public onResume()V
    .locals 0

    .line 983
    invoke-virtual {p0}, Lcom/badlogic/gdx/backends/android/AndroidInput;->registerSensorListeners()V

    return-void
.end method

.method public onTap(II)V
    .locals 0

    .line 475
    invoke-virtual {p0, p1, p2}, Lcom/badlogic/gdx/backends/android/AndroidInput;->postTap(II)V

    return-void
.end method

.method public onTouch(Landroid/view/View;Landroid/view/MotionEvent;)Z
    .locals 2

    .line 453
    iget-boolean v0, p0, Lcom/badlogic/gdx/backends/android/AndroidInput;->requestFocus:Z

    const/4 v1, 0x1

    if-eqz v0, :cond_0

    if-eqz p1, :cond_0

    .line 454
    invoke-virtual {p1, v1}, Landroid/view/View;->setFocusableInTouchMode(Z)V

    .line 455
    invoke-virtual {p1}, Landroid/view/View;->requestFocus()Z

    const/4 p1, 0x0

    .line 456
    iput-boolean p1, p0, Lcom/badlogic/gdx/backends/android/AndroidInput;->requestFocus:Z

    .line 460
    :cond_0
    iget-object p1, p0, Lcom/badlogic/gdx/backends/android/AndroidInput;->touchHandler:Lcom/badlogic/gdx/backends/android/AndroidTouchHandler;

    invoke-interface {p1, p2, p0}, Lcom/badlogic/gdx/backends/android/AndroidTouchHandler;->onTouch(Landroid/view/MotionEvent;Lcom/badlogic/gdx/backends/android/AndroidInput;)V

    .line 462
    iget p1, p0, Lcom/badlogic/gdx/backends/android/AndroidInput;->sleepTime:I

    if-eqz p1, :cond_1

    int-to-long p1, p1

    .line 464
    :try_start_0
    invoke-static {p1, p2}, Ljava/lang/Thread;->sleep(J)V
    :try_end_0
    .catch Ljava/lang/InterruptedException; {:try_start_0 .. :try_end_0} :catch_0

    :catch_0
    :cond_1
    return v1
.end method

.method protected postTap(II)V
    .locals 4

    .line 486
    monitor-enter p0

    .line 487
    :try_start_0
    iget-object v0, p0, Lcom/badlogic/gdx/backends/android/AndroidInput;->usedTouchEvents:Lcom/badlogic/gdx/utils/Pool;

    invoke-virtual {v0}, Lcom/badlogic/gdx/utils/Pool;->obtain()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/badlogic/gdx/backends/android/AndroidInput$TouchEvent;

    .line 488
    invoke-static {}, Ljava/lang/System;->nanoTime()J

    move-result-wide v1

    iput-wide v1, v0, Lcom/badlogic/gdx/backends/android/AndroidInput$TouchEvent;->timeStamp:J

    const/4 v1, 0x0

    .line 489
    iput v1, v0, Lcom/badlogic/gdx/backends/android/AndroidInput$TouchEvent;->pointer:I

    .line 490
    iput p1, v0, Lcom/badlogic/gdx/backends/android/AndroidInput$TouchEvent;->x:I

    .line 491
    iput p2, v0, Lcom/badlogic/gdx/backends/android/AndroidInput$TouchEvent;->y:I

    .line 492
    iput v1, v0, Lcom/badlogic/gdx/backends/android/AndroidInput$TouchEvent;->type:I

    .line 493
    iget-object v2, p0, Lcom/badlogic/gdx/backends/android/AndroidInput;->touchEvents:Ljava/util/ArrayList;

    invoke-virtual {v2, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 495
    iget-object v0, p0, Lcom/badlogic/gdx/backends/android/AndroidInput;->usedTouchEvents:Lcom/badlogic/gdx/utils/Pool;

    invoke-virtual {v0}, Lcom/badlogic/gdx/utils/Pool;->obtain()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/badlogic/gdx/backends/android/AndroidInput$TouchEvent;

    .line 496
    invoke-static {}, Ljava/lang/System;->nanoTime()J

    move-result-wide v2

    iput-wide v2, v0, Lcom/badlogic/gdx/backends/android/AndroidInput$TouchEvent;->timeStamp:J

    .line 497
    iput v1, v0, Lcom/badlogic/gdx/backends/android/AndroidInput$TouchEvent;->pointer:I

    .line 498
    iput p1, v0, Lcom/badlogic/gdx/backends/android/AndroidInput$TouchEvent;->x:I

    .line 499
    iput p2, v0, Lcom/badlogic/gdx/backends/android/AndroidInput$TouchEvent;->y:I

    const/4 p1, 0x1

    .line 500
    iput p1, v0, Lcom/badlogic/gdx/backends/android/AndroidInput$TouchEvent;->type:I

    .line 501
    iget-object p1, p0, Lcom/badlogic/gdx/backends/android/AndroidInput;->touchEvents:Ljava/util/ArrayList;

    invoke-virtual {p1, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 502
    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 503
    sget-object p1, Lcom/badlogic/gdx/Gdx;->app:Lcom/badlogic/gdx/Application;

    invoke-interface {p1}, Lcom/badlogic/gdx/Application;->getGraphics()Lcom/badlogic/gdx/Graphics;

    move-result-object p1

    invoke-interface {p1}, Lcom/badlogic/gdx/Graphics;->requestRendering()V

    return-void

    :catchall_0
    move-exception p1

    .line 502
    :try_start_1
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw p1
.end method

.method processEvents()V
    .locals 11

    .line 363
    monitor-enter p0

    .line 364
    :try_start_0
    iget-boolean v0, p0, Lcom/badlogic/gdx/backends/android/AndroidInput;->justTouched:Z

    const/4 v1, 0x0

    if-eqz v0, :cond_0

    .line 365
    iput-boolean v1, p0, Lcom/badlogic/gdx/backends/android/AndroidInput;->justTouched:Z

    const/4 v0, 0x0

    .line 366
    :goto_0
    iget-object v2, p0, Lcom/badlogic/gdx/backends/android/AndroidInput;->justPressedButtons:[Z

    array-length v2, v2

    if-ge v0, v2, :cond_0

    .line 367
    iget-object v2, p0, Lcom/badlogic/gdx/backends/android/AndroidInput;->justPressedButtons:[Z

    aput-boolean v1, v2, v0

    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 370
    :cond_0
    iget-boolean v0, p0, Lcom/badlogic/gdx/backends/android/AndroidInput;->keyJustPressed:Z

    if-eqz v0, :cond_1

    .line 371
    iput-boolean v1, p0, Lcom/badlogic/gdx/backends/android/AndroidInput;->keyJustPressed:Z

    const/4 v0, 0x0

    .line 372
    :goto_1
    iget-object v2, p0, Lcom/badlogic/gdx/backends/android/AndroidInput;->justPressedKeys:[Z

    array-length v2, v2

    if-ge v0, v2, :cond_1

    .line 373
    iget-object v2, p0, Lcom/badlogic/gdx/backends/android/AndroidInput;->justPressedKeys:[Z

    aput-boolean v1, v2, v0

    add-int/lit8 v0, v0, 0x1

    goto :goto_1

    .line 377
    :cond_1
    iget-object v0, p0, Lcom/badlogic/gdx/backends/android/AndroidInput;->processor:Lcom/badlogic/gdx/InputProcessor;

    const/4 v2, 0x1

    if-eqz v0, :cond_b

    .line 378
    iget-object v0, p0, Lcom/badlogic/gdx/backends/android/AndroidInput;->processor:Lcom/badlogic/gdx/InputProcessor;

    .line 380
    iget-object v3, p0, Lcom/badlogic/gdx/backends/android/AndroidInput;->keyEvents:Ljava/util/ArrayList;

    invoke-virtual {v3}, Ljava/util/ArrayList;->size()I

    move-result v3

    const/4 v4, 0x0

    :goto_2
    const/4 v5, 0x2

    if-ge v4, v3, :cond_5

    .line 382
    iget-object v6, p0, Lcom/badlogic/gdx/backends/android/AndroidInput;->keyEvents:Ljava/util/ArrayList;

    invoke-virtual {v6, v4}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Lcom/badlogic/gdx/backends/android/AndroidInput$KeyEvent;

    .line 383
    iget-wide v7, v6, Lcom/badlogic/gdx/backends/android/AndroidInput$KeyEvent;->timeStamp:J

    iput-wide v7, p0, Lcom/badlogic/gdx/backends/android/AndroidInput;->currentEventTimeStamp:J

    .line 384
    iget v7, v6, Lcom/badlogic/gdx/backends/android/AndroidInput$KeyEvent;->type:I

    if-eqz v7, :cond_4

    if-eq v7, v2, :cond_3

    if-eq v7, v5, :cond_2

    goto :goto_3

    .line 394
    :cond_2
    iget-char v5, v6, Lcom/badlogic/gdx/backends/android/AndroidInput$KeyEvent;->keyChar:C

    invoke-interface {v0, v5}, Lcom/badlogic/gdx/InputProcessor;->keyTyped(C)Z

    goto :goto_3

    .line 391
    :cond_3
    iget v5, v6, Lcom/badlogic/gdx/backends/android/AndroidInput$KeyEvent;->keyCode:I

    invoke-interface {v0, v5}, Lcom/badlogic/gdx/InputProcessor;->keyUp(I)Z

    goto :goto_3

    .line 386
    :cond_4
    iget v5, v6, Lcom/badlogic/gdx/backends/android/AndroidInput$KeyEvent;->keyCode:I

    invoke-interface {v0, v5}, Lcom/badlogic/gdx/InputProcessor;->keyDown(I)Z

    .line 387
    iput-boolean v2, p0, Lcom/badlogic/gdx/backends/android/AndroidInput;->keyJustPressed:Z

    .line 388
    iget-object v5, p0, Lcom/badlogic/gdx/backends/android/AndroidInput;->justPressedKeys:[Z

    iget v7, v6, Lcom/badlogic/gdx/backends/android/AndroidInput$KeyEvent;->keyCode:I

    aput-boolean v2, v5, v7

    .line 396
    :goto_3
    iget-object v5, p0, Lcom/badlogic/gdx/backends/android/AndroidInput;->usedKeyEvents:Lcom/badlogic/gdx/utils/Pool;

    invoke-virtual {v5, v6}, Lcom/badlogic/gdx/utils/Pool;->free(Ljava/lang/Object;)V

    add-int/lit8 v4, v4, 0x1

    goto :goto_2

    .line 399
    :cond_5
    iget-object v3, p0, Lcom/badlogic/gdx/backends/android/AndroidInput;->touchEvents:Ljava/util/ArrayList;

    invoke-virtual {v3}, Ljava/util/ArrayList;->size()I

    move-result v3

    const/4 v4, 0x0

    :goto_4
    if-ge v4, v3, :cond_e

    .line 401
    iget-object v6, p0, Lcom/badlogic/gdx/backends/android/AndroidInput;->touchEvents:Ljava/util/ArrayList;

    invoke-virtual {v6, v4}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Lcom/badlogic/gdx/backends/android/AndroidInput$TouchEvent;

    .line 402
    iget-wide v7, v6, Lcom/badlogic/gdx/backends/android/AndroidInput$TouchEvent;->timeStamp:J

    iput-wide v7, p0, Lcom/badlogic/gdx/backends/android/AndroidInput;->currentEventTimeStamp:J

    .line 403
    iget v7, v6, Lcom/badlogic/gdx/backends/android/AndroidInput$TouchEvent;->type:I

    if-eqz v7, :cond_a

    if-eq v7, v2, :cond_9

    if-eq v7, v5, :cond_8

    const/4 v8, 0x3

    if-eq v7, v8, :cond_7

    const/4 v8, 0x4

    if-eq v7, v8, :cond_6

    goto :goto_5

    .line 416
    :cond_6
    iget v7, v6, Lcom/badlogic/gdx/backends/android/AndroidInput$TouchEvent;->x:I

    iget v8, v6, Lcom/badlogic/gdx/backends/android/AndroidInput$TouchEvent;->y:I

    invoke-interface {v0, v7, v8}, Lcom/badlogic/gdx/InputProcessor;->mouseMoved(II)Z

    goto :goto_5

    .line 419
    :cond_7
    iget v7, v6, Lcom/badlogic/gdx/backends/android/AndroidInput$TouchEvent;->scrollAmount:I

    invoke-interface {v0, v7}, Lcom/badlogic/gdx/InputProcessor;->scrolled(I)Z

    goto :goto_5

    .line 413
    :cond_8
    iget v7, v6, Lcom/badlogic/gdx/backends/android/AndroidInput$TouchEvent;->x:I

    iget v8, v6, Lcom/badlogic/gdx/backends/android/AndroidInput$TouchEvent;->y:I

    iget v9, v6, Lcom/badlogic/gdx/backends/android/AndroidInput$TouchEvent;->pointer:I

    invoke-interface {v0, v7, v8, v9}, Lcom/badlogic/gdx/InputProcessor;->touchDragged(III)Z

    goto :goto_5

    .line 410
    :cond_9
    iget v7, v6, Lcom/badlogic/gdx/backends/android/AndroidInput$TouchEvent;->x:I

    iget v8, v6, Lcom/badlogic/gdx/backends/android/AndroidInput$TouchEvent;->y:I

    iget v9, v6, Lcom/badlogic/gdx/backends/android/AndroidInput$TouchEvent;->pointer:I

    iget v10, v6, Lcom/badlogic/gdx/backends/android/AndroidInput$TouchEvent;->button:I

    invoke-interface {v0, v7, v8, v9, v10}, Lcom/badlogic/gdx/InputProcessor;->touchUp(IIII)Z

    goto :goto_5

    .line 405
    :cond_a
    iget v7, v6, Lcom/badlogic/gdx/backends/android/AndroidInput$TouchEvent;->x:I

    iget v8, v6, Lcom/badlogic/gdx/backends/android/AndroidInput$TouchEvent;->y:I

    iget v9, v6, Lcom/badlogic/gdx/backends/android/AndroidInput$TouchEvent;->pointer:I

    iget v10, v6, Lcom/badlogic/gdx/backends/android/AndroidInput$TouchEvent;->button:I

    invoke-interface {v0, v7, v8, v9, v10}, Lcom/badlogic/gdx/InputProcessor;->touchDown(IIII)Z

    .line 406
    iput-boolean v2, p0, Lcom/badlogic/gdx/backends/android/AndroidInput;->justTouched:Z

    .line 407
    iget-object v7, p0, Lcom/badlogic/gdx/backends/android/AndroidInput;->justPressedButtons:[Z

    iget v8, v6, Lcom/badlogic/gdx/backends/android/AndroidInput$TouchEvent;->button:I

    aput-boolean v2, v7, v8

    .line 421
    :goto_5
    iget-object v7, p0, Lcom/badlogic/gdx/backends/android/AndroidInput;->usedTouchEvents:Lcom/badlogic/gdx/utils/Pool;

    invoke-virtual {v7, v6}, Lcom/badlogic/gdx/utils/Pool;->free(Ljava/lang/Object;)V

    add-int/lit8 v4, v4, 0x1

    goto :goto_4

    .line 424
    :cond_b
    iget-object v0, p0, Lcom/badlogic/gdx/backends/android/AndroidInput;->touchEvents:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    const/4 v3, 0x0

    :goto_6
    if-ge v3, v0, :cond_d

    .line 426
    iget-object v4, p0, Lcom/badlogic/gdx/backends/android/AndroidInput;->touchEvents:Ljava/util/ArrayList;

    invoke-virtual {v4, v3}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lcom/badlogic/gdx/backends/android/AndroidInput$TouchEvent;

    .line 427
    iget v5, v4, Lcom/badlogic/gdx/backends/android/AndroidInput$TouchEvent;->type:I

    if-nez v5, :cond_c

    iput-boolean v2, p0, Lcom/badlogic/gdx/backends/android/AndroidInput;->justTouched:Z

    .line 428
    :cond_c
    iget-object v5, p0, Lcom/badlogic/gdx/backends/android/AndroidInput;->usedTouchEvents:Lcom/badlogic/gdx/utils/Pool;

    invoke-virtual {v5, v4}, Lcom/badlogic/gdx/utils/Pool;->free(Ljava/lang/Object;)V

    add-int/lit8 v3, v3, 0x1

    goto :goto_6

    .line 431
    :cond_d
    iget-object v0, p0, Lcom/badlogic/gdx/backends/android/AndroidInput;->keyEvents:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    const/4 v2, 0x0

    :goto_7
    if-ge v2, v0, :cond_e

    .line 433
    iget-object v3, p0, Lcom/badlogic/gdx/backends/android/AndroidInput;->usedKeyEvents:Lcom/badlogic/gdx/utils/Pool;

    iget-object v4, p0, Lcom/badlogic/gdx/backends/android/AndroidInput;->keyEvents:Ljava/util/ArrayList;

    invoke-virtual {v4, v2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v4

    invoke-virtual {v3, v4}, Lcom/badlogic/gdx/utils/Pool;->free(Ljava/lang/Object;)V

    add-int/lit8 v2, v2, 0x1

    goto :goto_7

    .line 437
    :cond_e
    iget-object v0, p0, Lcom/badlogic/gdx/backends/android/AndroidInput;->touchEvents:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_f

    const/4 v0, 0x0

    .line 438
    :goto_8
    iget-object v2, p0, Lcom/badlogic/gdx/backends/android/AndroidInput;->deltaX:[I

    array-length v2, v2

    if-ge v0, v2, :cond_f

    .line 439
    iget-object v2, p0, Lcom/badlogic/gdx/backends/android/AndroidInput;->deltaX:[I

    aput v1, v2, v1

    .line 440
    iget-object v2, p0, Lcom/badlogic/gdx/backends/android/AndroidInput;->deltaY:[I

    aput v1, v2, v1

    add-int/lit8 v0, v0, 0x1

    goto :goto_8

    .line 444
    :cond_f
    iget-object v0, p0, Lcom/badlogic/gdx/backends/android/AndroidInput;->keyEvents:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->clear()V

    .line 445
    iget-object v0, p0, Lcom/badlogic/gdx/backends/android/AndroidInput;->touchEvents:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->clear()V

    .line 446
    monitor-exit p0

    return-void

    :catchall_0
    move-exception v0

    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    goto :goto_a

    :goto_9
    throw v0

    :goto_a
    goto :goto_9
.end method

.method registerSensorListeners()V
    .locals 7

    .line 748
    iget-object v0, p0, Lcom/badlogic/gdx/backends/android/AndroidInput;->config:Lcom/badlogic/gdx/backends/android/AndroidApplicationConfiguration;

    iget-boolean v0, v0, Lcom/badlogic/gdx/backends/android/AndroidApplicationConfiguration;->useAccelerometer:Z

    const-string v1, "sensor"

    const/4 v2, 0x0

    if-eqz v0, :cond_1

    .line 749
    iget-object v0, p0, Lcom/badlogic/gdx/backends/android/AndroidInput;->context:Landroid/content/Context;

    invoke-virtual {v0, v1}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/hardware/SensorManager;

    iput-object v0, p0, Lcom/badlogic/gdx/backends/android/AndroidInput;->manager:Landroid/hardware/SensorManager;

    .line 750
    iget-object v0, p0, Lcom/badlogic/gdx/backends/android/AndroidInput;->manager:Landroid/hardware/SensorManager;

    const/4 v3, 0x1

    invoke-virtual {v0, v3}, Landroid/hardware/SensorManager;->getSensorList(I)Ljava/util/List;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/List;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 751
    iput-boolean v2, p0, Lcom/badlogic/gdx/backends/android/AndroidInput;->accelerometerAvailable:Z

    goto :goto_0

    .line 753
    :cond_0
    iget-object v0, p0, Lcom/badlogic/gdx/backends/android/AndroidInput;->manager:Landroid/hardware/SensorManager;

    invoke-virtual {v0, v3}, Landroid/hardware/SensorManager;->getSensorList(I)Ljava/util/List;

    move-result-object v0

    invoke-interface {v0, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/hardware/Sensor;

    .line 754
    new-instance v3, Lcom/badlogic/gdx/backends/android/AndroidInput$SensorListener;

    invoke-direct {v3, p0}, Lcom/badlogic/gdx/backends/android/AndroidInput$SensorListener;-><init>(Lcom/badlogic/gdx/backends/android/AndroidInput;)V

    iput-object v3, p0, Lcom/badlogic/gdx/backends/android/AndroidInput;->accelerometerListener:Landroid/hardware/SensorEventListener;

    .line 755
    iget-object v3, p0, Lcom/badlogic/gdx/backends/android/AndroidInput;->manager:Landroid/hardware/SensorManager;

    iget-object v4, p0, Lcom/badlogic/gdx/backends/android/AndroidInput;->accelerometerListener:Landroid/hardware/SensorEventListener;

    iget-object v5, p0, Lcom/badlogic/gdx/backends/android/AndroidInput;->config:Lcom/badlogic/gdx/backends/android/AndroidApplicationConfiguration;

    iget v5, v5, Lcom/badlogic/gdx/backends/android/AndroidApplicationConfiguration;->sensorDelay:I

    invoke-virtual {v3, v4, v0, v5}, Landroid/hardware/SensorManager;->registerListener(Landroid/hardware/SensorEventListener;Landroid/hardware/Sensor;I)Z

    move-result v0

    iput-boolean v0, p0, Lcom/badlogic/gdx/backends/android/AndroidInput;->accelerometerAvailable:Z

    goto :goto_0

    .line 759
    :cond_1
    iput-boolean v2, p0, Lcom/badlogic/gdx/backends/android/AndroidInput;->accelerometerAvailable:Z

    .line 761
    :goto_0
    iget-object v0, p0, Lcom/badlogic/gdx/backends/android/AndroidInput;->config:Lcom/badlogic/gdx/backends/android/AndroidApplicationConfiguration;

    iget-boolean v0, v0, Lcom/badlogic/gdx/backends/android/AndroidApplicationConfiguration;->useGyroscope:Z

    if-eqz v0, :cond_3

    .line 762
    iget-object v0, p0, Lcom/badlogic/gdx/backends/android/AndroidInput;->context:Landroid/content/Context;

    invoke-virtual {v0, v1}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/hardware/SensorManager;

    iput-object v0, p0, Lcom/badlogic/gdx/backends/android/AndroidInput;->manager:Landroid/hardware/SensorManager;

    .line 763
    iget-object v0, p0, Lcom/badlogic/gdx/backends/android/AndroidInput;->manager:Landroid/hardware/SensorManager;

    const/4 v3, 0x4

    invoke-virtual {v0, v3}, Landroid/hardware/SensorManager;->getSensorList(I)Ljava/util/List;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/List;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_2

    .line 764
    iput-boolean v2, p0, Lcom/badlogic/gdx/backends/android/AndroidInput;->gyroscopeAvailable:Z

    goto :goto_1

    .line 766
    :cond_2
    iget-object v0, p0, Lcom/badlogic/gdx/backends/android/AndroidInput;->manager:Landroid/hardware/SensorManager;

    invoke-virtual {v0, v3}, Landroid/hardware/SensorManager;->getSensorList(I)Ljava/util/List;

    move-result-object v0

    invoke-interface {v0, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/hardware/Sensor;

    .line 767
    new-instance v3, Lcom/badlogic/gdx/backends/android/AndroidInput$SensorListener;

    invoke-direct {v3, p0}, Lcom/badlogic/gdx/backends/android/AndroidInput$SensorListener;-><init>(Lcom/badlogic/gdx/backends/android/AndroidInput;)V

    iput-object v3, p0, Lcom/badlogic/gdx/backends/android/AndroidInput;->gyroscopeListener:Landroid/hardware/SensorEventListener;

    .line 768
    iget-object v3, p0, Lcom/badlogic/gdx/backends/android/AndroidInput;->manager:Landroid/hardware/SensorManager;

    iget-object v4, p0, Lcom/badlogic/gdx/backends/android/AndroidInput;->gyroscopeListener:Landroid/hardware/SensorEventListener;

    iget-object v5, p0, Lcom/badlogic/gdx/backends/android/AndroidInput;->config:Lcom/badlogic/gdx/backends/android/AndroidApplicationConfiguration;

    iget v5, v5, Lcom/badlogic/gdx/backends/android/AndroidApplicationConfiguration;->sensorDelay:I

    invoke-virtual {v3, v4, v0, v5}, Landroid/hardware/SensorManager;->registerListener(Landroid/hardware/SensorEventListener;Landroid/hardware/Sensor;I)Z

    move-result v0

    iput-boolean v0, p0, Lcom/badlogic/gdx/backends/android/AndroidInput;->gyroscopeAvailable:Z

    goto :goto_1

    .line 772
    :cond_3
    iput-boolean v2, p0, Lcom/badlogic/gdx/backends/android/AndroidInput;->gyroscopeAvailable:Z

    .line 774
    :goto_1
    iput-boolean v2, p0, Lcom/badlogic/gdx/backends/android/AndroidInput;->rotationVectorAvailable:Z

    .line 775
    iget-object v0, p0, Lcom/badlogic/gdx/backends/android/AndroidInput;->config:Lcom/badlogic/gdx/backends/android/AndroidApplicationConfiguration;

    iget-boolean v0, v0, Lcom/badlogic/gdx/backends/android/AndroidApplicationConfiguration;->useRotationVectorSensor:Z

    if-eqz v0, :cond_7

    .line 776
    iget-object v0, p0, Lcom/badlogic/gdx/backends/android/AndroidInput;->manager:Landroid/hardware/SensorManager;

    if-nez v0, :cond_4

    iget-object v0, p0, Lcom/badlogic/gdx/backends/android/AndroidInput;->context:Landroid/content/Context;

    invoke-virtual {v0, v1}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/hardware/SensorManager;

    iput-object v0, p0, Lcom/badlogic/gdx/backends/android/AndroidInput;->manager:Landroid/hardware/SensorManager;

    .line 777
    :cond_4
    iget-object v0, p0, Lcom/badlogic/gdx/backends/android/AndroidInput;->manager:Landroid/hardware/SensorManager;

    const/16 v3, 0xb

    invoke-virtual {v0, v3}, Landroid/hardware/SensorManager;->getSensorList(I)Ljava/util/List;

    move-result-object v0

    .line 778
    invoke-interface {v0}, Ljava/util/List;->isEmpty()Z

    move-result v3

    if-nez v3, :cond_7

    .line 779
    new-instance v3, Lcom/badlogic/gdx/backends/android/AndroidInput$SensorListener;

    invoke-direct {v3, p0}, Lcom/badlogic/gdx/backends/android/AndroidInput$SensorListener;-><init>(Lcom/badlogic/gdx/backends/android/AndroidInput;)V

    iput-object v3, p0, Lcom/badlogic/gdx/backends/android/AndroidInput;->rotationVectorListener:Landroid/hardware/SensorEventListener;

    .line 780
    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v3

    :cond_5
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_6

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Landroid/hardware/Sensor;

    .line 781
    invoke-virtual {v4}, Landroid/hardware/Sensor;->getVendor()Ljava/lang/String;

    move-result-object v5

    const-string v6, "Google Inc."

    invoke-virtual {v5, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_5

    invoke-virtual {v4}, Landroid/hardware/Sensor;->getVersion()I

    move-result v5

    const/4 v6, 0x3

    if-ne v5, v6, :cond_5

    .line 782
    iget-object v3, p0, Lcom/badlogic/gdx/backends/android/AndroidInput;->manager:Landroid/hardware/SensorManager;

    iget-object v5, p0, Lcom/badlogic/gdx/backends/android/AndroidInput;->rotationVectorListener:Landroid/hardware/SensorEventListener;

    iget-object v6, p0, Lcom/badlogic/gdx/backends/android/AndroidInput;->config:Lcom/badlogic/gdx/backends/android/AndroidApplicationConfiguration;

    iget v6, v6, Lcom/badlogic/gdx/backends/android/AndroidApplicationConfiguration;->sensorDelay:I

    invoke-virtual {v3, v5, v4, v6}, Landroid/hardware/SensorManager;->registerListener(Landroid/hardware/SensorEventListener;Landroid/hardware/Sensor;I)Z

    move-result v3

    iput-boolean v3, p0, Lcom/badlogic/gdx/backends/android/AndroidInput;->rotationVectorAvailable:Z

    .line 787
    :cond_6
    iget-boolean v3, p0, Lcom/badlogic/gdx/backends/android/AndroidInput;->rotationVectorAvailable:Z

    if-nez v3, :cond_7

    .line 788
    iget-object v3, p0, Lcom/badlogic/gdx/backends/android/AndroidInput;->manager:Landroid/hardware/SensorManager;

    iget-object v4, p0, Lcom/badlogic/gdx/backends/android/AndroidInput;->rotationVectorListener:Landroid/hardware/SensorEventListener;

    invoke-interface {v0, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/hardware/Sensor;

    iget-object v5, p0, Lcom/badlogic/gdx/backends/android/AndroidInput;->config:Lcom/badlogic/gdx/backends/android/AndroidApplicationConfiguration;

    iget v5, v5, Lcom/badlogic/gdx/backends/android/AndroidApplicationConfiguration;->sensorDelay:I

    invoke-virtual {v3, v4, v0, v5}, Landroid/hardware/SensorManager;->registerListener(Landroid/hardware/SensorEventListener;Landroid/hardware/Sensor;I)Z

    move-result v0

    iput-boolean v0, p0, Lcom/badlogic/gdx/backends/android/AndroidInput;->rotationVectorAvailable:Z

    .line 793
    :cond_7
    iget-object v0, p0, Lcom/badlogic/gdx/backends/android/AndroidInput;->config:Lcom/badlogic/gdx/backends/android/AndroidApplicationConfiguration;

    iget-boolean v0, v0, Lcom/badlogic/gdx/backends/android/AndroidApplicationConfiguration;->useCompass:Z

    if-eqz v0, :cond_a

    iget-boolean v0, p0, Lcom/badlogic/gdx/backends/android/AndroidInput;->rotationVectorAvailable:Z

    if-nez v0, :cond_a

    .line 794
    iget-object v0, p0, Lcom/badlogic/gdx/backends/android/AndroidInput;->manager:Landroid/hardware/SensorManager;

    if-nez v0, :cond_8

    iget-object v0, p0, Lcom/badlogic/gdx/backends/android/AndroidInput;->context:Landroid/content/Context;

    invoke-virtual {v0, v1}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/hardware/SensorManager;

    iput-object v0, p0, Lcom/badlogic/gdx/backends/android/AndroidInput;->manager:Landroid/hardware/SensorManager;

    .line 795
    :cond_8
    iget-object v0, p0, Lcom/badlogic/gdx/backends/android/AndroidInput;->manager:Landroid/hardware/SensorManager;

    const/4 v1, 0x2

    invoke-virtual {v0, v1}, Landroid/hardware/SensorManager;->getDefaultSensor(I)Landroid/hardware/Sensor;

    move-result-object v0

    if-eqz v0, :cond_9

    .line 797
    iget-boolean v1, p0, Lcom/badlogic/gdx/backends/android/AndroidInput;->accelerometerAvailable:Z

    iput-boolean v1, p0, Lcom/badlogic/gdx/backends/android/AndroidInput;->compassAvailable:Z

    .line 798
    iget-boolean v1, p0, Lcom/badlogic/gdx/backends/android/AndroidInput;->compassAvailable:Z

    if-eqz v1, :cond_b

    .line 799
    new-instance v1, Lcom/badlogic/gdx/backends/android/AndroidInput$SensorListener;

    invoke-direct {v1, p0}, Lcom/badlogic/gdx/backends/android/AndroidInput$SensorListener;-><init>(Lcom/badlogic/gdx/backends/android/AndroidInput;)V

    iput-object v1, p0, Lcom/badlogic/gdx/backends/android/AndroidInput;->compassListener:Landroid/hardware/SensorEventListener;

    .line 800
    iget-object v1, p0, Lcom/badlogic/gdx/backends/android/AndroidInput;->manager:Landroid/hardware/SensorManager;

    iget-object v2, p0, Lcom/badlogic/gdx/backends/android/AndroidInput;->compassListener:Landroid/hardware/SensorEventListener;

    iget-object v3, p0, Lcom/badlogic/gdx/backends/android/AndroidInput;->config:Lcom/badlogic/gdx/backends/android/AndroidApplicationConfiguration;

    iget v3, v3, Lcom/badlogic/gdx/backends/android/AndroidApplicationConfiguration;->sensorDelay:I

    invoke-virtual {v1, v2, v0, v3}, Landroid/hardware/SensorManager;->registerListener(Landroid/hardware/SensorEventListener;Landroid/hardware/Sensor;I)Z

    move-result v0

    iput-boolean v0, p0, Lcom/badlogic/gdx/backends/android/AndroidInput;->compassAvailable:Z

    goto :goto_2

    .line 803
    :cond_9
    iput-boolean v2, p0, Lcom/badlogic/gdx/backends/android/AndroidInput;->compassAvailable:Z

    goto :goto_2

    .line 806
    :cond_a
    iput-boolean v2, p0, Lcom/badlogic/gdx/backends/android/AndroidInput;->compassAvailable:Z

    .line 807
    :cond_b
    :goto_2
    sget-object v0, Lcom/badlogic/gdx/Gdx;->app:Lcom/badlogic/gdx/Application;

    const-string v1, "AndroidInput"

    const-string v2, "sensor listener setup"

    invoke-interface {v0, v1, v2}, Lcom/badlogic/gdx/Application;->log(Ljava/lang/String;Ljava/lang/String;)V

    return-void
.end method

.method public setCatchBackKey(Z)V
    .locals 1

    const/4 v0, 0x4

    .line 618
    invoke-virtual {p0, v0, p1}, Lcom/badlogic/gdx/backends/android/AndroidInput;->setCatchKey(IZ)V

    return-void
.end method

.method public setCatchKey(IZ)V
    .locals 0

    if-nez p2, :cond_0

    .line 639
    iget-object p2, p0, Lcom/badlogic/gdx/backends/android/AndroidInput;->keysToCatch:Lcom/badlogic/gdx/utils/IntSet;

    invoke-virtual {p2, p1}, Lcom/badlogic/gdx/utils/IntSet;->remove(I)Z

    goto :goto_0

    :cond_0
    if-eqz p2, :cond_1

    .line 641
    iget-object p2, p0, Lcom/badlogic/gdx/backends/android/AndroidInput;->keysToCatch:Lcom/badlogic/gdx/utils/IntSet;

    invoke-virtual {p2, p1}, Lcom/badlogic/gdx/utils/IntSet;->add(I)Z

    :cond_1
    :goto_0
    return-void
.end method

.method public setCatchMenuKey(Z)V
    .locals 1

    const/16 v0, 0x52

    .line 628
    invoke-virtual {p0, v0, p1}, Lcom/badlogic/gdx/backends/android/AndroidInput;->setCatchKey(IZ)V

    return-void
.end method

.method public setCursorCatched(Z)V
    .locals 0

    return-void
.end method

.method public setCursorPosition(II)V
    .locals 0

    return-void
.end method

.method public setInputProcessor(Lcom/badlogic/gdx/InputProcessor;)V
    .locals 0

    .line 357
    monitor-enter p0

    .line 358
    :try_start_0
    iput-object p1, p0, Lcom/badlogic/gdx/backends/android/AndroidInput;->processor:Lcom/badlogic/gdx/InputProcessor;

    .line 359
    monitor-exit p0

    return-void

    :catchall_0
    move-exception p1

    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw p1
.end method

.method public setOnscreenKeyboardVisible(Z)V
    .locals 2

    .line 601
    iget-object v0, p0, Lcom/badlogic/gdx/backends/android/AndroidInput;->handle:Landroid/os/Handler;

    new-instance v1, Lcom/badlogic/gdx/backends/android/AndroidInput$4;

    invoke-direct {v1, p0, p1}, Lcom/badlogic/gdx/backends/android/AndroidInput$4;-><init>(Lcom/badlogic/gdx/backends/android/AndroidInput;Z)V

    invoke-virtual {v0, v1}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    return-void
.end method

.method unregisterSensorListeners()V
    .locals 3

    .line 811
    iget-object v0, p0, Lcom/badlogic/gdx/backends/android/AndroidInput;->manager:Landroid/hardware/SensorManager;

    if-eqz v0, :cond_4

    .line 812
    iget-object v1, p0, Lcom/badlogic/gdx/backends/android/AndroidInput;->accelerometerListener:Landroid/hardware/SensorEventListener;

    const/4 v2, 0x0

    if-eqz v1, :cond_0

    .line 813
    invoke-virtual {v0, v1}, Landroid/hardware/SensorManager;->unregisterListener(Landroid/hardware/SensorEventListener;)V

    .line 814
    iput-object v2, p0, Lcom/badlogic/gdx/backends/android/AndroidInput;->accelerometerListener:Landroid/hardware/SensorEventListener;

    .line 816
    :cond_0
    iget-object v0, p0, Lcom/badlogic/gdx/backends/android/AndroidInput;->gyroscopeListener:Landroid/hardware/SensorEventListener;

    if-eqz v0, :cond_1

    .line 817
    iget-object v1, p0, Lcom/badlogic/gdx/backends/android/AndroidInput;->manager:Landroid/hardware/SensorManager;

    invoke-virtual {v1, v0}, Landroid/hardware/SensorManager;->unregisterListener(Landroid/hardware/SensorEventListener;)V

    .line 818
    iput-object v2, p0, Lcom/badlogic/gdx/backends/android/AndroidInput;->gyroscopeListener:Landroid/hardware/SensorEventListener;

    .line 820
    :cond_1
    iget-object v0, p0, Lcom/badlogic/gdx/backends/android/AndroidInput;->rotationVectorListener:Landroid/hardware/SensorEventListener;

    if-eqz v0, :cond_2

    .line 821
    iget-object v1, p0, Lcom/badlogic/gdx/backends/android/AndroidInput;->manager:Landroid/hardware/SensorManager;

    invoke-virtual {v1, v0}, Landroid/hardware/SensorManager;->unregisterListener(Landroid/hardware/SensorEventListener;)V

    .line 822
    iput-object v2, p0, Lcom/badlogic/gdx/backends/android/AndroidInput;->rotationVectorListener:Landroid/hardware/SensorEventListener;

    .line 824
    :cond_2
    iget-object v0, p0, Lcom/badlogic/gdx/backends/android/AndroidInput;->compassListener:Landroid/hardware/SensorEventListener;

    if-eqz v0, :cond_3

    .line 825
    iget-object v1, p0, Lcom/badlogic/gdx/backends/android/AndroidInput;->manager:Landroid/hardware/SensorManager;

    invoke-virtual {v1, v0}, Landroid/hardware/SensorManager;->unregisterListener(Landroid/hardware/SensorEventListener;)V

    .line 826
    iput-object v2, p0, Lcom/badlogic/gdx/backends/android/AndroidInput;->compassListener:Landroid/hardware/SensorEventListener;

    .line 828
    :cond_3
    iput-object v2, p0, Lcom/badlogic/gdx/backends/android/AndroidInput;->manager:Landroid/hardware/SensorManager;

    .line 830
    :cond_4
    sget-object v0, Lcom/badlogic/gdx/Gdx;->app:Lcom/badlogic/gdx/Application;

    const-string v1, "AndroidInput"

    const-string v2, "sensor listener tear down"

    invoke-interface {v0, v1, v2}, Lcom/badlogic/gdx/Application;->log(Ljava/lang/String;Ljava/lang/String;)V

    return-void
.end method

.method public vibrate(I)V
    .locals 3

    .line 652
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x1a

    if-lt v0, v1, :cond_0

    .line 653
    iget-object v0, p0, Lcom/badlogic/gdx/backends/android/AndroidInput;->vibrator:Landroid/os/Vibrator;

    int-to-long v1, p1

    const/4 p1, -0x1

    invoke-static {v1, v2, p1}, Landroid/os/VibrationEffect;->createOneShot(JI)Landroid/os/VibrationEffect;

    move-result-object p1

    invoke-virtual {v0, p1}, Landroid/os/Vibrator;->vibrate(Landroid/os/VibrationEffect;)V

    goto :goto_0

    .line 655
    :cond_0
    iget-object v0, p0, Lcom/badlogic/gdx/backends/android/AndroidInput;->vibrator:Landroid/os/Vibrator;

    int-to-long v1, p1

    invoke-virtual {v0, v1, v2}, Landroid/os/Vibrator;->vibrate(J)V

    :goto_0
    return-void
.end method

.method public vibrate([JI)V
    .locals 2

    .line 660
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x1a

    if-lt v0, v1, :cond_0

    .line 661
    iget-object v0, p0, Lcom/badlogic/gdx/backends/android/AndroidInput;->vibrator:Landroid/os/Vibrator;

    invoke-static {p1, p2}, Landroid/os/VibrationEffect;->createWaveform([JI)Landroid/os/VibrationEffect;

    move-result-object p1

    invoke-virtual {v0, p1}, Landroid/os/Vibrator;->vibrate(Landroid/os/VibrationEffect;)V

    goto :goto_0

    .line 663
    :cond_0
    iget-object v0, p0, Lcom/badlogic/gdx/backends/android/AndroidInput;->vibrator:Landroid/os/Vibrator;

    invoke-virtual {v0, p1, p2}, Landroid/os/Vibrator;->vibrate([JI)V

    :goto_0
    return-void
.end method
