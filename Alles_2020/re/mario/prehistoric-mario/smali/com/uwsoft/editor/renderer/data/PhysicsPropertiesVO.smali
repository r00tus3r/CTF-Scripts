.class public Lcom/uwsoft/editor/renderer/data/PhysicsPropertiesVO;
.super Ljava/lang/Object;
.source "PhysicsPropertiesVO.java"


# instance fields
.field public enabled:Z

.field public gravityX:F

.field public gravityY:F

.field public sleepVelocity:F


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 12
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, 0x0

    .line 13
    iput v0, p0, Lcom/uwsoft/editor/renderer/data/PhysicsPropertiesVO;->gravityX:F

    .line 14
    iput v0, p0, Lcom/uwsoft/editor/renderer/data/PhysicsPropertiesVO;->gravityY:F

    .line 15
    iput v0, p0, Lcom/uwsoft/editor/renderer/data/PhysicsPropertiesVO;->sleepVelocity:F

    const/4 v0, 0x0

    .line 16
    iput-boolean v0, p0, Lcom/uwsoft/editor/renderer/data/PhysicsPropertiesVO;->enabled:Z

    return-void
.end method

.method public constructor <init>(Lcom/uwsoft/editor/renderer/data/PhysicsPropertiesVO;)V
    .locals 1

    .line 19
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 20
    iget v0, p1, Lcom/uwsoft/editor/renderer/data/PhysicsPropertiesVO;->gravityX:F

    iput v0, p0, Lcom/uwsoft/editor/renderer/data/PhysicsPropertiesVO;->gravityX:F

    .line 21
    iget v0, p1, Lcom/uwsoft/editor/renderer/data/PhysicsPropertiesVO;->gravityY:F

    iput v0, p0, Lcom/uwsoft/editor/renderer/data/PhysicsPropertiesVO;->gravityY:F

    .line 22
    iget v0, p1, Lcom/uwsoft/editor/renderer/data/PhysicsPropertiesVO;->sleepVelocity:F

    iput v0, p0, Lcom/uwsoft/editor/renderer/data/PhysicsPropertiesVO;->sleepVelocity:F

    .line 23
    iget-boolean p1, p1, Lcom/uwsoft/editor/renderer/data/PhysicsPropertiesVO;->enabled:Z

    iput-boolean p1, p0, Lcom/uwsoft/editor/renderer/data/PhysicsPropertiesVO;->enabled:Z

    return-void
.end method
