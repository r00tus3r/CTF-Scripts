.class public final Lcom/badlogic/gdx/physics/box2d/Box2D;
.super Ljava/lang/Object;
.source "Box2D.java"


# direct methods
.method private constructor <init>()V
    .locals 0

    .line 25
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static init()V
    .locals 2

    .line 32
    new-instance v0, Lcom/badlogic/gdx/utils/SharedLibraryLoader;

    invoke-direct {v0}, Lcom/badlogic/gdx/utils/SharedLibraryLoader;-><init>()V

    const-string v1, "gdx-box2d"

    invoke-virtual {v0, v1}, Lcom/badlogic/gdx/utils/SharedLibraryLoader;->load(Ljava/lang/String;)V

    return-void
.end method
