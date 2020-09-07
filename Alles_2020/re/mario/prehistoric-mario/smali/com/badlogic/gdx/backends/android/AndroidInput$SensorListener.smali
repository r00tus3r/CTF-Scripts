.class Lcom/badlogic/gdx/backends/android/AndroidInput$SensorListener;
.super Ljava/lang/Object;
.source "AndroidInput.java"

# interfaces
.implements Landroid/hardware/SensorEventListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/badlogic/gdx/backends/android/AndroidInput;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "SensorListener"
.end annotation


# instance fields
.field final synthetic this$0:Lcom/badlogic/gdx/backends/android/AndroidInput;


# direct methods
.method public constructor <init>(Lcom/badlogic/gdx/backends/android/AndroidInput;)V
    .locals 0

    .line 991
    iput-object p1, p0, Lcom/badlogic/gdx/backends/android/AndroidInput$SensorListener;->this$0:Lcom/badlogic/gdx/backends/android/AndroidInput;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onAccuracyChanged(Landroid/hardware/Sensor;I)V
    .locals 0

    return-void
.end method

.method public onSensorChanged(Landroid/hardware/SensorEvent;)V
    .locals 6

    .line 1002
    iget-object v0, p1, Landroid/hardware/SensorEvent;->sensor:Landroid/hardware/Sensor;

    invoke-virtual {v0}, Landroid/hardware/Sensor;->getType()I

    move-result v0

    const/4 v1, 0x2

    const/4 v2, 0x1

    const/4 v3, 0x0

    if-ne v0, v2, :cond_1

    .line 1003
    iget-object v0, p0, Lcom/badlogic/gdx/backends/android/AndroidInput$SensorListener;->this$0:Lcom/badlogic/gdx/backends/android/AndroidInput;

    iget-object v0, v0, Lcom/badlogic/gdx/backends/android/AndroidInput;->nativeOrientation:Lcom/badlogic/gdx/Input$Orientation;

    sget-object v4, Lcom/badlogic/gdx/Input$Orientation;->Portrait:Lcom/badlogic/gdx/Input$Orientation;

    if-ne v0, v4, :cond_0

    .line 1004
    iget-object v0, p1, Landroid/hardware/SensorEvent;->values:[F

    iget-object v4, p0, Lcom/badlogic/gdx/backends/android/AndroidInput$SensorListener;->this$0:Lcom/badlogic/gdx/backends/android/AndroidInput;

    iget-object v4, v4, Lcom/badlogic/gdx/backends/android/AndroidInput;->accelerometerValues:[F

    iget-object v5, p0, Lcom/badlogic/gdx/backends/android/AndroidInput$SensorListener;->this$0:Lcom/badlogic/gdx/backends/android/AndroidInput;

    iget-object v5, v5, Lcom/badlogic/gdx/backends/android/AndroidInput;->accelerometerValues:[F

    array-length v5, v5

    invoke-static {v0, v3, v4, v3, v5}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    goto :goto_0

    .line 1006
    :cond_0
    iget-object v0, p0, Lcom/badlogic/gdx/backends/android/AndroidInput$SensorListener;->this$0:Lcom/badlogic/gdx/backends/android/AndroidInput;

    iget-object v0, v0, Lcom/badlogic/gdx/backends/android/AndroidInput;->accelerometerValues:[F

    iget-object v4, p1, Landroid/hardware/SensorEvent;->values:[F

    aget v4, v4, v2

    aput v4, v0, v3

    .line 1007
    iget-object v0, p0, Lcom/badlogic/gdx/backends/android/AndroidInput$SensorListener;->this$0:Lcom/badlogic/gdx/backends/android/AndroidInput;

    iget-object v0, v0, Lcom/badlogic/gdx/backends/android/AndroidInput;->accelerometerValues:[F

    iget-object v4, p1, Landroid/hardware/SensorEvent;->values:[F

    aget v4, v4, v3

    neg-float v4, v4

    aput v4, v0, v2

    .line 1008
    iget-object v0, p0, Lcom/badlogic/gdx/backends/android/AndroidInput$SensorListener;->this$0:Lcom/badlogic/gdx/backends/android/AndroidInput;

    iget-object v0, v0, Lcom/badlogic/gdx/backends/android/AndroidInput;->accelerometerValues:[F

    iget-object v4, p1, Landroid/hardware/SensorEvent;->values:[F

    aget v4, v4, v1

    aput v4, v0, v1

    .line 1011
    :cond_1
    :goto_0
    iget-object v0, p1, Landroid/hardware/SensorEvent;->sensor:Landroid/hardware/Sensor;

    invoke-virtual {v0}, Landroid/hardware/Sensor;->getType()I

    move-result v0

    if-ne v0, v1, :cond_2

    .line 1012
    iget-object v0, p1, Landroid/hardware/SensorEvent;->values:[F

    iget-object v4, p0, Lcom/badlogic/gdx/backends/android/AndroidInput$SensorListener;->this$0:Lcom/badlogic/gdx/backends/android/AndroidInput;

    iget-object v4, v4, Lcom/badlogic/gdx/backends/android/AndroidInput;->magneticFieldValues:[F

    iget-object v5, p0, Lcom/badlogic/gdx/backends/android/AndroidInput$SensorListener;->this$0:Lcom/badlogic/gdx/backends/android/AndroidInput;

    iget-object v5, v5, Lcom/badlogic/gdx/backends/android/AndroidInput;->magneticFieldValues:[F

    array-length v5, v5

    invoke-static {v0, v3, v4, v3, v5}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 1014
    :cond_2
    iget-object v0, p1, Landroid/hardware/SensorEvent;->sensor:Landroid/hardware/Sensor;

    invoke-virtual {v0}, Landroid/hardware/Sensor;->getType()I

    move-result v0

    const/4 v4, 0x4

    if-ne v0, v4, :cond_4

    .line 1015
    iget-object v0, p0, Lcom/badlogic/gdx/backends/android/AndroidInput$SensorListener;->this$0:Lcom/badlogic/gdx/backends/android/AndroidInput;

    iget-object v0, v0, Lcom/badlogic/gdx/backends/android/AndroidInput;->nativeOrientation:Lcom/badlogic/gdx/Input$Orientation;

    sget-object v4, Lcom/badlogic/gdx/Input$Orientation;->Portrait:Lcom/badlogic/gdx/Input$Orientation;

    if-ne v0, v4, :cond_3

    .line 1016
    iget-object v0, p1, Landroid/hardware/SensorEvent;->values:[F

    iget-object v4, p0, Lcom/badlogic/gdx/backends/android/AndroidInput$SensorListener;->this$0:Lcom/badlogic/gdx/backends/android/AndroidInput;

    iget-object v4, v4, Lcom/badlogic/gdx/backends/android/AndroidInput;->gyroscopeValues:[F

    iget-object v5, p0, Lcom/badlogic/gdx/backends/android/AndroidInput$SensorListener;->this$0:Lcom/badlogic/gdx/backends/android/AndroidInput;

    iget-object v5, v5, Lcom/badlogic/gdx/backends/android/AndroidInput;->gyroscopeValues:[F

    array-length v5, v5

    invoke-static {v0, v3, v4, v3, v5}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    goto :goto_1

    .line 1018
    :cond_3
    iget-object v0, p0, Lcom/badlogic/gdx/backends/android/AndroidInput$SensorListener;->this$0:Lcom/badlogic/gdx/backends/android/AndroidInput;

    iget-object v0, v0, Lcom/badlogic/gdx/backends/android/AndroidInput;->gyroscopeValues:[F

    iget-object v4, p1, Landroid/hardware/SensorEvent;->values:[F

    aget v4, v4, v2

    aput v4, v0, v3

    .line 1019
    iget-object v0, p0, Lcom/badlogic/gdx/backends/android/AndroidInput$SensorListener;->this$0:Lcom/badlogic/gdx/backends/android/AndroidInput;

    iget-object v0, v0, Lcom/badlogic/gdx/backends/android/AndroidInput;->gyroscopeValues:[F

    iget-object v4, p1, Landroid/hardware/SensorEvent;->values:[F

    aget v4, v4, v3

    neg-float v4, v4

    aput v4, v0, v2

    .line 1020
    iget-object v0, p0, Lcom/badlogic/gdx/backends/android/AndroidInput$SensorListener;->this$0:Lcom/badlogic/gdx/backends/android/AndroidInput;

    iget-object v0, v0, Lcom/badlogic/gdx/backends/android/AndroidInput;->gyroscopeValues:[F

    iget-object v4, p1, Landroid/hardware/SensorEvent;->values:[F

    aget v4, v4, v1

    aput v4, v0, v1

    .line 1023
    :cond_4
    :goto_1
    iget-object v0, p1, Landroid/hardware/SensorEvent;->sensor:Landroid/hardware/Sensor;

    invoke-virtual {v0}, Landroid/hardware/Sensor;->getType()I

    move-result v0

    const/16 v4, 0xb

    if-ne v0, v4, :cond_6

    .line 1024
    iget-object v0, p0, Lcom/badlogic/gdx/backends/android/AndroidInput$SensorListener;->this$0:Lcom/badlogic/gdx/backends/android/AndroidInput;

    iget-object v0, v0, Lcom/badlogic/gdx/backends/android/AndroidInput;->nativeOrientation:Lcom/badlogic/gdx/Input$Orientation;

    sget-object v4, Lcom/badlogic/gdx/Input$Orientation;->Portrait:Lcom/badlogic/gdx/Input$Orientation;

    if-ne v0, v4, :cond_5

    .line 1025
    iget-object p1, p1, Landroid/hardware/SensorEvent;->values:[F

    iget-object v0, p0, Lcom/badlogic/gdx/backends/android/AndroidInput$SensorListener;->this$0:Lcom/badlogic/gdx/backends/android/AndroidInput;

    iget-object v0, v0, Lcom/badlogic/gdx/backends/android/AndroidInput;->rotationVectorValues:[F

    iget-object v1, p0, Lcom/badlogic/gdx/backends/android/AndroidInput$SensorListener;->this$0:Lcom/badlogic/gdx/backends/android/AndroidInput;

    iget-object v1, v1, Lcom/badlogic/gdx/backends/android/AndroidInput;->rotationVectorValues:[F

    array-length v1, v1

    invoke-static {p1, v3, v0, v3, v1}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    goto :goto_2

    .line 1027
    :cond_5
    iget-object v0, p0, Lcom/badlogic/gdx/backends/android/AndroidInput$SensorListener;->this$0:Lcom/badlogic/gdx/backends/android/AndroidInput;

    iget-object v0, v0, Lcom/badlogic/gdx/backends/android/AndroidInput;->rotationVectorValues:[F

    iget-object v4, p1, Landroid/hardware/SensorEvent;->values:[F

    aget v4, v4, v2

    aput v4, v0, v3

    .line 1028
    iget-object v0, p0, Lcom/badlogic/gdx/backends/android/AndroidInput$SensorListener;->this$0:Lcom/badlogic/gdx/backends/android/AndroidInput;

    iget-object v0, v0, Lcom/badlogic/gdx/backends/android/AndroidInput;->rotationVectorValues:[F

    iget-object v4, p1, Landroid/hardware/SensorEvent;->values:[F

    aget v3, v4, v3

    neg-float v3, v3

    aput v3, v0, v2

    .line 1029
    iget-object v0, p0, Lcom/badlogic/gdx/backends/android/AndroidInput$SensorListener;->this$0:Lcom/badlogic/gdx/backends/android/AndroidInput;

    iget-object v0, v0, Lcom/badlogic/gdx/backends/android/AndroidInput;->rotationVectorValues:[F

    iget-object p1, p1, Landroid/hardware/SensorEvent;->values:[F

    aget p1, p1, v1

    aput p1, v0, v1

    :cond_6
    :goto_2
    return-void
.end method
