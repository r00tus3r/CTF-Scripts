.class public Lcom/badlogic/gdx/utils/ReflectionPool;
.super Lcom/badlogic/gdx/utils/Pool;
.source "ReflectionPool.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Ljava/lang/Object;",
        ">",
        "Lcom/badlogic/gdx/utils/Pool<",
        "TT;>;"
    }
.end annotation


# instance fields
.field private final constructor:Lcom/badlogic/gdx/utils/reflect/Constructor;


# direct methods
.method public constructor <init>(Ljava/lang/Class;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Class<",
            "TT;>;)V"
        }
    .end annotation

    const/16 v0, 0x10

    const v1, 0x7fffffff

    .line 30
    invoke-direct {p0, p1, v0, v1}, Lcom/badlogic/gdx/utils/ReflectionPool;-><init>(Ljava/lang/Class;II)V

    return-void
.end method

.method public constructor <init>(Ljava/lang/Class;I)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Class<",
            "TT;>;I)V"
        }
    .end annotation

    const v0, 0x7fffffff

    .line 34
    invoke-direct {p0, p1, p2, v0}, Lcom/badlogic/gdx/utils/ReflectionPool;-><init>(Ljava/lang/Class;II)V

    return-void
.end method

.method public constructor <init>(Ljava/lang/Class;II)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Class<",
            "TT;>;II)V"
        }
    .end annotation

    .line 38
    invoke-direct {p0, p2, p3}, Lcom/badlogic/gdx/utils/Pool;-><init>(II)V

    .line 39
    invoke-direct {p0, p1}, Lcom/badlogic/gdx/utils/ReflectionPool;->findConstructor(Ljava/lang/Class;)Lcom/badlogic/gdx/utils/reflect/Constructor;

    move-result-object p2

    iput-object p2, p0, Lcom/badlogic/gdx/utils/ReflectionPool;->constructor:Lcom/badlogic/gdx/utils/reflect/Constructor;

    .line 40
    iget-object p2, p0, Lcom/badlogic/gdx/utils/ReflectionPool;->constructor:Lcom/badlogic/gdx/utils/reflect/Constructor;

    if-eqz p2, :cond_0

    return-void

    .line 41
    :cond_0
    new-instance p2, Ljava/lang/RuntimeException;

    new-instance p3, Ljava/lang/StringBuilder;

    invoke-direct {p3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v0, "Class cannot be created (missing no-arg constructor): "

    invoke-virtual {p3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p3, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-direct {p2, p1}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw p2
.end method

.method private findConstructor(Ljava/lang/Class;)Lcom/badlogic/gdx/utils/reflect/Constructor;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Class<",
            "TT;>;)",
            "Lcom/badlogic/gdx/utils/reflect/Constructor;"
        }
    .end annotation

    const/4 v0, 0x0

    .line 46
    :try_start_0
    move-object v1, v0

    check-cast v1, [Ljava/lang/Class;

    invoke-static {p1, v1}, Lcom/badlogic/gdx/utils/reflect/ClassReflection;->getConstructor(Ljava/lang/Class;[Ljava/lang/Class;)Lcom/badlogic/gdx/utils/reflect/Constructor;

    move-result-object p1
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    return-object p1

    .line 49
    :catch_0
    :try_start_1
    move-object v1, v0

    check-cast v1, [Ljava/lang/Class;

    invoke-static {p1, v1}, Lcom/badlogic/gdx/utils/reflect/ClassReflection;->getDeclaredConstructor(Ljava/lang/Class;[Ljava/lang/Class;)Lcom/badlogic/gdx/utils/reflect/Constructor;

    move-result-object p1

    const/4 v1, 0x1

    .line 50
    invoke-virtual {p1, v1}, Lcom/badlogic/gdx/utils/reflect/Constructor;->setAccessible(Z)V
    :try_end_1
    .catch Lcom/badlogic/gdx/utils/reflect/ReflectionException; {:try_start_1 .. :try_end_1} :catch_1

    return-object p1

    :catch_1
    return-object v0
.end method


# virtual methods
.method protected newObject()Ljava/lang/Object;
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()TT;"
        }
    .end annotation

    .line 60
    :try_start_0
    iget-object v0, p0, Lcom/badlogic/gdx/utils/ReflectionPool;->constructor:Lcom/badlogic/gdx/utils/reflect/Constructor;

    const/4 v1, 0x0

    check-cast v1, [Ljava/lang/Object;

    invoke-virtual {v0, v1}, Lcom/badlogic/gdx/utils/reflect/Constructor;->newInstance([Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    return-object v0

    :catch_0
    move-exception v0

    .line 62
    new-instance v1, Lcom/badlogic/gdx/utils/GdxRuntimeException;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Unable to create new instance: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v3, p0, Lcom/badlogic/gdx/utils/ReflectionPool;->constructor:Lcom/badlogic/gdx/utils/reflect/Constructor;

    invoke-virtual {v3}, Lcom/badlogic/gdx/utils/reflect/Constructor;->getDeclaringClass()Ljava/lang/Class;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2, v0}, Lcom/badlogic/gdx/utils/GdxRuntimeException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v1
.end method
