.class public final enum Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter$SpawnShape;
.super Ljava/lang/Enum;
.source "ParticleEmitter.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x4019
    name = "SpawnShape"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum<",
        "Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter$SpawnShape;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter$SpawnShape;

.field public static final enum ellipse:Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter$SpawnShape;

.field public static final enum line:Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter$SpawnShape;

.field public static final enum point:Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter$SpawnShape;

.field public static final enum square:Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter$SpawnShape;


# direct methods
.method static constructor <clinit>()V
    .locals 6

    .line 1717
    new-instance v0, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter$SpawnShape;

    const/4 v1, 0x0

    const-string v2, "point"

    invoke-direct {v0, v2, v1}, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter$SpawnShape;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter$SpawnShape;->point:Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter$SpawnShape;

    new-instance v0, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter$SpawnShape;

    const/4 v2, 0x1

    const-string v3, "line"

    invoke-direct {v0, v3, v2}, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter$SpawnShape;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter$SpawnShape;->line:Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter$SpawnShape;

    new-instance v0, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter$SpawnShape;

    const/4 v3, 0x2

    const-string v4, "square"

    invoke-direct {v0, v4, v3}, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter$SpawnShape;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter$SpawnShape;->square:Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter$SpawnShape;

    new-instance v0, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter$SpawnShape;

    const/4 v4, 0x3

    const-string v5, "ellipse"

    invoke-direct {v0, v5, v4}, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter$SpawnShape;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter$SpawnShape;->ellipse:Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter$SpawnShape;

    const/4 v0, 0x4

    .line 1716
    new-array v0, v0, [Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter$SpawnShape;

    sget-object v5, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter$SpawnShape;->point:Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter$SpawnShape;

    aput-object v5, v0, v1

    sget-object v1, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter$SpawnShape;->line:Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter$SpawnShape;

    aput-object v1, v0, v2

    sget-object v1, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter$SpawnShape;->square:Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter$SpawnShape;

    aput-object v1, v0, v3

    sget-object v1, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter$SpawnShape;->ellipse:Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter$SpawnShape;

    aput-object v1, v0, v4

    sput-object v0, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter$SpawnShape;->$VALUES:[Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter$SpawnShape;

    return-void
.end method

.method private constructor <init>(Ljava/lang/String;I)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 1716
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter$SpawnShape;
    .locals 1

    .line 1716
    const-class v0, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter$SpawnShape;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object p0

    check-cast p0, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter$SpawnShape;

    return-object p0
.end method

.method public static values()[Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter$SpawnShape;
    .locals 1

    .line 1716
    sget-object v0, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter$SpawnShape;->$VALUES:[Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter$SpawnShape;

    invoke-virtual {v0}, [Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter$SpawnShape;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter$SpawnShape;

    return-object v0
.end method
