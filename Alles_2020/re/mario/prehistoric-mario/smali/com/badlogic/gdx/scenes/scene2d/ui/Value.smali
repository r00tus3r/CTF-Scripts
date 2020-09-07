.class public abstract Lcom/badlogic/gdx/scenes/scene2d/ui/Value;
.super Ljava/lang/Object;
.source "Value.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/badlogic/gdx/scenes/scene2d/ui/Value$Fixed;
    }
.end annotation


# static fields
.field public static maxHeight:Lcom/badlogic/gdx/scenes/scene2d/ui/Value;

.field public static maxWidth:Lcom/badlogic/gdx/scenes/scene2d/ui/Value;

.field public static minHeight:Lcom/badlogic/gdx/scenes/scene2d/ui/Value;

.field public static minWidth:Lcom/badlogic/gdx/scenes/scene2d/ui/Value;

.field public static prefHeight:Lcom/badlogic/gdx/scenes/scene2d/ui/Value;

.field public static prefWidth:Lcom/badlogic/gdx/scenes/scene2d/ui/Value;

.field public static final zero:Lcom/badlogic/gdx/scenes/scene2d/ui/Value$Fixed;


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 35
    new-instance v0, Lcom/badlogic/gdx/scenes/scene2d/ui/Value$Fixed;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Lcom/badlogic/gdx/scenes/scene2d/ui/Value$Fixed;-><init>(F)V

    sput-object v0, Lcom/badlogic/gdx/scenes/scene2d/ui/Value;->zero:Lcom/badlogic/gdx/scenes/scene2d/ui/Value$Fixed;

    .line 68
    new-instance v0, Lcom/badlogic/gdx/scenes/scene2d/ui/Value$1;

    invoke-direct {v0}, Lcom/badlogic/gdx/scenes/scene2d/ui/Value$1;-><init>()V

    sput-object v0, Lcom/badlogic/gdx/scenes/scene2d/ui/Value;->minWidth:Lcom/badlogic/gdx/scenes/scene2d/ui/Value;

    .line 76
    new-instance v0, Lcom/badlogic/gdx/scenes/scene2d/ui/Value$2;

    invoke-direct {v0}, Lcom/badlogic/gdx/scenes/scene2d/ui/Value$2;-><init>()V

    sput-object v0, Lcom/badlogic/gdx/scenes/scene2d/ui/Value;->minHeight:Lcom/badlogic/gdx/scenes/scene2d/ui/Value;

    .line 84
    new-instance v0, Lcom/badlogic/gdx/scenes/scene2d/ui/Value$3;

    invoke-direct {v0}, Lcom/badlogic/gdx/scenes/scene2d/ui/Value$3;-><init>()V

    sput-object v0, Lcom/badlogic/gdx/scenes/scene2d/ui/Value;->prefWidth:Lcom/badlogic/gdx/scenes/scene2d/ui/Value;

    .line 93
    new-instance v0, Lcom/badlogic/gdx/scenes/scene2d/ui/Value$4;

    invoke-direct {v0}, Lcom/badlogic/gdx/scenes/scene2d/ui/Value$4;-><init>()V

    sput-object v0, Lcom/badlogic/gdx/scenes/scene2d/ui/Value;->prefHeight:Lcom/badlogic/gdx/scenes/scene2d/ui/Value;

    .line 101
    new-instance v0, Lcom/badlogic/gdx/scenes/scene2d/ui/Value$5;

    invoke-direct {v0}, Lcom/badlogic/gdx/scenes/scene2d/ui/Value$5;-><init>()V

    sput-object v0, Lcom/badlogic/gdx/scenes/scene2d/ui/Value;->maxWidth:Lcom/badlogic/gdx/scenes/scene2d/ui/Value;

    .line 109
    new-instance v0, Lcom/badlogic/gdx/scenes/scene2d/ui/Value$6;

    invoke-direct {v0}, Lcom/badlogic/gdx/scenes/scene2d/ui/Value$6;-><init>()V

    sput-object v0, Lcom/badlogic/gdx/scenes/scene2d/ui/Value;->maxHeight:Lcom/badlogic/gdx/scenes/scene2d/ui/Value;

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .line 25
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static percentHeight(F)Lcom/badlogic/gdx/scenes/scene2d/ui/Value;
    .locals 1

    .line 127
    new-instance v0, Lcom/badlogic/gdx/scenes/scene2d/ui/Value$8;

    invoke-direct {v0, p0}, Lcom/badlogic/gdx/scenes/scene2d/ui/Value$8;-><init>(F)V

    return-object v0
.end method

.method public static percentHeight(FLcom/badlogic/gdx/scenes/scene2d/Actor;)Lcom/badlogic/gdx/scenes/scene2d/ui/Value;
    .locals 1

    if-eqz p1, :cond_0

    .line 147
    new-instance v0, Lcom/badlogic/gdx/scenes/scene2d/ui/Value$10;

    invoke-direct {v0, p1, p0}, Lcom/badlogic/gdx/scenes/scene2d/ui/Value$10;-><init>(Lcom/badlogic/gdx/scenes/scene2d/Actor;F)V

    return-object v0

    .line 146
    :cond_0
    new-instance p0, Ljava/lang/IllegalArgumentException;

    const-string p1, "actor cannot be null."

    invoke-direct {p0, p1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p0
.end method

.method public static percentWidth(F)Lcom/badlogic/gdx/scenes/scene2d/ui/Value;
    .locals 1

    .line 118
    new-instance v0, Lcom/badlogic/gdx/scenes/scene2d/ui/Value$7;

    invoke-direct {v0, p0}, Lcom/badlogic/gdx/scenes/scene2d/ui/Value$7;-><init>(F)V

    return-object v0
.end method

.method public static percentWidth(FLcom/badlogic/gdx/scenes/scene2d/Actor;)Lcom/badlogic/gdx/scenes/scene2d/ui/Value;
    .locals 1

    if-eqz p1, :cond_0

    .line 137
    new-instance v0, Lcom/badlogic/gdx/scenes/scene2d/ui/Value$9;

    invoke-direct {v0, p1, p0}, Lcom/badlogic/gdx/scenes/scene2d/ui/Value$9;-><init>(Lcom/badlogic/gdx/scenes/scene2d/Actor;F)V

    return-object v0

    .line 136
    :cond_0
    new-instance p0, Ljava/lang/IllegalArgumentException;

    const-string p1, "actor cannot be null."

    invoke-direct {p0, p1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p0
.end method


# virtual methods
.method public get()F
    .locals 1

    const/4 v0, 0x0

    .line 28
    invoke-virtual {p0, v0}, Lcom/badlogic/gdx/scenes/scene2d/ui/Value;->get(Lcom/badlogic/gdx/scenes/scene2d/Actor;)F

    move-result v0

    return v0
.end method

.method public abstract get(Lcom/badlogic/gdx/scenes/scene2d/Actor;)F
.end method
