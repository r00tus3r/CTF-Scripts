.class Lcom/alles/platformer/MyPlatformer$Koala;
.super Ljava/lang/Object;
.source "MyPlatformer.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/alles/platformer/MyPlatformer;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = "Koala"
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/alles/platformer/MyPlatformer$Koala$State;
    }
.end annotation


# static fields
.field static DAMPING:F = 0.87f

.field static HEIGHT:F = 0.0f

.field static JUMP_VELOCITY:F = 40.0f

.field static MAX_VELOCITY:F = 5.0f

.field static MAX_Y_VELOCITY:F = 40.0f

.field static WIDTH:F


# instance fields
.field facesRight:Z

.field grounded:Z

.field final position:Lcom/badlogic/gdx/math/Vector2;

.field state:Lcom/alles/platformer/MyPlatformer$Koala$State;

.field stateTime:F

.field final velocity:Lcom/badlogic/gdx/math/Vector2;


# direct methods
.method static constructor <clinit>()V
    .locals 0

    return-void
.end method

.method constructor <init>()V
    .locals 1

    .line 63
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 75
    new-instance v0, Lcom/badlogic/gdx/math/Vector2;

    invoke-direct {v0}, Lcom/badlogic/gdx/math/Vector2;-><init>()V

    iput-object v0, p0, Lcom/alles/platformer/MyPlatformer$Koala;->position:Lcom/badlogic/gdx/math/Vector2;

    .line 76
    new-instance v0, Lcom/badlogic/gdx/math/Vector2;

    invoke-direct {v0}, Lcom/badlogic/gdx/math/Vector2;-><init>()V

    iput-object v0, p0, Lcom/alles/platformer/MyPlatformer$Koala;->velocity:Lcom/badlogic/gdx/math/Vector2;

    .line 77
    sget-object v0, Lcom/alles/platformer/MyPlatformer$Koala$State;->Walking:Lcom/alles/platformer/MyPlatformer$Koala$State;

    iput-object v0, p0, Lcom/alles/platformer/MyPlatformer$Koala;->state:Lcom/alles/platformer/MyPlatformer$Koala$State;

    const/4 v0, 0x0

    .line 78
    iput v0, p0, Lcom/alles/platformer/MyPlatformer$Koala;->stateTime:F

    const/4 v0, 0x1

    .line 79
    iput-boolean v0, p0, Lcom/alles/platformer/MyPlatformer$Koala;->facesRight:Z

    const/4 v0, 0x0

    .line 80
    iput-boolean v0, p0, Lcom/alles/platformer/MyPlatformer$Koala;->grounded:Z

    return-void
.end method
