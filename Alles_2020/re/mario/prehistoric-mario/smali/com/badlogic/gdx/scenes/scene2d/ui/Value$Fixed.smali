.class public Lcom/badlogic/gdx/scenes/scene2d/ui/Value$Fixed;
.super Lcom/badlogic/gdx/scenes/scene2d/ui/Value;
.source "Value.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/badlogic/gdx/scenes/scene2d/ui/Value;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "Fixed"
.end annotation


# static fields
.field static final cache:[Lcom/badlogic/gdx/scenes/scene2d/ui/Value$Fixed;


# instance fields
.field private final value:F


# direct methods
.method static constructor <clinit>()V
    .locals 1

    const/16 v0, 0x6f

    .line 40
    new-array v0, v0, [Lcom/badlogic/gdx/scenes/scene2d/ui/Value$Fixed;

    sput-object v0, Lcom/badlogic/gdx/scenes/scene2d/ui/Value$Fixed;->cache:[Lcom/badlogic/gdx/scenes/scene2d/ui/Value$Fixed;

    return-void
.end method

.method public constructor <init>(F)V
    .locals 0

    .line 44
    invoke-direct {p0}, Lcom/badlogic/gdx/scenes/scene2d/ui/Value;-><init>()V

    .line 45
    iput p1, p0, Lcom/badlogic/gdx/scenes/scene2d/ui/Value$Fixed;->value:F

    return-void
.end method

.method public static valueOf(F)Lcom/badlogic/gdx/scenes/scene2d/ui/Value$Fixed;
    .locals 3

    const/4 v0, 0x0

    cmpl-float v0, p0, v0

    if-nez v0, :cond_0

    .line 57
    sget-object p0, Lcom/badlogic/gdx/scenes/scene2d/ui/Value$Fixed;->zero:Lcom/badlogic/gdx/scenes/scene2d/ui/Value$Fixed;

    return-object p0

    :cond_0
    const/high16 v0, -0x3ee00000    # -10.0f

    cmpl-float v0, p0, v0

    if-ltz v0, :cond_2

    const/high16 v0, 0x42c80000    # 100.0f

    cmpg-float v0, p0, v0

    if-gtz v0, :cond_2

    float-to-int v0, p0

    int-to-float v1, v0

    cmpl-float v1, p0, v1

    if-nez v1, :cond_2

    .line 59
    sget-object v1, Lcom/badlogic/gdx/scenes/scene2d/ui/Value$Fixed;->cache:[Lcom/badlogic/gdx/scenes/scene2d/ui/Value$Fixed;

    add-int/lit8 v0, v0, 0xa

    aget-object v2, v1, v0

    if-nez v2, :cond_1

    .line 60
    new-instance v2, Lcom/badlogic/gdx/scenes/scene2d/ui/Value$Fixed;

    invoke-direct {v2, p0}, Lcom/badlogic/gdx/scenes/scene2d/ui/Value$Fixed;-><init>(F)V

    aput-object v2, v1, v0

    :cond_1
    return-object v2

    .line 63
    :cond_2
    new-instance v0, Lcom/badlogic/gdx/scenes/scene2d/ui/Value$Fixed;

    invoke-direct {v0, p0}, Lcom/badlogic/gdx/scenes/scene2d/ui/Value$Fixed;-><init>(F)V

    return-object v0
.end method


# virtual methods
.method public get(Lcom/badlogic/gdx/scenes/scene2d/Actor;)F
    .locals 0

    .line 49
    iget p1, p0, Lcom/badlogic/gdx/scenes/scene2d/ui/Value$Fixed;->value:F

    return p1
.end method

.method public toString()Ljava/lang/String;
    .locals 1

    .line 53
    iget v0, p0, Lcom/badlogic/gdx/scenes/scene2d/ui/Value$Fixed;->value:F

    invoke-static {v0}, Ljava/lang/Float;->toString(F)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
