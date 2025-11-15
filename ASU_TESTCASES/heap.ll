; ModuleID = 'heap.bc'
source_filename = "drivers/conv/heap.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.kmem_cache = type opaque
%struct.anon = type { [9 x %struct.heap_entry_t*], %struct.page_t*, void (i32)*, void (i8*)* }
%struct.heap_entry_t = type { %struct.heap_entry_t*, %struct.chunk_t*, %struct.page_t* }
%struct.chunk_t = type { %struct.chunk_t* }
%struct.page_t = type { %struct.heap_entry_t*, %struct.page_t* }

@.str = private unnamed_addr constant [37 x i8] c"[CONV] size_to_index: size too large\00", align 1
@heap_cache = internal global %struct.kmem_cache* null, align 8, !dbg !0
@heap = dso_local global %struct.anon zeroinitializer, align 8, !dbg !47
@.str.1 = private unnamed_addr constant [10 x i8] c"conv_heap\00", align 1
@.str.2 = private unnamed_addr constant [34 x i8] c"[CONV] free_chunk: corrupted heap\00", align 1
@kmalloc_caches = external global [3 x [14 x %struct.kmem_cache*]], align 16
@.str.3 = private unnamed_addr constant [23 x i8] c"./include/linux/slab.h\00", align 1

; Function Attrs: noinline noredzone nounwind optnone
define dso_local i32 @size_to_index(i32 noundef %0) #0 !dbg !75 {
  %2 = alloca i32, align 4
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  store i32 %0, i32* %3, align 4
  call void @llvm.dbg.declare(metadata i32* %3, metadata !79, metadata !DIExpression()), !dbg !80
  %5 = load i32, i32* %3, align 4, !dbg !81
  %6 = zext i32 %5 to i64, !dbg !81
  %7 = icmp ugt i64 %6, 4096, !dbg !83
  br i1 %7, label %8, label %9, !dbg !84

8:                                                ; preds = %1
  call void (i8*, ...) @panic(i8* noundef getelementptr inbounds ([37 x i8], [37 x i8]* @.str, i64 0, i64 0)) #9, !dbg !85
  unreachable, !dbg !85

9:                                                ; preds = %1
  %10 = load i32, i32* %3, align 4, !dbg !86
  %11 = icmp eq i32 %10, 0, !dbg !88
  br i1 %11, label %12, label %13, !dbg !89

12:                                               ; preds = %9
  store i32 0, i32* %2, align 4, !dbg !90
  br label %35, !dbg !90

13:                                               ; preds = %9
  call void @llvm.dbg.declare(metadata i32* %4, metadata !91, metadata !DIExpression()), !dbg !92
  %14 = load i32, i32* %3, align 4, !dbg !93
  %15 = call i32 @llvm.ctlz.i32(i32 %14, i1 true), !dbg !94
  %16 = sub i32 32, %15, !dbg !95
  store i32 %16, i32* %4, align 4, !dbg !92
  %17 = load i32, i32* %4, align 4, !dbg !96
  %18 = sub i32 %17, 1, !dbg !98
  %19 = shl i32 1, %18, !dbg !99
  %20 = load i32, i32* %3, align 4, !dbg !100
  %21 = icmp eq i32 %19, %20, !dbg !101
  br i1 %21, label %22, label %25, !dbg !102

22:                                               ; preds = %13
  %23 = load i32, i32* %4, align 4, !dbg !103
  %24 = add i32 %23, -1, !dbg !103
  store i32 %24, i32* %4, align 4, !dbg !103
  br label %25, !dbg !104

25:                                               ; preds = %22, %13
  %26 = load i32, i32* %4, align 4, !dbg !105
  %27 = sub i32 %26, 4, !dbg !106
  %28 = icmp slt i32 %27, 0, !dbg !107
  br i1 %28, label %29, label %30, !dbg !105

29:                                               ; preds = %25
  br label %33, !dbg !105

30:                                               ; preds = %25
  %31 = load i32, i32* %4, align 4, !dbg !108
  %32 = sub i32 %31, 4, !dbg !109
  br label %33, !dbg !105

33:                                               ; preds = %30, %29
  %34 = phi i32 [ 0, %29 ], [ %32, %30 ], !dbg !105
  store i32 %34, i32* %2, align 4, !dbg !110
  br label %35, !dbg !110

35:                                               ; preds = %33, %12
  %36 = load i32, i32* %2, align 4, !dbg !111
  ret i32 %36, !dbg !111
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: noredzone noreturn
declare void @panic(i8* noundef, ...) #2

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.ctlz.i32(i32, i1 immarg) #1

; Function Attrs: noinline noredzone nounwind optnone
define dso_local i32 @index_to_size(i32 noundef %0) #0 !dbg !112 {
  %2 = alloca i32, align 4
  store i32 %0, i32* %2, align 4
  call void @llvm.dbg.declare(metadata i32* %2, metadata !113, metadata !DIExpression()), !dbg !114
  %3 = load i32, i32* %2, align 4, !dbg !115
  %4 = add i32 %3, 4, !dbg !116
  %5 = shl i32 1, %4, !dbg !117
  ret i32 %5, !dbg !118
}

; Function Attrs: noinline noredzone nounwind optnone
define dso_local void @chunk_page(%struct.heap_entry_t* noundef %0, %struct.page_t* noundef %1, i32 noundef %2) #0 !dbg !119 {
  %4 = alloca %struct.heap_entry_t*, align 8
  %5 = alloca %struct.page_t*, align 8
  %6 = alloca i32, align 4
  %7 = alloca i8*, align 8
  %8 = alloca %struct.chunk_t*, align 8
  store %struct.heap_entry_t* %0, %struct.heap_entry_t** %4, align 8
  call void @llvm.dbg.declare(metadata %struct.heap_entry_t** %4, metadata !122, metadata !DIExpression()), !dbg !123
  store %struct.page_t* %1, %struct.page_t** %5, align 8
  call void @llvm.dbg.declare(metadata %struct.page_t** %5, metadata !124, metadata !DIExpression()), !dbg !125
  store i32 %2, i32* %6, align 4
  call void @llvm.dbg.declare(metadata i32* %6, metadata !126, metadata !DIExpression()), !dbg !127
  call void @llvm.dbg.declare(metadata i8** %7, metadata !128, metadata !DIExpression()), !dbg !130
  %9 = load %struct.page_t*, %struct.page_t** %5, align 8, !dbg !131
  %10 = bitcast %struct.page_t* %9 to i8*, !dbg !132
  %11 = getelementptr i8, i8* %10, i64 4096, !dbg !133
  %12 = load i32, i32* %6, align 4, !dbg !134
  %13 = zext i32 %12 to i64, !dbg !135
  %14 = sub i64 0, %13, !dbg !135
  %15 = getelementptr i8, i8* %11, i64 %14, !dbg !135
  store i8* %15, i8** %7, align 8, !dbg !130
  br label %16, !dbg !136

16:                                               ; preds = %33, %3
  call void @llvm.dbg.declare(metadata %struct.chunk_t** %8, metadata !137, metadata !DIExpression()), !dbg !140
  %17 = load i8*, i8** %7, align 8, !dbg !141
  %18 = bitcast i8* %17 to %struct.chunk_t*, !dbg !142
  store %struct.chunk_t* %18, %struct.chunk_t** %8, align 8, !dbg !140
  %19 = load %struct.heap_entry_t*, %struct.heap_entry_t** %4, align 8, !dbg !143
  %20 = getelementptr inbounds %struct.heap_entry_t, %struct.heap_entry_t* %19, i32 0, i32 1, !dbg !144
  %21 = load %struct.chunk_t*, %struct.chunk_t** %20, align 8, !dbg !144
  %22 = load %struct.chunk_t*, %struct.chunk_t** %8, align 8, !dbg !145
  %23 = getelementptr inbounds %struct.chunk_t, %struct.chunk_t* %22, i32 0, i32 0, !dbg !146
  store %struct.chunk_t* %21, %struct.chunk_t** %23, align 8, !dbg !147
  %24 = load %struct.chunk_t*, %struct.chunk_t** %8, align 8, !dbg !148
  %25 = load %struct.heap_entry_t*, %struct.heap_entry_t** %4, align 8, !dbg !149
  %26 = getelementptr inbounds %struct.heap_entry_t, %struct.heap_entry_t* %25, i32 0, i32 1, !dbg !150
  store %struct.chunk_t* %24, %struct.chunk_t** %26, align 8, !dbg !151
  %27 = load i8*, i8** %7, align 8, !dbg !152
  %28 = load %struct.page_t*, %struct.page_t** %5, align 8, !dbg !154
  %29 = bitcast %struct.page_t* %28 to i8*, !dbg !155
  %30 = icmp eq i8* %27, %29, !dbg !156
  br i1 %30, label %31, label %32, !dbg !157

31:                                               ; preds = %16
  br label %39, !dbg !158

32:                                               ; preds = %16
  br label %33, !dbg !159

33:                                               ; preds = %32
  %34 = load i32, i32* %6, align 4, !dbg !160
  %35 = load i8*, i8** %7, align 8, !dbg !161
  %36 = zext i32 %34 to i64, !dbg !161
  %37 = sub i64 0, %36, !dbg !161
  %38 = getelementptr i8, i8* %35, i64 %37, !dbg !161
  store i8* %38, i8** %7, align 8, !dbg !161
  br label %16, !dbg !162, !llvm.loop !163

39:                                               ; preds = %31
  ret void, !dbg !166
}

; Function Attrs: noinline noredzone nounwind optnone
define dso_local void @cache_pages() #0 !dbg !167 {
  %1 = alloca i32, align 4
  %2 = alloca %struct.page_t*, align 8
  call void @llvm.dbg.declare(metadata i32* %1, metadata !170, metadata !DIExpression()), !dbg !172
  store i32 0, i32* %1, align 4, !dbg !172
  br label %3, !dbg !173

3:                                                ; preds = %14, %0
  %4 = load i32, i32* %1, align 4, !dbg !174
  %5 = icmp slt i32 %4, 8, !dbg !176
  br i1 %5, label %6, label %17, !dbg !177

6:                                                ; preds = %3
  call void @llvm.dbg.declare(metadata %struct.page_t** %2, metadata !178, metadata !DIExpression()), !dbg !180
  %7 = load %struct.kmem_cache*, %struct.kmem_cache** @heap_cache, align 8, !dbg !181
  %8 = call i8* @kmem_cache_zalloc(%struct.kmem_cache* noundef %7, i32 noundef 3264) #10, !dbg !182
  %9 = bitcast i8* %8 to %struct.page_t*, !dbg !182
  store %struct.page_t* %9, %struct.page_t** %2, align 8, !dbg !180
  %10 = load %struct.page_t*, %struct.page_t** getelementptr inbounds (%struct.anon, %struct.anon* @heap, i32 0, i32 1), align 8, !dbg !183
  %11 = load %struct.page_t*, %struct.page_t** %2, align 8, !dbg !184
  %12 = getelementptr inbounds %struct.page_t, %struct.page_t* %11, i32 0, i32 1, !dbg !185
  store %struct.page_t* %10, %struct.page_t** %12, align 8, !dbg !186
  %13 = load %struct.page_t*, %struct.page_t** %2, align 8, !dbg !187
  store %struct.page_t* %13, %struct.page_t** getelementptr inbounds (%struct.anon, %struct.anon* @heap, i32 0, i32 1), align 8, !dbg !188
  br label %14, !dbg !189

14:                                               ; preds = %6
  %15 = load i32, i32* %1, align 4, !dbg !190
  %16 = add i32 %15, 1, !dbg !190
  store i32 %16, i32* %1, align 4, !dbg !190
  br label %3, !dbg !191, !llvm.loop !192

17:                                               ; preds = %3
  ret void, !dbg !194
}

; Function Attrs: noinline noredzone nounwind optnone
define internal i8* @kmem_cache_zalloc(%struct.kmem_cache* noundef %0, i32 noundef %1) #0 !dbg !195 {
  %3 = alloca %struct.kmem_cache*, align 8
  %4 = alloca i32, align 4
  store %struct.kmem_cache* %0, %struct.kmem_cache** %3, align 8
  call void @llvm.dbg.declare(metadata %struct.kmem_cache** %3, metadata !198, metadata !DIExpression()), !dbg !199
  store i32 %1, i32* %4, align 4
  call void @llvm.dbg.declare(metadata i32* %4, metadata !200, metadata !DIExpression()), !dbg !201
  %5 = load %struct.kmem_cache*, %struct.kmem_cache** %3, align 8, !dbg !202
  %6 = load i32, i32* %4, align 4, !dbg !203
  %7 = or i32 %6, 256, !dbg !204
  %8 = call noalias align 8 i8* @kmem_cache_alloc(%struct.kmem_cache* noundef %5, i32 noundef %7) #10, !dbg !205
  ret i8* %8, !dbg !206
}

; Function Attrs: noinline noredzone nounwind optnone
define dso_local void @init_heap() #0 !dbg !207 {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  %3 = alloca %struct.heap_entry_t*, align 8
  %4 = alloca %struct.heap_entry_t*, align 8
  %5 = call %struct.kmem_cache* @kmem_cache_create(i8* noundef getelementptr inbounds ([10 x i8], [10 x i8]* @.str.1, i64 0, i64 0), i32 noundef 4096, i32 noundef 4096, i32 noundef 8192, void (i8*)* noundef null) #10, !dbg !208
  store %struct.kmem_cache* %5, %struct.kmem_cache** @heap_cache, align 8, !dbg !209
  store void (i32)* null, void (i32)** getelementptr inbounds (%struct.anon, %struct.anon* @heap, i32 0, i32 2), align 8, !dbg !210
  store void (i8*)* null, void (i8*)** getelementptr inbounds (%struct.anon, %struct.anon* @heap, i32 0, i32 3), align 8, !dbg !211
  call void @llvm.dbg.declare(metadata i32* %1, metadata !212, metadata !DIExpression()), !dbg !214
  store i32 0, i32* %1, align 4, !dbg !214
  br label %6, !dbg !215

6:                                                ; preds = %31, %0
  %7 = load i32, i32* %1, align 4, !dbg !216
  %8 = icmp slt i32 %7, 9, !dbg !218
  br i1 %8, label %9, label %34, !dbg !219

9:                                                ; preds = %6
  call void @llvm.dbg.declare(metadata i32* %2, metadata !220, metadata !DIExpression()), !dbg !223
  store i32 0, i32* %2, align 4, !dbg !223
  br label %10, !dbg !224

10:                                               ; preds = %27, %9
  %11 = load i32, i32* %2, align 4, !dbg !225
  %12 = icmp slt i32 %11, 1, !dbg !227
  br i1 %12, label %13, label %30, !dbg !228

13:                                               ; preds = %10
  call void @llvm.dbg.declare(metadata %struct.heap_entry_t** %3, metadata !229, metadata !DIExpression()), !dbg !231
  %14 = load i32, i32* %1, align 4, !dbg !232
  %15 = sext i32 %14 to i64, !dbg !233
  %16 = getelementptr [9 x %struct.heap_entry_t*], [9 x %struct.heap_entry_t*]* getelementptr inbounds (%struct.anon, %struct.anon* @heap, i32 0, i32 0), i64 0, i64 %15, !dbg !233
  %17 = load %struct.heap_entry_t*, %struct.heap_entry_t** %16, align 8, !dbg !233
  store %struct.heap_entry_t* %17, %struct.heap_entry_t** %3, align 8, !dbg !231
  call void @llvm.dbg.declare(metadata %struct.heap_entry_t** %4, metadata !234, metadata !DIExpression()), !dbg !235
  %18 = load i32, i32* %1, align 4, !dbg !236
  %19 = call %struct.heap_entry_t* @alloc_entry(i32 noundef %18) #10, !dbg !237
  store %struct.heap_entry_t* %19, %struct.heap_entry_t** %4, align 8, !dbg !235
  %20 = load %struct.heap_entry_t*, %struct.heap_entry_t** %3, align 8, !dbg !238
  %21 = load %struct.heap_entry_t*, %struct.heap_entry_t** %4, align 8, !dbg !239
  %22 = getelementptr inbounds %struct.heap_entry_t, %struct.heap_entry_t* %21, i32 0, i32 0, !dbg !240
  store %struct.heap_entry_t* %20, %struct.heap_entry_t** %22, align 8, !dbg !241
  %23 = load %struct.heap_entry_t*, %struct.heap_entry_t** %4, align 8, !dbg !242
  %24 = load i32, i32* %1, align 4, !dbg !243
  %25 = sext i32 %24 to i64, !dbg !244
  %26 = getelementptr [9 x %struct.heap_entry_t*], [9 x %struct.heap_entry_t*]* getelementptr inbounds (%struct.anon, %struct.anon* @heap, i32 0, i32 0), i64 0, i64 %25, !dbg !244
  store %struct.heap_entry_t* %23, %struct.heap_entry_t** %26, align 8, !dbg !245
  br label %27, !dbg !246

27:                                               ; preds = %13
  %28 = load i32, i32* %2, align 4, !dbg !247
  %29 = add i32 %28, 1, !dbg !247
  store i32 %29, i32* %2, align 4, !dbg !247
  br label %10, !dbg !248, !llvm.loop !249

30:                                               ; preds = %10
  br label %31, !dbg !251

31:                                               ; preds = %30
  %32 = load i32, i32* %1, align 4, !dbg !252
  %33 = add i32 %32, 1, !dbg !252
  store i32 %33, i32* %1, align 4, !dbg !252
  br label %6, !dbg !253, !llvm.loop !254

34:                                               ; preds = %6
  call void @cache_pages() #10, !dbg !256
  ret void, !dbg !257
}

; Function Attrs: noredzone
declare %struct.kmem_cache* @kmem_cache_create(i8* noundef, i32 noundef, i32 noundef, i32 noundef, void (i8*)* noundef) #3

; Function Attrs: noinline noredzone nounwind optnone
define dso_local %struct.heap_entry_t* @alloc_entry(i32 noundef %0) #0 !dbg !258 {
  %2 = alloca i32, align 4
  %3 = alloca %struct.page_t*, align 8
  %4 = alloca %struct.heap_entry_t*, align 8
  store i32 %0, i32* %2, align 4
  call void @llvm.dbg.declare(metadata i32* %2, metadata !261, metadata !DIExpression()), !dbg !262
  call void @llvm.dbg.declare(metadata %struct.page_t** %3, metadata !263, metadata !DIExpression()), !dbg !264
  %5 = load %struct.page_t*, %struct.page_t** getelementptr inbounds (%struct.anon, %struct.anon* @heap, i32 0, i32 1), align 8, !dbg !265
  %6 = icmp ne %struct.page_t* %5, null, !dbg !267
  br i1 %6, label %7, label %12, !dbg !268

7:                                                ; preds = %1
  %8 = load %struct.page_t*, %struct.page_t** getelementptr inbounds (%struct.anon, %struct.anon* @heap, i32 0, i32 1), align 8, !dbg !269
  store %struct.page_t* %8, %struct.page_t** %3, align 8, !dbg !271
  %9 = load %struct.page_t*, %struct.page_t** getelementptr inbounds (%struct.anon, %struct.anon* @heap, i32 0, i32 1), align 8, !dbg !272
  %10 = getelementptr inbounds %struct.page_t, %struct.page_t* %9, i32 0, i32 1, !dbg !273
  %11 = load %struct.page_t*, %struct.page_t** %10, align 8, !dbg !273
  store %struct.page_t* %11, %struct.page_t** getelementptr inbounds (%struct.anon, %struct.anon* @heap, i32 0, i32 1), align 8, !dbg !274
  br label %16, !dbg !275

12:                                               ; preds = %1
  %13 = load %struct.kmem_cache*, %struct.kmem_cache** @heap_cache, align 8, !dbg !276
  %14 = call i8* @kmem_cache_zalloc(%struct.kmem_cache* noundef %13, i32 noundef 3264) #10, !dbg !278
  %15 = bitcast i8* %14 to %struct.page_t*, !dbg !278
  store %struct.page_t* %15, %struct.page_t** %3, align 8, !dbg !279
  call void @cache_pages() #10, !dbg !280
  br label %16

16:                                               ; preds = %12, %7
  call void @llvm.dbg.declare(metadata %struct.heap_entry_t** %4, metadata !281, metadata !DIExpression()), !dbg !282
  %17 = call noalias i8* @kzalloc(i64 noundef 24, i32 noundef 3264) #11, !dbg !283
  %18 = bitcast i8* %17 to %struct.heap_entry_t*, !dbg !283
  store %struct.heap_entry_t* %18, %struct.heap_entry_t** %4, align 8, !dbg !282
  %19 = load %struct.page_t*, %struct.page_t** %3, align 8, !dbg !284
  %20 = load %struct.heap_entry_t*, %struct.heap_entry_t** %4, align 8, !dbg !285
  %21 = getelementptr inbounds %struct.heap_entry_t, %struct.heap_entry_t* %20, i32 0, i32 2, !dbg !286
  store %struct.page_t* %19, %struct.page_t** %21, align 8, !dbg !287
  %22 = load %struct.heap_entry_t*, %struct.heap_entry_t** %4, align 8, !dbg !288
  %23 = load %struct.page_t*, %struct.page_t** %3, align 8, !dbg !289
  %24 = load i32, i32* %2, align 4, !dbg !290
  %25 = call i32 @index_to_size(i32 noundef %24) #10, !dbg !291
  call void @chunk_page(%struct.heap_entry_t* noundef %22, %struct.page_t* noundef %23, i32 noundef %25) #10, !dbg !292
  %26 = load %struct.heap_entry_t*, %struct.heap_entry_t** %4, align 8, !dbg !293
  ret %struct.heap_entry_t* %26, !dbg !294
}

; Function Attrs: noinline noredzone nounwind optnone
define dso_local void @free_unused_pages() #0 !dbg !295 {
  %1 = alloca %struct.page_t*, align 8
  %2 = alloca %struct.page_t*, align 8
  call void @llvm.dbg.declare(metadata %struct.page_t** %1, metadata !296, metadata !DIExpression()), !dbg !298
  %3 = load %struct.page_t*, %struct.page_t** getelementptr inbounds (%struct.anon, %struct.anon* @heap, i32 0, i32 1), align 8, !dbg !299
  store %struct.page_t* %3, %struct.page_t** %1, align 8, !dbg !298
  br label %4, !dbg !300

4:                                                ; preds = %7, %0
  %5 = load %struct.page_t*, %struct.page_t** %1, align 8, !dbg !301
  %6 = icmp ne %struct.page_t* %5, null, !dbg !303
  br i1 %6, label %7, label %14, !dbg !304

7:                                                ; preds = %4
  call void @llvm.dbg.declare(metadata %struct.page_t** %2, metadata !305, metadata !DIExpression()), !dbg !307
  %8 = load %struct.page_t*, %struct.page_t** %1, align 8, !dbg !308
  %9 = getelementptr inbounds %struct.page_t, %struct.page_t* %8, i32 0, i32 1, !dbg !309
  %10 = load %struct.page_t*, %struct.page_t** %9, align 8, !dbg !309
  store %struct.page_t* %10, %struct.page_t** %2, align 8, !dbg !307
  %11 = load %struct.page_t*, %struct.page_t** %1, align 8, !dbg !310
  %12 = bitcast %struct.page_t* %11 to i8*, !dbg !310
  call void @kfree(i8* noundef %12) #10, !dbg !311
  %13 = load %struct.page_t*, %struct.page_t** %2, align 8, !dbg !312
  store %struct.page_t* %13, %struct.page_t** %1, align 8, !dbg !313
  br label %4, !dbg !314, !llvm.loop !315

14:                                               ; preds = %4
  ret void, !dbg !317
}

; Function Attrs: noredzone
declare void @kfree(i8* noundef) #3

; Function Attrs: noinline noredzone nounwind optnone
define dso_local void @free_entry(i32 noundef %0) #0 !dbg !318 {
  %2 = alloca i32, align 4
  %3 = alloca %struct.heap_entry_t*, align 8
  %4 = alloca %struct.heap_entry_t*, align 8
  store i32 %0, i32* %2, align 4
  call void @llvm.dbg.declare(metadata i32* %2, metadata !321, metadata !DIExpression()), !dbg !322
  call void @llvm.dbg.declare(metadata %struct.heap_entry_t** %3, metadata !323, metadata !DIExpression()), !dbg !325
  %5 = load i32, i32* %2, align 4, !dbg !326
  %6 = sext i32 %5 to i64, !dbg !327
  %7 = getelementptr [9 x %struct.heap_entry_t*], [9 x %struct.heap_entry_t*]* getelementptr inbounds (%struct.anon, %struct.anon* @heap, i32 0, i32 0), i64 0, i64 %6, !dbg !327
  %8 = load %struct.heap_entry_t*, %struct.heap_entry_t** %7, align 8, !dbg !327
  store %struct.heap_entry_t* %8, %struct.heap_entry_t** %3, align 8, !dbg !325
  br label %9, !dbg !328

9:                                                ; preds = %12, %1
  %10 = load %struct.heap_entry_t*, %struct.heap_entry_t** %3, align 8, !dbg !329
  %11 = icmp ne %struct.heap_entry_t* %10, null, !dbg !331
  br i1 %11, label %12, label %23, !dbg !332

12:                                               ; preds = %9
  %13 = load %struct.heap_entry_t*, %struct.heap_entry_t** %3, align 8, !dbg !333
  %14 = getelementptr inbounds %struct.heap_entry_t, %struct.heap_entry_t* %13, i32 0, i32 2, !dbg !335
  %15 = load %struct.page_t*, %struct.page_t** %14, align 8, !dbg !335
  %16 = bitcast %struct.page_t* %15 to i8*, !dbg !333
  call void @kfree(i8* noundef %16) #10, !dbg !336
  call void @llvm.dbg.declare(metadata %struct.heap_entry_t** %4, metadata !337, metadata !DIExpression()), !dbg !338
  %17 = load %struct.heap_entry_t*, %struct.heap_entry_t** %3, align 8, !dbg !339
  %18 = getelementptr inbounds %struct.heap_entry_t, %struct.heap_entry_t* %17, i32 0, i32 0, !dbg !340
  %19 = load %struct.heap_entry_t*, %struct.heap_entry_t** %18, align 8, !dbg !340
  store %struct.heap_entry_t* %19, %struct.heap_entry_t** %4, align 8, !dbg !338
  %20 = load %struct.heap_entry_t*, %struct.heap_entry_t** %3, align 8, !dbg !341
  %21 = bitcast %struct.heap_entry_t* %20 to i8*, !dbg !341
  call void @kfree(i8* noundef %21) #10, !dbg !342
  %22 = load %struct.heap_entry_t*, %struct.heap_entry_t** %4, align 8, !dbg !343
  store %struct.heap_entry_t* %22, %struct.heap_entry_t** %3, align 8, !dbg !344
  br label %9, !dbg !345, !llvm.loop !346

23:                                               ; preds = %9
  ret void, !dbg !348
}

; Function Attrs: noinline noredzone nounwind optnone
define dso_local void @free_heap() #0 !dbg !349 {
  %1 = alloca i32, align 4
  call void @free_unused_pages() #10, !dbg !350
  call void @llvm.dbg.declare(metadata i32* %1, metadata !351, metadata !DIExpression()), !dbg !353
  store i32 0, i32* %1, align 4, !dbg !353
  br label %2, !dbg !354

2:                                                ; preds = %7, %0
  %3 = load i32, i32* %1, align 4, !dbg !355
  %4 = icmp slt i32 %3, 9, !dbg !357
  br i1 %4, label %5, label %10, !dbg !358

5:                                                ; preds = %2
  %6 = load i32, i32* %1, align 4, !dbg !359
  call void @free_entry(i32 noundef %6) #10, !dbg !361
  br label %7, !dbg !362

7:                                                ; preds = %5
  %8 = load i32, i32* %1, align 4, !dbg !363
  %9 = add i32 %8, 1, !dbg !363
  store i32 %9, i32* %1, align 4, !dbg !363
  br label %2, !dbg !364, !llvm.loop !365

10:                                               ; preds = %2
  %11 = load %struct.kmem_cache*, %struct.kmem_cache** @heap_cache, align 8, !dbg !367
  call void @kmem_cache_destroy(%struct.kmem_cache* noundef %11) #10, !dbg !368
  ret void, !dbg !369
}

; Function Attrs: noredzone
declare void @kmem_cache_destroy(%struct.kmem_cache* noundef) #3

; Function Attrs: noinline noredzone nounwind optnone allocsize(0)
define internal noalias i8* @kzalloc(i64 noundef %0, i32 noundef %1) #4 !dbg !370 {
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  %5 = alloca i64, align 8
  %6 = alloca i32, align 4
  %7 = alloca i64, align 8
  %8 = alloca i8, align 1
  %9 = alloca i8*, align 8
  %10 = alloca i64, align 8
  %11 = alloca i32, align 4
  %12 = alloca i32, align 4
  %13 = alloca i64, align 8
  %14 = alloca i32, align 4
  store i64 %0, i64* %13, align 8
  call void @llvm.dbg.declare(metadata i64* %13, metadata !377, metadata !DIExpression()), !dbg !378
  store i32 %1, i32* %14, align 4
  call void @llvm.dbg.declare(metadata i32* %14, metadata !379, metadata !DIExpression()), !dbg !380
  %15 = load i64, i64* %13, align 8, !dbg !381
  %16 = load i32, i32* %14, align 4, !dbg !382
  %17 = or i32 %16, 256, !dbg !383
  store i64 %15, i64* %10, align 8
  call void @llvm.dbg.declare(metadata i64* %10, metadata !384, metadata !DIExpression()) #12, !dbg !386
  store i32 %17, i32* %11, align 4
  call void @llvm.dbg.declare(metadata i32* %11, metadata !388, metadata !DIExpression()) #12, !dbg !389
  %18 = load i64, i64* %10, align 8, !dbg !390
  %19 = call i1 @llvm.is.constant.i64(i64 %18) #12, !dbg !392
  br i1 %19, label %20, label %163, !dbg !393

20:                                               ; preds = %2
  %21 = load i64, i64* %10, align 8, !dbg !394
  %22 = icmp ne i64 %21, 0, !dbg !394
  br i1 %22, label %23, label %163, !dbg !395

23:                                               ; preds = %20
  call void @llvm.dbg.declare(metadata i32* %12, metadata !396, metadata !DIExpression()) #12, !dbg !398
  %24 = load i64, i64* %10, align 8, !dbg !399
  %25 = icmp ugt i64 %24, 8192, !dbg !401
  br i1 %25, label %26, label %30, !dbg !402

26:                                               ; preds = %23
  %27 = load i64, i64* %10, align 8, !dbg !403
  %28 = load i32, i32* %11, align 4, !dbg !404
  %29 = call noalias align 4096 i8* @kmalloc_large(i64 noundef %27, i32 noundef %28) #13, !dbg !405
  store i8* %29, i8** %9, align 8, !dbg !406
  br label %167, !dbg !406

30:                                               ; preds = %23
  %31 = load i64, i64* %10, align 8, !dbg !407
  store i64 %31, i64* %7, align 8
  call void @llvm.dbg.declare(metadata i64* %7, metadata !408, metadata !DIExpression()) #12, !dbg !414
  store i8 1, i8* %8, align 1
  call void @llvm.dbg.declare(metadata i8* %8, metadata !416, metadata !DIExpression()) #12, !dbg !417
  %32 = load i64, i64* %7, align 8, !dbg !418
  %33 = icmp ne i64 %32, 0, !dbg !418
  br i1 %33, label %35, label %34, !dbg !420

34:                                               ; preds = %30
  store i32 0, i32* %6, align 4, !dbg !421
  br label %134, !dbg !421

35:                                               ; preds = %30
  %36 = load i64, i64* %7, align 8, !dbg !422
  %37 = icmp ule i64 %36, 8, !dbg !424
  br i1 %37, label %38, label %39, !dbg !425

38:                                               ; preds = %35
  store i32 3, i32* %6, align 4, !dbg !426
  br label %134, !dbg !426

39:                                               ; preds = %35
  %40 = load i64, i64* %7, align 8, !dbg !427
  %41 = icmp ugt i64 %40, 64, !dbg !429
  br i1 %41, label %42, label %46, !dbg !430

42:                                               ; preds = %39
  %43 = load i64, i64* %7, align 8, !dbg !431
  %44 = icmp ule i64 %43, 96, !dbg !432
  br i1 %44, label %45, label %46, !dbg !433

45:                                               ; preds = %42
  store i32 1, i32* %6, align 4, !dbg !434
  br label %134, !dbg !434

46:                                               ; preds = %42, %39
  %47 = load i64, i64* %7, align 8, !dbg !435
  %48 = icmp ugt i64 %47, 128, !dbg !437
  br i1 %48, label %49, label %53, !dbg !438

49:                                               ; preds = %46
  %50 = load i64, i64* %7, align 8, !dbg !439
  %51 = icmp ule i64 %50, 192, !dbg !440
  br i1 %51, label %52, label %53, !dbg !441

52:                                               ; preds = %49
  store i32 2, i32* %6, align 4, !dbg !442
  br label %134, !dbg !442

53:                                               ; preds = %49, %46
  %54 = load i64, i64* %7, align 8, !dbg !443
  %55 = icmp ule i64 %54, 8, !dbg !445
  br i1 %55, label %56, label %57, !dbg !446

56:                                               ; preds = %53
  store i32 3, i32* %6, align 4, !dbg !447
  br label %134, !dbg !447

57:                                               ; preds = %53
  %58 = load i64, i64* %7, align 8, !dbg !448
  %59 = icmp ule i64 %58, 16, !dbg !450
  br i1 %59, label %60, label %61, !dbg !451

60:                                               ; preds = %57
  store i32 4, i32* %6, align 4, !dbg !452
  br label %134, !dbg !452

61:                                               ; preds = %57
  %62 = load i64, i64* %7, align 8, !dbg !453
  %63 = icmp ule i64 %62, 32, !dbg !455
  br i1 %63, label %64, label %65, !dbg !456

64:                                               ; preds = %61
  store i32 5, i32* %6, align 4, !dbg !457
  br label %134, !dbg !457

65:                                               ; preds = %61
  %66 = load i64, i64* %7, align 8, !dbg !458
  %67 = icmp ule i64 %66, 64, !dbg !460
  br i1 %67, label %68, label %69, !dbg !461

68:                                               ; preds = %65
  store i32 6, i32* %6, align 4, !dbg !462
  br label %134, !dbg !462

69:                                               ; preds = %65
  %70 = load i64, i64* %7, align 8, !dbg !463
  %71 = icmp ule i64 %70, 128, !dbg !465
  br i1 %71, label %72, label %73, !dbg !466

72:                                               ; preds = %69
  store i32 7, i32* %6, align 4, !dbg !467
  br label %134, !dbg !467

73:                                               ; preds = %69
  %74 = load i64, i64* %7, align 8, !dbg !468
  %75 = icmp ule i64 %74, 256, !dbg !470
  br i1 %75, label %76, label %77, !dbg !471

76:                                               ; preds = %73
  store i32 8, i32* %6, align 4, !dbg !472
  br label %134, !dbg !472

77:                                               ; preds = %73
  %78 = load i64, i64* %7, align 8, !dbg !473
  %79 = icmp ule i64 %78, 512, !dbg !475
  br i1 %79, label %80, label %81, !dbg !476

80:                                               ; preds = %77
  store i32 9, i32* %6, align 4, !dbg !477
  br label %134, !dbg !477

81:                                               ; preds = %77
  %82 = load i64, i64* %7, align 8, !dbg !478
  %83 = icmp ule i64 %82, 1024, !dbg !480
  br i1 %83, label %84, label %85, !dbg !481

84:                                               ; preds = %81
  store i32 10, i32* %6, align 4, !dbg !482
  br label %134, !dbg !482

85:                                               ; preds = %81
  %86 = load i64, i64* %7, align 8, !dbg !483
  %87 = icmp ule i64 %86, 2048, !dbg !485
  br i1 %87, label %88, label %89, !dbg !486

88:                                               ; preds = %85
  store i32 11, i32* %6, align 4, !dbg !487
  br label %134, !dbg !487

89:                                               ; preds = %85
  %90 = load i64, i64* %7, align 8, !dbg !488
  %91 = icmp ule i64 %90, 4096, !dbg !490
  br i1 %91, label %92, label %93, !dbg !491

92:                                               ; preds = %89
  store i32 12, i32* %6, align 4, !dbg !492
  br label %134, !dbg !492

93:                                               ; preds = %89
  %94 = load i64, i64* %7, align 8, !dbg !493
  %95 = icmp ule i64 %94, 8192, !dbg !495
  br i1 %95, label %96, label %97, !dbg !496

96:                                               ; preds = %93
  store i32 13, i32* %6, align 4, !dbg !497
  br label %134, !dbg !497

97:                                               ; preds = %93
  %98 = load i64, i64* %7, align 8, !dbg !498
  %99 = icmp ule i64 %98, 16384, !dbg !500
  br i1 %99, label %100, label %101, !dbg !501

100:                                              ; preds = %97
  store i32 14, i32* %6, align 4, !dbg !502
  br label %134, !dbg !502

101:                                              ; preds = %97
  %102 = load i64, i64* %7, align 8, !dbg !503
  %103 = icmp ule i64 %102, 32768, !dbg !505
  br i1 %103, label %104, label %105, !dbg !506

104:                                              ; preds = %101
  store i32 15, i32* %6, align 4, !dbg !507
  br label %134, !dbg !507

105:                                              ; preds = %101
  %106 = load i64, i64* %7, align 8, !dbg !508
  %107 = icmp ule i64 %106, 65536, !dbg !510
  br i1 %107, label %108, label %109, !dbg !511

108:                                              ; preds = %105
  store i32 16, i32* %6, align 4, !dbg !512
  br label %134, !dbg !512

109:                                              ; preds = %105
  %110 = load i64, i64* %7, align 8, !dbg !513
  %111 = icmp ule i64 %110, 131072, !dbg !515
  br i1 %111, label %112, label %113, !dbg !516

112:                                              ; preds = %109
  store i32 17, i32* %6, align 4, !dbg !517
  br label %134, !dbg !517

113:                                              ; preds = %109
  %114 = load i64, i64* %7, align 8, !dbg !518
  %115 = icmp ule i64 %114, 262144, !dbg !520
  br i1 %115, label %116, label %117, !dbg !521

116:                                              ; preds = %113
  store i32 18, i32* %6, align 4, !dbg !522
  br label %134, !dbg !522

117:                                              ; preds = %113
  %118 = load i64, i64* %7, align 8, !dbg !523
  %119 = icmp ule i64 %118, 524288, !dbg !525
  br i1 %119, label %120, label %121, !dbg !526

120:                                              ; preds = %117
  store i32 19, i32* %6, align 4, !dbg !527
  br label %134, !dbg !527

121:                                              ; preds = %117
  %122 = load i64, i64* %7, align 8, !dbg !528
  %123 = icmp ule i64 %122, 1048576, !dbg !530
  br i1 %123, label %124, label %125, !dbg !531

124:                                              ; preds = %121
  store i32 20, i32* %6, align 4, !dbg !532
  br label %134, !dbg !532

125:                                              ; preds = %121
  %126 = load i64, i64* %7, align 8, !dbg !533
  %127 = icmp ule i64 %126, 2097152, !dbg !535
  br i1 %127, label %128, label %129, !dbg !536

128:                                              ; preds = %125
  store i32 21, i32* %6, align 4, !dbg !537
  br label %134, !dbg !537

129:                                              ; preds = %125
  %130 = load i8, i8* %8, align 1, !dbg !538
  %131 = trunc i8 %130 to i1, !dbg !538
  br i1 %131, label %132, label %133, !dbg !540

132:                                              ; preds = %129
  store i32 -1, i32* %6, align 4, !dbg !541
  br label %134, !dbg !541

133:                                              ; preds = %129
  call void asm sideeffect "1:\09.byte 0x0f, 0x0b\0A.pushsection __bug_table,\22aw\22\0A2:\09.long 1b - .\09# bug_entry::bug_addr\0A\09.long ${0:c} - .\09# bug_entry::file\0A\09.word ${1:c}\09# bug_entry::line\0A\09.word ${2:c}\09# bug_entry::flags\0A\09.org 2b+${3:c}\0A.popsection\0A", "i,i,i,i,~{dirflag},~{fpsr},~{flags}"(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.3, i64 0, i64 0), i32 479, i32 0, i64 12) #12, !dbg !542, !srcloc !545
  unreachable, !dbg !546

134:                                              ; preds = %34, %38, %45, %52, %56, %60, %64, %68, %72, %76, %80, %84, %88, %92, %96, %100, %104, %108, %112, %116, %120, %124, %128, %132
  %135 = load i32, i32* %6, align 4, !dbg !547
  store i32 %135, i32* %12, align 4, !dbg !548
  %136 = load i32, i32* %11, align 4, !dbg !549
  %137 = call i8* @llvm.returnaddress(i32 0) #12, !dbg !550
  %138 = ptrtoint i8* %137 to i64, !dbg !550
  store i32 %136, i32* %4, align 4
  call void @llvm.dbg.declare(metadata i32* %4, metadata !551, metadata !DIExpression()), !dbg !555
  store i64 %138, i64* %5, align 8
  call void @llvm.dbg.declare(metadata i64* %5, metadata !557, metadata !DIExpression()), !dbg !558
  %139 = load i32, i32* %4, align 4, !dbg !559
  %140 = and i32 %139, 17, !dbg !559
  %141 = icmp eq i32 %140, 0, !dbg !559
  %142 = xor i1 %141, true, !dbg !559
  %143 = zext i1 %141 to i32, !dbg !559
  %144 = sext i32 %143 to i64, !dbg !559
  br i1 %141, label %145, label %146, !dbg !561

145:                                              ; preds = %134
  store i32 0, i32* %3, align 4, !dbg !562
  br label %152, !dbg !562

146:                                              ; preds = %134
  %147 = load i32, i32* %4, align 4, !dbg !563
  %148 = and i32 %147, 1, !dbg !565
  %149 = icmp ne i32 %148, 0, !dbg !565
  br i1 %149, label %150, label %151, !dbg !566

150:                                              ; preds = %146
  store i32 2, i32* %3, align 4, !dbg !567
  br label %152, !dbg !567

151:                                              ; preds = %146
  store i32 1, i32* %3, align 4, !dbg !568
  br label %152, !dbg !568

152:                                              ; preds = %145, %150, %151
  %153 = load i32, i32* %3, align 4, !dbg !570
  %154 = zext i32 %153 to i64, !dbg !571
  %155 = getelementptr [3 x [14 x %struct.kmem_cache*]], [3 x [14 x %struct.kmem_cache*]]* @kmalloc_caches, i64 0, i64 %154, !dbg !571
  %156 = load i32, i32* %12, align 4, !dbg !572
  %157 = zext i32 %156 to i64, !dbg !571
  %158 = getelementptr [14 x %struct.kmem_cache*], [14 x %struct.kmem_cache*]* %155, i64 0, i64 %157, !dbg !571
  %159 = load %struct.kmem_cache*, %struct.kmem_cache** %158, align 8, !dbg !571
  %160 = load i32, i32* %11, align 4, !dbg !573
  %161 = load i64, i64* %10, align 8, !dbg !574
  %162 = call noalias align 8 i8* @kmalloc_trace(%struct.kmem_cache* noundef %159, i32 noundef %160, i64 noundef %161) #14, !dbg !575
  store i8* %162, i8** %9, align 8, !dbg !576
  br label %167, !dbg !576

163:                                              ; preds = %20, %2
  %164 = load i64, i64* %10, align 8, !dbg !577
  %165 = load i32, i32* %11, align 4, !dbg !578
  %166 = call noalias align 8 i8* @__kmalloc(i64 noundef %164, i32 noundef %165) #13, !dbg !579
  store i8* %166, i8** %9, align 8, !dbg !580
  br label %167, !dbg !580

167:                                              ; preds = %26, %152, %163
  %168 = load i8*, i8** %9, align 8, !dbg !581
  ret i8* %168, !dbg !582
}

; Function Attrs: noinline noredzone nounwind optnone
define dso_local void @register_free_hook(i8* noundef %0) #0 !dbg !583 {
  %2 = alloca i8*, align 8
  store i8* %0, i8** %2, align 8
  call void @llvm.dbg.declare(metadata i8** %2, metadata !584, metadata !DIExpression()), !dbg !585
  %3 = load i8*, i8** %2, align 8, !dbg !586
  %4 = bitcast i8* %3 to void (i8*)*, !dbg !586
  store void (i8*)* %4, void (i8*)** getelementptr inbounds (%struct.anon, %struct.anon* @heap, i32 0, i32 3), align 8, !dbg !587
  ret void, !dbg !588
}

; Function Attrs: noinline noredzone nounwind optnone
define dso_local void @register_alloc_hook(i8* noundef %0) #0 !dbg !589 {
  %2 = alloca i8*, align 8
  store i8* %0, i8** %2, align 8
  call void @llvm.dbg.declare(metadata i8** %2, metadata !590, metadata !DIExpression()), !dbg !591
  %3 = load i8*, i8** %2, align 8, !dbg !592
  %4 = bitcast i8* %3 to void (i32)*, !dbg !592
  store void (i32)* %4, void (i32)** getelementptr inbounds (%struct.anon, %struct.anon* @heap, i32 0, i32 2), align 8, !dbg !593
  ret void, !dbg !594
}

; Function Attrs: noinline noredzone nounwind optnone
define dso_local i8* @alloc_chunk(i32 noundef %0) #0 !dbg !595 {
  %2 = alloca i32, align 4
  %3 = alloca i8*, align 8
  %4 = alloca i32, align 4
  %5 = alloca %struct.heap_entry_t*, align 8
  %6 = alloca %struct.heap_entry_t*, align 8
  store i32 %0, i32* %2, align 4
  call void @llvm.dbg.declare(metadata i32* %2, metadata !598, metadata !DIExpression()), !dbg !599
  %7 = load void (i32)*, void (i32)** getelementptr inbounds (%struct.anon, %struct.anon* @heap, i32 0, i32 2), align 8, !dbg !600
  %8 = icmp ne void (i32)* %7, null, !dbg !602
  br i1 %8, label %9, label %12, !dbg !603

9:                                                ; preds = %1
  %10 = load void (i32)*, void (i32)** getelementptr inbounds (%struct.anon, %struct.anon* @heap, i32 0, i32 2), align 8, !dbg !604
  %11 = load i32, i32* %2, align 4, !dbg !605
  call void %10(i32 noundef %11) #10, !dbg !606
  br label %12, !dbg !606

12:                                               ; preds = %9, %1
  call void @llvm.dbg.declare(metadata i8** %3, metadata !607, metadata !DIExpression()), !dbg !608
  store i8* null, i8** %3, align 8, !dbg !608
  call void @llvm.dbg.declare(metadata i32* %4, metadata !609, metadata !DIExpression()), !dbg !610
  %13 = load i32, i32* %2, align 4, !dbg !611
  %14 = call i32 @size_to_index(i32 noundef %13) #10, !dbg !612
  store i32 %14, i32* %4, align 4, !dbg !610
  call void @llvm.dbg.declare(metadata %struct.heap_entry_t** %5, metadata !613, metadata !DIExpression()), !dbg !615
  %15 = load i32, i32* %4, align 4, !dbg !616
  %16 = sext i32 %15 to i64, !dbg !617
  %17 = getelementptr [9 x %struct.heap_entry_t*], [9 x %struct.heap_entry_t*]* getelementptr inbounds (%struct.anon, %struct.anon* @heap, i32 0, i32 0), i64 0, i64 %16, !dbg !617
  %18 = load %struct.heap_entry_t*, %struct.heap_entry_t** %17, align 8, !dbg !617
  store %struct.heap_entry_t* %18, %struct.heap_entry_t** %5, align 8, !dbg !615
  br label %19, !dbg !618

19:                                               ; preds = %40, %12
  %20 = load %struct.heap_entry_t*, %struct.heap_entry_t** %5, align 8, !dbg !619
  %21 = icmp ne %struct.heap_entry_t* %20, null, !dbg !621
  br i1 %21, label %22, label %44, !dbg !622

22:                                               ; preds = %19
  %23 = load %struct.heap_entry_t*, %struct.heap_entry_t** %5, align 8, !dbg !623
  %24 = getelementptr inbounds %struct.heap_entry_t, %struct.heap_entry_t* %23, i32 0, i32 1, !dbg !626
  %25 = load %struct.chunk_t*, %struct.chunk_t** %24, align 8, !dbg !626
  %26 = icmp ne %struct.chunk_t* %25, null, !dbg !627
  br i1 %26, label %27, label %39, !dbg !628

27:                                               ; preds = %22
  %28 = load %struct.heap_entry_t*, %struct.heap_entry_t** %5, align 8, !dbg !629
  %29 = getelementptr inbounds %struct.heap_entry_t, %struct.heap_entry_t* %28, i32 0, i32 1, !dbg !631
  %30 = load %struct.chunk_t*, %struct.chunk_t** %29, align 8, !dbg !631
  %31 = bitcast %struct.chunk_t* %30 to i8*, !dbg !629
  store i8* %31, i8** %3, align 8, !dbg !632
  %32 = load %struct.heap_entry_t*, %struct.heap_entry_t** %5, align 8, !dbg !633
  %33 = getelementptr inbounds %struct.heap_entry_t, %struct.heap_entry_t* %32, i32 0, i32 1, !dbg !634
  %34 = load %struct.chunk_t*, %struct.chunk_t** %33, align 8, !dbg !634
  %35 = getelementptr inbounds %struct.chunk_t, %struct.chunk_t* %34, i32 0, i32 0, !dbg !635
  %36 = load %struct.chunk_t*, %struct.chunk_t** %35, align 8, !dbg !635
  %37 = load %struct.heap_entry_t*, %struct.heap_entry_t** %5, align 8, !dbg !636
  %38 = getelementptr inbounds %struct.heap_entry_t, %struct.heap_entry_t* %37, i32 0, i32 1, !dbg !637
  store %struct.chunk_t* %36, %struct.chunk_t** %38, align 8, !dbg !638
  br label %44, !dbg !639

39:                                               ; preds = %22
  br label %40, !dbg !640

40:                                               ; preds = %39
  %41 = load %struct.heap_entry_t*, %struct.heap_entry_t** %5, align 8, !dbg !641
  %42 = getelementptr inbounds %struct.heap_entry_t, %struct.heap_entry_t* %41, i32 0, i32 0, !dbg !642
  %43 = load %struct.heap_entry_t*, %struct.heap_entry_t** %42, align 8, !dbg !642
  store %struct.heap_entry_t* %43, %struct.heap_entry_t** %5, align 8, !dbg !643
  br label %19, !dbg !644, !llvm.loop !645

44:                                               ; preds = %27, %19
  %45 = load i8*, i8** %3, align 8, !dbg !647
  %46 = icmp eq i8* %45, null, !dbg !649
  br i1 %46, label %47, label %71, !dbg !650

47:                                               ; preds = %44
  call void @llvm.dbg.declare(metadata %struct.heap_entry_t** %6, metadata !651, metadata !DIExpression()), !dbg !653
  %48 = load i32, i32* %4, align 4, !dbg !654
  %49 = call %struct.heap_entry_t* @alloc_entry(i32 noundef %48) #10, !dbg !655
  store %struct.heap_entry_t* %49, %struct.heap_entry_t** %6, align 8, !dbg !653
  %50 = load i32, i32* %4, align 4, !dbg !656
  %51 = sext i32 %50 to i64, !dbg !657
  %52 = getelementptr [9 x %struct.heap_entry_t*], [9 x %struct.heap_entry_t*]* getelementptr inbounds (%struct.anon, %struct.anon* @heap, i32 0, i32 0), i64 0, i64 %51, !dbg !657
  %53 = load %struct.heap_entry_t*, %struct.heap_entry_t** %52, align 8, !dbg !657
  %54 = load %struct.heap_entry_t*, %struct.heap_entry_t** %6, align 8, !dbg !658
  %55 = getelementptr inbounds %struct.heap_entry_t, %struct.heap_entry_t* %54, i32 0, i32 0, !dbg !659
  store %struct.heap_entry_t* %53, %struct.heap_entry_t** %55, align 8, !dbg !660
  %56 = load %struct.heap_entry_t*, %struct.heap_entry_t** %6, align 8, !dbg !661
  %57 = load i32, i32* %4, align 4, !dbg !662
  %58 = sext i32 %57 to i64, !dbg !663
  %59 = getelementptr [9 x %struct.heap_entry_t*], [9 x %struct.heap_entry_t*]* getelementptr inbounds (%struct.anon, %struct.anon* @heap, i32 0, i32 0), i64 0, i64 %58, !dbg !663
  store %struct.heap_entry_t* %56, %struct.heap_entry_t** %59, align 8, !dbg !664
  %60 = load %struct.heap_entry_t*, %struct.heap_entry_t** %6, align 8, !dbg !665
  %61 = getelementptr inbounds %struct.heap_entry_t, %struct.heap_entry_t* %60, i32 0, i32 1, !dbg !666
  %62 = load %struct.chunk_t*, %struct.chunk_t** %61, align 8, !dbg !666
  %63 = bitcast %struct.chunk_t* %62 to i8*, !dbg !665
  store i8* %63, i8** %3, align 8, !dbg !667
  %64 = load %struct.heap_entry_t*, %struct.heap_entry_t** %6, align 8, !dbg !668
  %65 = getelementptr inbounds %struct.heap_entry_t, %struct.heap_entry_t* %64, i32 0, i32 1, !dbg !669
  %66 = load %struct.chunk_t*, %struct.chunk_t** %65, align 8, !dbg !669
  %67 = getelementptr inbounds %struct.chunk_t, %struct.chunk_t* %66, i32 0, i32 0, !dbg !670
  %68 = load %struct.chunk_t*, %struct.chunk_t** %67, align 8, !dbg !670
  %69 = load %struct.heap_entry_t*, %struct.heap_entry_t** %6, align 8, !dbg !671
  %70 = getelementptr inbounds %struct.heap_entry_t, %struct.heap_entry_t* %69, i32 0, i32 1, !dbg !672
  store %struct.chunk_t* %68, %struct.chunk_t** %70, align 8, !dbg !673
  br label %71, !dbg !674

71:                                               ; preds = %47, %44
  %72 = load i8*, i8** %3, align 8, !dbg !675
  ret i8* %72, !dbg !676
}

; Function Attrs: noinline noredzone nounwind optnone
define dso_local void @free_chunk(i8* noundef %0) #0 !dbg !677 {
  %2 = alloca i8*, align 8
  %3 = alloca %struct.page_t*, align 8
  %4 = alloca i32, align 4
  %5 = alloca %struct.heap_entry_t*, align 8
  store i8* %0, i8** %2, align 8
  call void @llvm.dbg.declare(metadata i8** %2, metadata !678, metadata !DIExpression()), !dbg !679
  %6 = load void (i8*)*, void (i8*)** getelementptr inbounds (%struct.anon, %struct.anon* @heap, i32 0, i32 3), align 8, !dbg !680
  %7 = icmp ne void (i8*)* %6, null, !dbg !682
  br i1 %7, label %8, label %11, !dbg !683

8:                                                ; preds = %1
  %9 = load void (i8*)*, void (i8*)** getelementptr inbounds (%struct.anon, %struct.anon* @heap, i32 0, i32 3), align 8, !dbg !684
  %10 = load i8*, i8** %2, align 8, !dbg !685
  call void %9(i8* noundef %10) #10, !dbg !686
  br label %11, !dbg !686

11:                                               ; preds = %8, %1
  call void @llvm.dbg.declare(metadata %struct.page_t** %3, metadata !687, metadata !DIExpression()), !dbg !688
  %12 = load i8*, i8** %2, align 8, !dbg !689
  %13 = ptrtoint i8* %12 to i64, !dbg !689
  %14 = and i64 %13, -4096, !dbg !689
  %15 = inttoptr i64 %14 to %struct.page_t*, !dbg !689
  store %struct.page_t* %15, %struct.page_t** %3, align 8, !dbg !688
  call void @llvm.dbg.declare(metadata i32* %4, metadata !690, metadata !DIExpression()), !dbg !692
  store i32 0, i32* %4, align 4, !dbg !692
  br label %16, !dbg !693

16:                                               ; preds = %50, %11
  %17 = load i32, i32* %4, align 4, !dbg !694
  %18 = icmp slt i32 %17, 9, !dbg !696
  br i1 %18, label %19, label %53, !dbg !697

19:                                               ; preds = %16
  call void @llvm.dbg.declare(metadata %struct.heap_entry_t** %5, metadata !698, metadata !DIExpression()), !dbg !701
  %20 = load i32, i32* %4, align 4, !dbg !702
  %21 = sext i32 %20 to i64, !dbg !703
  %22 = getelementptr [9 x %struct.heap_entry_t*], [9 x %struct.heap_entry_t*]* getelementptr inbounds (%struct.anon, %struct.anon* @heap, i32 0, i32 0), i64 0, i64 %21, !dbg !703
  %23 = load %struct.heap_entry_t*, %struct.heap_entry_t** %22, align 8, !dbg !703
  store %struct.heap_entry_t* %23, %struct.heap_entry_t** %5, align 8, !dbg !701
  br label %24, !dbg !704

24:                                               ; preds = %45, %19
  %25 = load %struct.heap_entry_t*, %struct.heap_entry_t** %5, align 8, !dbg !705
  %26 = icmp ne %struct.heap_entry_t* %25, null, !dbg !707
  br i1 %26, label %27, label %49, !dbg !708

27:                                               ; preds = %24
  %28 = load %struct.page_t*, %struct.page_t** %3, align 8, !dbg !709
  %29 = load %struct.heap_entry_t*, %struct.heap_entry_t** %5, align 8, !dbg !712
  %30 = getelementptr inbounds %struct.heap_entry_t, %struct.heap_entry_t* %29, i32 0, i32 2, !dbg !713
  %31 = load %struct.page_t*, %struct.page_t** %30, align 8, !dbg !713
  %32 = icmp eq %struct.page_t* %28, %31, !dbg !714
  br i1 %32, label %33, label %44, !dbg !715

33:                                               ; preds = %27
  %34 = load %struct.heap_entry_t*, %struct.heap_entry_t** %5, align 8, !dbg !716
  %35 = getelementptr inbounds %struct.heap_entry_t, %struct.heap_entry_t* %34, i32 0, i32 1, !dbg !718
  %36 = load %struct.chunk_t*, %struct.chunk_t** %35, align 8, !dbg !718
  %37 = load i8*, i8** %2, align 8, !dbg !719
  %38 = bitcast i8* %37 to %struct.chunk_t*, !dbg !720
  %39 = getelementptr inbounds %struct.chunk_t, %struct.chunk_t* %38, i32 0, i32 0, !dbg !721
  store %struct.chunk_t* %36, %struct.chunk_t** %39, align 8, !dbg !722
  %40 = load i8*, i8** %2, align 8, !dbg !723
  %41 = bitcast i8* %40 to %struct.chunk_t*, !dbg !723
  %42 = load %struct.heap_entry_t*, %struct.heap_entry_t** %5, align 8, !dbg !724
  %43 = getelementptr inbounds %struct.heap_entry_t, %struct.heap_entry_t* %42, i32 0, i32 1, !dbg !725
  store %struct.chunk_t* %41, %struct.chunk_t** %43, align 8, !dbg !726
  ret void, !dbg !727

44:                                               ; preds = %27
  br label %45, !dbg !728

45:                                               ; preds = %44
  %46 = load %struct.heap_entry_t*, %struct.heap_entry_t** %5, align 8, !dbg !729
  %47 = getelementptr inbounds %struct.heap_entry_t, %struct.heap_entry_t* %46, i32 0, i32 0, !dbg !730
  %48 = load %struct.heap_entry_t*, %struct.heap_entry_t** %47, align 8, !dbg !730
  store %struct.heap_entry_t* %48, %struct.heap_entry_t** %5, align 8, !dbg !731
  br label %24, !dbg !732, !llvm.loop !733

49:                                               ; preds = %24
  br label %50, !dbg !735

50:                                               ; preds = %49
  %51 = load i32, i32* %4, align 4, !dbg !736
  %52 = add i32 %51, 1, !dbg !736
  store i32 %52, i32* %4, align 4, !dbg !736
  br label %16, !dbg !737, !llvm.loop !738

53:                                               ; preds = %16
  call void (i8*, ...) @panic(i8* noundef getelementptr inbounds ([34 x i8], [34 x i8]* @.str.2, i64 0, i64 0)) #9, !dbg !740
  unreachable, !dbg !740
}

; Function Attrs: noredzone
declare noalias i8* @kmem_cache_alloc(%struct.kmem_cache* noundef, i32 noundef) #3

; Function Attrs: convergent nofree nosync nounwind readnone willreturn
declare i1 @llvm.is.constant.i64(i64) #5

; Function Attrs: noredzone allocsize(0)
declare noalias i8* @kmalloc_large(i64 noundef, i32 noundef) #6

; Function Attrs: noredzone allocsize(2)
declare noalias i8* @kmalloc_trace(%struct.kmem_cache* noundef, i32 noundef, i64 noundef) #7

; Function Attrs: nofree nosync nounwind readnone willreturn
declare i8* @llvm.returnaddress(i32 immarg) #8

; Function Attrs: noredzone allocsize(0)
declare noalias i8* @__kmalloc(i64 noundef, i32 noundef) #6

attributes #0 = { noinline noredzone nounwind optnone "disable-tail-calls"="true" "frame-pointer"="all" "min-legal-vector-width"="0" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+x87,-3dnow,-3dnowa,-aes,-avx,-avx2,-avx512bf16,-avx512bitalg,-avx512bw,-avx512cd,-avx512dq,-avx512er,-avx512f,-avx512fp16,-avx512ifma,-avx512pf,-avx512vbmi,-avx512vbmi2,-avx512vl,-avx512vnni,-avx512vp2intersect,-avx512vpopcntdq,-avxvnni,-f16c,-fma,-fma4,-gfni,-kl,-mmx,-pclmul,-sha,-sse,-sse2,-sse3,-sse4.1,-sse4.2,-sse4a,-ssse3,-vaes,-vpclmulqdq,-widekl,-xop" "tune-cpu"="generic" "warn-stack-size"="1024" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { noredzone noreturn "disable-tail-calls"="true" "frame-pointer"="all" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+x87,-3dnow,-3dnowa,-aes,-avx,-avx2,-avx512bf16,-avx512bitalg,-avx512bw,-avx512cd,-avx512dq,-avx512er,-avx512f,-avx512fp16,-avx512ifma,-avx512pf,-avx512vbmi,-avx512vbmi2,-avx512vl,-avx512vnni,-avx512vp2intersect,-avx512vpopcntdq,-avxvnni,-f16c,-fma,-fma4,-gfni,-kl,-mmx,-pclmul,-sha,-sse,-sse2,-sse3,-sse4.1,-sse4.2,-sse4a,-ssse3,-vaes,-vpclmulqdq,-widekl,-xop" "tune-cpu"="generic" }
attributes #3 = { noredzone "disable-tail-calls"="true" "frame-pointer"="all" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+x87,-3dnow,-3dnowa,-aes,-avx,-avx2,-avx512bf16,-avx512bitalg,-avx512bw,-avx512cd,-avx512dq,-avx512er,-avx512f,-avx512fp16,-avx512ifma,-avx512pf,-avx512vbmi,-avx512vbmi2,-avx512vl,-avx512vnni,-avx512vp2intersect,-avx512vpopcntdq,-avxvnni,-f16c,-fma,-fma4,-gfni,-kl,-mmx,-pclmul,-sha,-sse,-sse2,-sse3,-sse4.1,-sse4.2,-sse4a,-ssse3,-vaes,-vpclmulqdq,-widekl,-xop" "tune-cpu"="generic" }
attributes #4 = { noinline noredzone nounwind optnone allocsize(0) "disable-tail-calls"="true" "frame-pointer"="all" "min-legal-vector-width"="0" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+x87,-3dnow,-3dnowa,-aes,-avx,-avx2,-avx512bf16,-avx512bitalg,-avx512bw,-avx512cd,-avx512dq,-avx512er,-avx512f,-avx512fp16,-avx512ifma,-avx512pf,-avx512vbmi,-avx512vbmi2,-avx512vl,-avx512vnni,-avx512vp2intersect,-avx512vpopcntdq,-avxvnni,-f16c,-fma,-fma4,-gfni,-kl,-mmx,-pclmul,-sha,-sse,-sse2,-sse3,-sse4.1,-sse4.2,-sse4a,-ssse3,-vaes,-vpclmulqdq,-widekl,-xop" "tune-cpu"="generic" "warn-stack-size"="1024" }
attributes #5 = { convergent nofree nosync nounwind readnone willreturn }
attributes #6 = { noredzone allocsize(0) "disable-tail-calls"="true" "frame-pointer"="all" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+x87,-3dnow,-3dnowa,-aes,-avx,-avx2,-avx512bf16,-avx512bitalg,-avx512bw,-avx512cd,-avx512dq,-avx512er,-avx512f,-avx512fp16,-avx512ifma,-avx512pf,-avx512vbmi,-avx512vbmi2,-avx512vl,-avx512vnni,-avx512vp2intersect,-avx512vpopcntdq,-avxvnni,-f16c,-fma,-fma4,-gfni,-kl,-mmx,-pclmul,-sha,-sse,-sse2,-sse3,-sse4.1,-sse4.2,-sse4a,-ssse3,-vaes,-vpclmulqdq,-widekl,-xop" "tune-cpu"="generic" }
attributes #7 = { noredzone allocsize(2) "disable-tail-calls"="true" "frame-pointer"="all" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+x87,-3dnow,-3dnowa,-aes,-avx,-avx2,-avx512bf16,-avx512bitalg,-avx512bw,-avx512cd,-avx512dq,-avx512er,-avx512f,-avx512fp16,-avx512ifma,-avx512pf,-avx512vbmi,-avx512vbmi2,-avx512vl,-avx512vnni,-avx512vp2intersect,-avx512vpopcntdq,-avxvnni,-f16c,-fma,-fma4,-gfni,-kl,-mmx,-pclmul,-sha,-sse,-sse2,-sse3,-sse4.1,-sse4.2,-sse4a,-ssse3,-vaes,-vpclmulqdq,-widekl,-xop" "tune-cpu"="generic" }
attributes #8 = { nofree nosync nounwind readnone willreturn }
attributes #9 = { nobuiltin noredzone noreturn "no-builtins" }
attributes #10 = { nobuiltin noredzone "no-builtins" }
attributes #11 = { nobuiltin noredzone allocsize(0) "no-builtins" }
attributes #12 = { nounwind }
attributes #13 = { nobuiltin noredzone nounwind allocsize(0) "no-builtins" }
attributes #14 = { nobuiltin noredzone nounwind allocsize(2) "no-builtins" }

!llvm.dbg.cu = !{!2}
!llvm.module.flags = !{!67, !68, !69, !70, !71, !72, !73}
!llvm.ident = !{!74}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "heap_cache", scope: !2, file: !3, line: 11, type: !64, isLocal: true, isDefinition: true)
!2 = distinct !DICompileUnit(language: DW_LANG_C89, file: !3, producer: "Ubuntu clang version 14.0.0-1ubuntu1.1", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !4, retainedTypes: !21, globals: !46, splitDebugInlining: false, nameTableKind: None)
!3 = !DIFile(filename: "drivers/conv/heap.c", directory: "/home/achintya/Downloads/HARDEN_testcases/ASU_Testcases/eval2_buildroot-asu/buildroot/output/build/linux-asu", checksumkind: CSK_MD5, checksum: "28b9393ff3f9ec00868728c63e3cc552")
!4 = !{!5, !11}
!5 = !DICompositeType(tag: DW_TAG_enumeration_type, file: !6, line: 10, baseType: !7, size: 32, elements: !8)
!6 = !DIFile(filename: "./include/linux/stddef.h", directory: "/home/achintya/Downloads/HARDEN_testcases/ASU_Testcases/eval2_buildroot-asu/buildroot/output/build/linux-asu", checksumkind: CSK_MD5, checksum: "f808bea20fbf9b23fd364e1890694b49")
!7 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!8 = !{!9, !10}
!9 = !DIEnumerator(name: "false", value: 0)
!10 = !DIEnumerator(name: "true", value: 1)
!11 = !DICompositeType(tag: DW_TAG_enumeration_type, name: "kmalloc_cache_type", file: !12, line: 363, baseType: !7, size: 32, elements: !13)
!12 = !DIFile(filename: "./include/linux/slab.h", directory: "/home/achintya/Downloads/HARDEN_testcases/ASU_Testcases/eval2_buildroot-asu/buildroot/output/build/linux-asu", checksumkind: CSK_MD5, checksum: "558e84b5fa0d5da688b96bf72948a08a")
!13 = !{!14, !15, !16, !17, !18, !19, !20}
!14 = !DIEnumerator(name: "KMALLOC_NORMAL", value: 0)
!15 = !DIEnumerator(name: "KMALLOC_CGROUP", value: 0)
!16 = !DIEnumerator(name: "KMALLOC_RANDOM_START", value: 0)
!17 = !DIEnumerator(name: "KMALLOC_RANDOM_END", value: 0)
!18 = !DIEnumerator(name: "KMALLOC_RECLAIM", value: 1)
!19 = !DIEnumerator(name: "KMALLOC_DMA", value: 2)
!20 = !DIEnumerator(name: "NR_KMALLOC_TYPES", value: 3)
!21 = !{!22, !23, !25, !29, !31, !32, !33, !44, !45}
!22 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!23 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !24, size: 64)
!24 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!25 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !26, size: 64)
!26 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "chunk_t", file: !3, line: 13, size: 64, elements: !27)
!27 = !{!28}
!28 = !DIDerivedType(tag: DW_TAG_member, name: "next", scope: !26, file: !3, line: 14, baseType: !25, size: 64)
!29 = !DIDerivedType(tag: DW_TAG_typedef, name: "gfp_t", file: !30, line: 154, baseType: !7)
!30 = !DIFile(filename: "./include/linux/types.h", directory: "/home/achintya/Downloads/HARDEN_testcases/ASU_Testcases/eval2_buildroot-asu/buildroot/output/build/linux-asu", checksumkind: CSK_MD5, checksum: "bdd1b24ee6585d3549e0b4a1be717a98")
!31 = !DIDerivedType(tag: DW_TAG_typedef, name: "slab_flags_t", file: !30, line: 155, baseType: !7)
!32 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!33 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !34, size: 64)
!34 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "page_t", file: !3, line: 17, size: 128, elements: !35)
!35 = !{!36, !43}
!36 = !DIDerivedType(tag: DW_TAG_member, name: "parent", scope: !34, file: !3, line: 18, baseType: !37, size: 64)
!37 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !38, size: 64)
!38 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "heap_entry_t", file: !3, line: 22, size: 192, elements: !39)
!39 = !{!40, !41, !42}
!40 = !DIDerivedType(tag: DW_TAG_member, name: "next", scope: !38, file: !3, line: 23, baseType: !37, size: 64)
!41 = !DIDerivedType(tag: DW_TAG_member, name: "freelist", scope: !38, file: !3, line: 24, baseType: !25, size: 64, offset: 64)
!42 = !DIDerivedType(tag: DW_TAG_member, name: "this", scope: !38, file: !3, line: 25, baseType: !33, size: 64, offset: 128)
!43 = !DIDerivedType(tag: DW_TAG_member, name: "next", scope: !34, file: !3, line: 19, baseType: !33, size: 64, offset: 64)
!44 = !DIBasicType(name: "long long", size: 64, encoding: DW_ATE_signed)
!45 = !DIBasicType(name: "unsigned long", size: 64, encoding: DW_ATE_unsigned)
!46 = !{!47, !0}
!47 = !DIGlobalVariableExpression(var: !48, expr: !DIExpression())
!48 = distinct !DIGlobalVariable(name: "heap", scope: !2, file: !3, line: 33, type: !49, isLocal: false, isDefinition: true)
!49 = distinct !DICompositeType(tag: DW_TAG_structure_type, file: !3, line: 28, size: 768, elements: !50)
!50 = !{!51, !55, !56, !60}
!51 = !DIDerivedType(tag: DW_TAG_member, name: "entry_list", scope: !49, file: !3, line: 29, baseType: !52, size: 576)
!52 = !DICompositeType(tag: DW_TAG_array_type, baseType: !37, size: 576, elements: !53)
!53 = !{!54}
!54 = !DISubrange(count: 9)
!55 = !DIDerivedType(tag: DW_TAG_member, name: "unused_pages", scope: !49, file: !3, line: 30, baseType: !33, size: 64, offset: 576)
!56 = !DIDerivedType(tag: DW_TAG_member, name: "alloc_hook", scope: !49, file: !3, line: 31, baseType: !57, size: 64, offset: 640)
!57 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !58, size: 64)
!58 = !DISubroutineType(types: !59)
!59 = !{null, !7}
!60 = !DIDerivedType(tag: DW_TAG_member, name: "free_hook", scope: !49, file: !3, line: 32, baseType: !61, size: 64, offset: 704)
!61 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !62, size: 64)
!62 = !DISubroutineType(types: !63)
!63 = !{null, !32}
!64 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !65, size: 64)
!65 = !DICompositeType(tag: DW_TAG_structure_type, name: "kmem_cache", file: !66, line: 11, flags: DIFlagFwdDecl)
!66 = !DIFile(filename: "./include/linux/kasan.h", directory: "/home/achintya/Downloads/HARDEN_testcases/ASU_Testcases/eval2_buildroot-asu/buildroot/output/build/linux-asu", checksumkind: CSK_MD5, checksum: "cfd17a8f972a389fe48e5a8cb8370b12")
!67 = !{i32 7, !"Dwarf Version", i32 5}
!68 = !{i32 2, !"Debug Info Version", i32 3}
!69 = !{i32 1, !"wchar_size", i32 4}
!70 = !{i32 7, !"PIC Level", i32 2}
!71 = !{i32 7, !"PIE Level", i32 2}
!72 = !{i32 1, !"Code Model", i32 2}
!73 = !{i32 7, !"frame-pointer", i32 2}
!74 = !{!"Ubuntu clang version 14.0.0-1ubuntu1.1"}
!75 = distinct !DISubprogram(name: "size_to_index", scope: !3, file: !3, line: 42, type: !76, scopeLine: 43, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !78)
!76 = !DISubroutineType(types: !77)
!77 = !{!22, !7}
!78 = !{}
!79 = !DILocalVariable(name: "size", arg: 1, scope: !75, file: !3, line: 42, type: !7)
!80 = !DILocation(line: 42, column: 32, scope: !75)
!81 = !DILocation(line: 44, column: 6, scope: !82)
!82 = distinct !DILexicalBlock(scope: !75, file: !3, line: 44, column: 6)
!83 = !DILocation(line: 44, column: 11, scope: !82)
!84 = !DILocation(line: 44, column: 6, scope: !75)
!85 = !DILocation(line: 45, column: 3, scope: !82)
!86 = !DILocation(line: 47, column: 6, scope: !87)
!87 = distinct !DILexicalBlock(scope: !75, file: !3, line: 47, column: 6)
!88 = !DILocation(line: 47, column: 11, scope: !87)
!89 = !DILocation(line: 47, column: 6, scope: !75)
!90 = !DILocation(line: 48, column: 3, scope: !87)
!91 = !DILocalVariable(name: "index", scope: !75, file: !3, line: 50, type: !22)
!92 = !DILocation(line: 50, column: 6, scope: !75)
!93 = !DILocation(line: 50, column: 52, scope: !75)
!94 = !DILocation(line: 50, column: 38, scope: !75)
!95 = !DILocation(line: 50, column: 36, scope: !75)
!96 = !DILocation(line: 51, column: 12, scope: !97)
!97 = distinct !DILexicalBlock(scope: !75, file: !3, line: 51, column: 6)
!98 = !DILocation(line: 51, column: 18, scope: !97)
!99 = !DILocation(line: 51, column: 8, scope: !97)
!100 = !DILocation(line: 51, column: 26, scope: !97)
!101 = !DILocation(line: 51, column: 23, scope: !97)
!102 = !DILocation(line: 51, column: 6, scope: !75)
!103 = !DILocation(line: 52, column: 8, scope: !97)
!104 = !DILocation(line: 52, column: 3, scope: !97)
!105 = !DILocation(line: 54, column: 9, scope: !75)
!106 = !DILocation(line: 54, column: 15, scope: !75)
!107 = !DILocation(line: 54, column: 26, scope: !75)
!108 = !DILocation(line: 54, column: 36, scope: !75)
!109 = !DILocation(line: 54, column: 42, scope: !75)
!110 = !DILocation(line: 54, column: 2, scope: !75)
!111 = !DILocation(line: 55, column: 1, scope: !75)
!112 = distinct !DISubprogram(name: "index_to_size", scope: !3, file: !3, line: 57, type: !76, scopeLine: 58, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !78)
!113 = !DILocalVariable(name: "index", arg: 1, scope: !112, file: !3, line: 57, type: !7)
!114 = !DILocation(line: 57, column: 32, scope: !112)
!115 = !DILocation(line: 59, column: 15, scope: !112)
!116 = !DILocation(line: 59, column: 21, scope: !112)
!117 = !DILocation(line: 59, column: 11, scope: !112)
!118 = !DILocation(line: 59, column: 2, scope: !112)
!119 = distinct !DISubprogram(name: "chunk_page", scope: !3, file: !3, line: 62, type: !120, scopeLine: 64, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !78)
!120 = !DISubroutineType(types: !121)
!121 = !{null, !37, !33, !7}
!122 = !DILocalVariable(name: "entry", arg: 1, scope: !119, file: !3, line: 62, type: !37)
!123 = !DILocation(line: 62, column: 38, scope: !119)
!124 = !DILocalVariable(name: "ptr", arg: 2, scope: !119, file: !3, line: 62, type: !33)
!125 = !DILocation(line: 62, column: 60, scope: !119)
!126 = !DILocalVariable(name: "size", arg: 3, scope: !119, file: !3, line: 63, type: !7)
!127 = !DILocation(line: 63, column: 16, scope: !119)
!128 = !DILocalVariable(name: "addr", scope: !129, file: !3, line: 65, type: !23)
!129 = distinct !DILexicalBlock(scope: !119, file: !3, line: 65, column: 2)
!130 = !DILocation(line: 65, column: 13, scope: !129)
!131 = !DILocation(line: 65, column: 28, scope: !129)
!132 = !DILocation(line: 65, column: 20, scope: !129)
!133 = !DILocation(line: 65, column: 32, scope: !129)
!134 = !DILocation(line: 65, column: 46, scope: !129)
!135 = !DILocation(line: 65, column: 44, scope: !129)
!136 = !DILocation(line: 65, column: 7, scope: !129)
!137 = !DILocalVariable(name: "chunk_ptr", scope: !138, file: !3, line: 66, type: !25)
!138 = distinct !DILexicalBlock(scope: !139, file: !3, line: 65, column: 67)
!139 = distinct !DILexicalBlock(scope: !129, file: !3, line: 65, column: 2)
!140 = !DILocation(line: 66, column: 19, scope: !138)
!141 = !DILocation(line: 66, column: 49, scope: !138)
!142 = !DILocation(line: 66, column: 31, scope: !138)
!143 = !DILocation(line: 67, column: 21, scope: !138)
!144 = !DILocation(line: 67, column: 28, scope: !138)
!145 = !DILocation(line: 67, column: 3, scope: !138)
!146 = !DILocation(line: 67, column: 14, scope: !138)
!147 = !DILocation(line: 67, column: 19, scope: !138)
!148 = !DILocation(line: 68, column: 21, scope: !138)
!149 = !DILocation(line: 68, column: 3, scope: !138)
!150 = !DILocation(line: 68, column: 10, scope: !138)
!151 = !DILocation(line: 68, column: 19, scope: !138)
!152 = !DILocation(line: 70, column: 7, scope: !153)
!153 = distinct !DILexicalBlock(scope: !138, file: !3, line: 70, column: 7)
!154 = !DILocation(line: 70, column: 23, scope: !153)
!155 = !DILocation(line: 70, column: 15, scope: !153)
!156 = !DILocation(line: 70, column: 12, scope: !153)
!157 = !DILocation(line: 70, column: 7, scope: !138)
!158 = !DILocation(line: 71, column: 4, scope: !153)
!159 = !DILocation(line: 72, column: 2, scope: !138)
!160 = !DILocation(line: 65, column: 61, scope: !139)
!161 = !DILocation(line: 65, column: 58, scope: !139)
!162 = !DILocation(line: 65, column: 2, scope: !139)
!163 = distinct !{!163, !164, !165}
!164 = !DILocation(line: 65, column: 2, scope: !129)
!165 = !DILocation(line: 72, column: 2, scope: !129)
!166 = !DILocation(line: 73, column: 1, scope: !119)
!167 = distinct !DISubprogram(name: "cache_pages", scope: !3, file: !3, line: 75, type: !168, scopeLine: 76, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !78)
!168 = !DISubroutineType(types: !169)
!169 = !{null}
!170 = !DILocalVariable(name: "i", scope: !171, file: !3, line: 77, type: !22)
!171 = distinct !DILexicalBlock(scope: !167, file: !3, line: 77, column: 2)
!172 = !DILocation(line: 77, column: 11, scope: !171)
!173 = !DILocation(line: 77, column: 7, scope: !171)
!174 = !DILocation(line: 77, column: 18, scope: !175)
!175 = distinct !DILexicalBlock(scope: !171, file: !3, line: 77, column: 2)
!176 = !DILocation(line: 77, column: 20, scope: !175)
!177 = !DILocation(line: 77, column: 2, scope: !171)
!178 = !DILocalVariable(name: "page_cache", scope: !179, file: !3, line: 78, type: !33)
!179 = distinct !DILexicalBlock(scope: !175, file: !3, line: 77, column: 40)
!180 = !DILocation(line: 78, column: 18, scope: !179)
!181 = !DILocation(line: 79, column: 22, scope: !179)
!182 = !DILocation(line: 79, column: 4, scope: !179)
!183 = !DILocation(line: 80, column: 27, scope: !179)
!184 = !DILocation(line: 80, column: 3, scope: !179)
!185 = !DILocation(line: 80, column: 15, scope: !179)
!186 = !DILocation(line: 80, column: 20, scope: !179)
!187 = !DILocation(line: 81, column: 23, scope: !179)
!188 = !DILocation(line: 81, column: 21, scope: !179)
!189 = !DILocation(line: 82, column: 2, scope: !179)
!190 = !DILocation(line: 77, column: 36, scope: !175)
!191 = !DILocation(line: 77, column: 2, scope: !175)
!192 = distinct !{!192, !177, !193}
!193 = !DILocation(line: 82, column: 2, scope: !171)
!194 = !DILocation(line: 83, column: 1, scope: !167)
!195 = distinct !DISubprogram(name: "kmem_cache_zalloc", scope: !12, file: !12, line: 708, type: !196, scopeLine: 709, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !78)
!196 = !DISubroutineType(types: !197)
!197 = !{!32, !64, !29}
!198 = !DILocalVariable(name: "k", arg: 1, scope: !195, file: !12, line: 708, type: !64)
!199 = !DILocation(line: 708, column: 58, scope: !195)
!200 = !DILocalVariable(name: "flags", arg: 2, scope: !195, file: !12, line: 708, type: !29)
!201 = !DILocation(line: 708, column: 67, scope: !195)
!202 = !DILocation(line: 710, column: 26, scope: !195)
!203 = !DILocation(line: 710, column: 29, scope: !195)
!204 = !DILocation(line: 710, column: 35, scope: !195)
!205 = !DILocation(line: 710, column: 9, scope: !195)
!206 = !DILocation(line: 710, column: 2, scope: !195)
!207 = distinct !DISubprogram(name: "init_heap", scope: !3, file: !3, line: 85, type: !168, scopeLine: 86, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !78)
!208 = !DILocation(line: 87, column: 15, scope: !207)
!209 = !DILocation(line: 87, column: 13, scope: !207)
!210 = !DILocation(line: 89, column: 18, scope: !207)
!211 = !DILocation(line: 90, column: 17, scope: !207)
!212 = !DILocalVariable(name: "i", scope: !213, file: !3, line: 96, type: !22)
!213 = distinct !DILexicalBlock(scope: !207, file: !3, line: 96, column: 2)
!214 = !DILocation(line: 96, column: 11, scope: !213)
!215 = !DILocation(line: 96, column: 7, scope: !213)
!216 = !DILocation(line: 96, column: 18, scope: !217)
!217 = distinct !DILexicalBlock(scope: !213, file: !3, line: 96, column: 2)
!218 = !DILocation(line: 96, column: 20, scope: !217)
!219 = !DILocation(line: 96, column: 2, scope: !213)
!220 = !DILocalVariable(name: "j", scope: !221, file: !3, line: 97, type: !22)
!221 = distinct !DILexicalBlock(scope: !222, file: !3, line: 97, column: 3)
!222 = distinct !DILexicalBlock(scope: !217, file: !3, line: 96, column: 34)
!223 = !DILocation(line: 97, column: 12, scope: !221)
!224 = !DILocation(line: 97, column: 8, scope: !221)
!225 = !DILocation(line: 97, column: 19, scope: !226)
!226 = distinct !DILexicalBlock(scope: !221, file: !3, line: 97, column: 3)
!227 = !DILocation(line: 97, column: 21, scope: !226)
!228 = !DILocation(line: 97, column: 3, scope: !221)
!229 = !DILocalVariable(name: "prev", scope: !230, file: !3, line: 98, type: !37)
!230 = distinct !DILexicalBlock(scope: !226, file: !3, line: 97, column: 45)
!231 = !DILocation(line: 98, column: 25, scope: !230)
!232 = !DILocation(line: 98, column: 48, scope: !230)
!233 = !DILocation(line: 98, column: 32, scope: !230)
!234 = !DILocalVariable(name: "curr", scope: !230, file: !3, line: 99, type: !37)
!235 = !DILocation(line: 99, column: 25, scope: !230)
!236 = !DILocation(line: 99, column: 44, scope: !230)
!237 = !DILocation(line: 99, column: 32, scope: !230)
!238 = !DILocation(line: 101, column: 17, scope: !230)
!239 = !DILocation(line: 101, column: 4, scope: !230)
!240 = !DILocation(line: 101, column: 10, scope: !230)
!241 = !DILocation(line: 101, column: 15, scope: !230)
!242 = !DILocation(line: 102, column: 25, scope: !230)
!243 = !DILocation(line: 102, column: 20, scope: !230)
!244 = !DILocation(line: 102, column: 4, scope: !230)
!245 = !DILocation(line: 102, column: 23, scope: !230)
!246 = !DILocation(line: 103, column: 3, scope: !230)
!247 = !DILocation(line: 97, column: 41, scope: !226)
!248 = !DILocation(line: 97, column: 3, scope: !226)
!249 = distinct !{!249, !228, !250}
!250 = !DILocation(line: 103, column: 3, scope: !221)
!251 = !DILocation(line: 104, column: 2, scope: !222)
!252 = !DILocation(line: 96, column: 30, scope: !217)
!253 = !DILocation(line: 96, column: 2, scope: !217)
!254 = distinct !{!254, !219, !255}
!255 = !DILocation(line: 104, column: 2, scope: !213)
!256 = !DILocation(line: 106, column: 2, scope: !207)
!257 = !DILocation(line: 107, column: 1, scope: !207)
!258 = distinct !DISubprogram(name: "alloc_entry", scope: !3, file: !3, line: 140, type: !259, scopeLine: 141, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !78)
!259 = !DISubroutineType(types: !260)
!260 = !{!37, !22}
!261 = !DILocalVariable(name: "index", arg: 1, scope: !258, file: !3, line: 140, type: !22)
!262 = !DILocation(line: 140, column: 38, scope: !258)
!263 = !DILocalVariable(name: "page_use", scope: !258, file: !3, line: 142, type: !33)
!264 = !DILocation(line: 142, column: 17, scope: !258)
!265 = !DILocation(line: 144, column: 11, scope: !266)
!266 = distinct !DILexicalBlock(scope: !258, file: !3, line: 144, column: 6)
!267 = !DILocation(line: 144, column: 6, scope: !266)
!268 = !DILocation(line: 144, column: 6, scope: !258)
!269 = !DILocation(line: 145, column: 19, scope: !270)
!270 = distinct !DILexicalBlock(scope: !266, file: !3, line: 144, column: 25)
!271 = !DILocation(line: 145, column: 12, scope: !270)
!272 = !DILocation(line: 146, column: 28, scope: !270)
!273 = !DILocation(line: 146, column: 42, scope: !270)
!274 = !DILocation(line: 146, column: 21, scope: !270)
!275 = !DILocation(line: 147, column: 2, scope: !270)
!276 = !DILocation(line: 148, column: 32, scope: !277)
!277 = distinct !DILexicalBlock(scope: !266, file: !3, line: 147, column: 9)
!278 = !DILocation(line: 148, column: 14, scope: !277)
!279 = !DILocation(line: 148, column: 12, scope: !277)
!280 = !DILocation(line: 149, column: 3, scope: !277)
!281 = !DILocalVariable(name: "curr", scope: !258, file: !3, line: 152, type: !37)
!282 = !DILocation(line: 152, column: 23, scope: !258)
!283 = !DILocation(line: 153, column: 3, scope: !258)
!284 = !DILocation(line: 155, column: 15, scope: !258)
!285 = !DILocation(line: 155, column: 2, scope: !258)
!286 = !DILocation(line: 155, column: 8, scope: !258)
!287 = !DILocation(line: 155, column: 13, scope: !258)
!288 = !DILocation(line: 156, column: 13, scope: !258)
!289 = !DILocation(line: 156, column: 19, scope: !258)
!290 = !DILocation(line: 156, column: 43, scope: !258)
!291 = !DILocation(line: 156, column: 29, scope: !258)
!292 = !DILocation(line: 156, column: 2, scope: !258)
!293 = !DILocation(line: 157, column: 9, scope: !258)
!294 = !DILocation(line: 157, column: 2, scope: !258)
!295 = distinct !DISubprogram(name: "free_unused_pages", scope: !3, file: !3, line: 109, type: !168, scopeLine: 110, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !78)
!296 = !DILocalVariable(name: "curr_page", scope: !297, file: !3, line: 111, type: !33)
!297 = distinct !DILexicalBlock(scope: !295, file: !3, line: 111, column: 2)
!298 = !DILocation(line: 111, column: 22, scope: !297)
!299 = !DILocation(line: 111, column: 39, scope: !297)
!300 = !DILocation(line: 111, column: 7, scope: !297)
!301 = !DILocation(line: 111, column: 53, scope: !302)
!302 = distinct !DILexicalBlock(scope: !297, file: !3, line: 111, column: 2)
!303 = !DILocation(line: 111, column: 63, scope: !302)
!304 = !DILocation(line: 111, column: 2, scope: !297)
!305 = !DILocalVariable(name: "saved", scope: !306, file: !3, line: 112, type: !33)
!306 = distinct !DILexicalBlock(scope: !302, file: !3, line: 111, column: 73)
!307 = !DILocation(line: 112, column: 18, scope: !306)
!308 = !DILocation(line: 112, column: 26, scope: !306)
!309 = !DILocation(line: 112, column: 37, scope: !306)
!310 = !DILocation(line: 113, column: 9, scope: !306)
!311 = !DILocation(line: 113, column: 3, scope: !306)
!312 = !DILocation(line: 114, column: 15, scope: !306)
!313 = !DILocation(line: 114, column: 13, scope: !306)
!314 = !DILocation(line: 111, column: 2, scope: !302)
!315 = distinct !{!315, !304, !316}
!316 = !DILocation(line: 115, column: 2, scope: !297)
!317 = !DILocation(line: 116, column: 1, scope: !295)
!318 = distinct !DISubprogram(name: "free_entry", scope: !3, file: !3, line: 118, type: !319, scopeLine: 119, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !78)
!319 = !DISubroutineType(types: !320)
!320 = !{null, !22}
!321 = !DILocalVariable(name: "index", arg: 1, scope: !318, file: !3, line: 118, type: !22)
!322 = !DILocation(line: 118, column: 21, scope: !318)
!323 = !DILocalVariable(name: "curr_entry", scope: !324, file: !3, line: 120, type: !37)
!324 = distinct !DILexicalBlock(scope: !318, file: !3, line: 120, column: 2)
!325 = !DILocation(line: 120, column: 28, scope: !324)
!326 = !DILocation(line: 120, column: 57, scope: !324)
!327 = !DILocation(line: 120, column: 41, scope: !324)
!328 = !DILocation(line: 120, column: 7, scope: !324)
!329 = !DILocation(line: 121, column: 7, scope: !330)
!330 = distinct !DILexicalBlock(scope: !324, file: !3, line: 120, column: 2)
!331 = !DILocation(line: 121, column: 18, scope: !330)
!332 = !DILocation(line: 120, column: 2, scope: !324)
!333 = !DILocation(line: 122, column: 9, scope: !334)
!334 = distinct !DILexicalBlock(scope: !330, file: !3, line: 121, column: 28)
!335 = !DILocation(line: 122, column: 21, scope: !334)
!336 = !DILocation(line: 122, column: 3, scope: !334)
!337 = !DILocalVariable(name: "saved", scope: !334, file: !3, line: 123, type: !37)
!338 = !DILocation(line: 123, column: 24, scope: !334)
!339 = !DILocation(line: 123, column: 32, scope: !334)
!340 = !DILocation(line: 123, column: 44, scope: !334)
!341 = !DILocation(line: 124, column: 9, scope: !334)
!342 = !DILocation(line: 124, column: 3, scope: !334)
!343 = !DILocation(line: 125, column: 16, scope: !334)
!344 = !DILocation(line: 125, column: 14, scope: !334)
!345 = !DILocation(line: 120, column: 2, scope: !330)
!346 = distinct !{!346, !332, !347}
!347 = !DILocation(line: 126, column: 2, scope: !324)
!348 = !DILocation(line: 127, column: 1, scope: !318)
!349 = distinct !DISubprogram(name: "free_heap", scope: !3, file: !3, line: 129, type: !168, scopeLine: 130, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !78)
!350 = !DILocation(line: 131, column: 2, scope: !349)
!351 = !DILocalVariable(name: "i", scope: !352, file: !3, line: 133, type: !22)
!352 = distinct !DILexicalBlock(scope: !349, file: !3, line: 133, column: 2)
!353 = !DILocation(line: 133, column: 11, scope: !352)
!354 = !DILocation(line: 133, column: 7, scope: !352)
!355 = !DILocation(line: 133, column: 18, scope: !356)
!356 = distinct !DILexicalBlock(scope: !352, file: !3, line: 133, column: 2)
!357 = !DILocation(line: 133, column: 20, scope: !356)
!358 = !DILocation(line: 133, column: 2, scope: !352)
!359 = !DILocation(line: 134, column: 14, scope: !360)
!360 = distinct !DILexicalBlock(scope: !356, file: !3, line: 133, column: 34)
!361 = !DILocation(line: 134, column: 3, scope: !360)
!362 = !DILocation(line: 135, column: 2, scope: !360)
!363 = !DILocation(line: 133, column: 30, scope: !356)
!364 = !DILocation(line: 133, column: 2, scope: !356)
!365 = distinct !{!365, !358, !366}
!366 = !DILocation(line: 135, column: 2, scope: !352)
!367 = !DILocation(line: 137, column: 21, scope: !349)
!368 = !DILocation(line: 137, column: 2, scope: !349)
!369 = !DILocation(line: 138, column: 1, scope: !349)
!370 = distinct !DISubprogram(name: "kzalloc", scope: !12, file: !12, line: 718, type: !371, scopeLine: 719, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !78)
!371 = !DISubroutineType(types: !372)
!372 = !{!32, !373, !29}
!373 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !30, line: 61, baseType: !374)
!374 = !DIDerivedType(tag: DW_TAG_typedef, name: "__kernel_size_t", file: !375, line: 72, baseType: !376)
!375 = !DIFile(filename: "./include/uapi/asm-generic/posix_types.h", directory: "/home/achintya/Downloads/HARDEN_testcases/ASU_Testcases/eval2_buildroot-asu/buildroot/output/build/linux-asu", checksumkind: CSK_MD5, checksum: "02144a993b28778c1e6c05bf0b9f51db")
!376 = !DIDerivedType(tag: DW_TAG_typedef, name: "__kernel_ulong_t", file: !375, line: 16, baseType: !45)
!377 = !DILocalVariable(name: "size", arg: 1, scope: !370, file: !12, line: 718, type: !373)
!378 = !DILocation(line: 718, column: 52, scope: !370)
!379 = !DILocalVariable(name: "flags", arg: 2, scope: !370, file: !12, line: 718, type: !29)
!380 = !DILocation(line: 718, column: 64, scope: !370)
!381 = !DILocation(line: 720, column: 17, scope: !370)
!382 = !DILocation(line: 720, column: 23, scope: !370)
!383 = !DILocation(line: 720, column: 29, scope: !370)
!384 = !DILocalVariable(name: "size", arg: 1, scope: !385, file: !12, line: 590, type: !373)
!385 = distinct !DISubprogram(name: "kmalloc", scope: !12, file: !12, line: 590, type: !371, scopeLine: 591, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !78)
!386 = !DILocation(line: 590, column: 61, scope: !385, inlinedAt: !387)
!387 = distinct !DILocation(line: 720, column: 9, scope: !370)
!388 = !DILocalVariable(name: "flags", arg: 2, scope: !385, file: !12, line: 590, type: !29)
!389 = !DILocation(line: 590, column: 73, scope: !385, inlinedAt: !387)
!390 = !DILocation(line: 592, column: 27, scope: !391, inlinedAt: !387)
!391 = distinct !DILexicalBlock(scope: !385, file: !12, line: 592, column: 6)
!392 = !DILocation(line: 592, column: 6, scope: !391, inlinedAt: !387)
!393 = !DILocation(line: 592, column: 33, scope: !391, inlinedAt: !387)
!394 = !DILocation(line: 592, column: 36, scope: !391, inlinedAt: !387)
!395 = !DILocation(line: 592, column: 6, scope: !385, inlinedAt: !387)
!396 = !DILocalVariable(name: "index", scope: !397, file: !12, line: 593, type: !7)
!397 = distinct !DILexicalBlock(scope: !391, file: !12, line: 592, column: 42)
!398 = !DILocation(line: 593, column: 16, scope: !397, inlinedAt: !387)
!399 = !DILocation(line: 595, column: 7, scope: !400, inlinedAt: !387)
!400 = distinct !DILexicalBlock(scope: !397, file: !12, line: 595, column: 7)
!401 = !DILocation(line: 595, column: 12, scope: !400, inlinedAt: !387)
!402 = !DILocation(line: 595, column: 7, scope: !397, inlinedAt: !387)
!403 = !DILocation(line: 596, column: 25, scope: !400, inlinedAt: !387)
!404 = !DILocation(line: 596, column: 31, scope: !400, inlinedAt: !387)
!405 = !DILocation(line: 596, column: 11, scope: !400, inlinedAt: !387)
!406 = !DILocation(line: 596, column: 4, scope: !400, inlinedAt: !387)
!407 = !DILocation(line: 598, column: 11, scope: !397, inlinedAt: !387)
!408 = !DILocalVariable(name: "size", arg: 1, scope: !409, file: !12, line: 443, type: !373)
!409 = distinct !DISubprogram(name: "__kmalloc_index", scope: !12, file: !12, line: 443, type: !410, scopeLine: 445, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !78)
!410 = !DISubroutineType(types: !411)
!411 = !{!7, !373, !412}
!412 = !DIDerivedType(tag: DW_TAG_typedef, name: "bool", file: !30, line: 35, baseType: !413)
!413 = !DIBasicType(name: "_Bool", size: 8, encoding: DW_ATE_boolean)
!414 = !DILocation(line: 443, column: 60, scope: !409, inlinedAt: !415)
!415 = distinct !DILocation(line: 598, column: 11, scope: !397, inlinedAt: !387)
!416 = !DILocalVariable(name: "size_is_constant", arg: 2, scope: !409, file: !12, line: 444, type: !412)
!417 = !DILocation(line: 444, column: 16, scope: !409, inlinedAt: !415)
!418 = !DILocation(line: 446, column: 7, scope: !419, inlinedAt: !415)
!419 = distinct !DILexicalBlock(scope: !409, file: !12, line: 446, column: 6)
!420 = !DILocation(line: 446, column: 6, scope: !409, inlinedAt: !415)
!421 = !DILocation(line: 447, column: 3, scope: !419, inlinedAt: !415)
!422 = !DILocation(line: 449, column: 6, scope: !423, inlinedAt: !415)
!423 = distinct !DILexicalBlock(scope: !409, file: !12, line: 449, column: 6)
!424 = !DILocation(line: 449, column: 11, scope: !423, inlinedAt: !415)
!425 = !DILocation(line: 449, column: 6, scope: !409, inlinedAt: !415)
!426 = !DILocation(line: 450, column: 3, scope: !423, inlinedAt: !415)
!427 = !DILocation(line: 452, column: 32, scope: !428, inlinedAt: !415)
!428 = distinct !DILexicalBlock(scope: !409, file: !12, line: 452, column: 6)
!429 = !DILocation(line: 452, column: 37, scope: !428, inlinedAt: !415)
!430 = !DILocation(line: 452, column: 42, scope: !428, inlinedAt: !415)
!431 = !DILocation(line: 452, column: 45, scope: !428, inlinedAt: !415)
!432 = !DILocation(line: 452, column: 50, scope: !428, inlinedAt: !415)
!433 = !DILocation(line: 452, column: 6, scope: !409, inlinedAt: !415)
!434 = !DILocation(line: 453, column: 3, scope: !428, inlinedAt: !415)
!435 = !DILocation(line: 454, column: 32, scope: !436, inlinedAt: !415)
!436 = distinct !DILexicalBlock(scope: !409, file: !12, line: 454, column: 6)
!437 = !DILocation(line: 454, column: 37, scope: !436, inlinedAt: !415)
!438 = !DILocation(line: 454, column: 43, scope: !436, inlinedAt: !415)
!439 = !DILocation(line: 454, column: 46, scope: !436, inlinedAt: !415)
!440 = !DILocation(line: 454, column: 51, scope: !436, inlinedAt: !415)
!441 = !DILocation(line: 454, column: 6, scope: !409, inlinedAt: !415)
!442 = !DILocation(line: 455, column: 3, scope: !436, inlinedAt: !415)
!443 = !DILocation(line: 456, column: 6, scope: !444, inlinedAt: !415)
!444 = distinct !DILexicalBlock(scope: !409, file: !12, line: 456, column: 6)
!445 = !DILocation(line: 456, column: 11, scope: !444, inlinedAt: !415)
!446 = !DILocation(line: 456, column: 6, scope: !409, inlinedAt: !415)
!447 = !DILocation(line: 456, column: 26, scope: !444, inlinedAt: !415)
!448 = !DILocation(line: 457, column: 6, scope: !449, inlinedAt: !415)
!449 = distinct !DILexicalBlock(scope: !409, file: !12, line: 457, column: 6)
!450 = !DILocation(line: 457, column: 11, scope: !449, inlinedAt: !415)
!451 = !DILocation(line: 457, column: 6, scope: !409, inlinedAt: !415)
!452 = !DILocation(line: 457, column: 26, scope: !449, inlinedAt: !415)
!453 = !DILocation(line: 458, column: 6, scope: !454, inlinedAt: !415)
!454 = distinct !DILexicalBlock(scope: !409, file: !12, line: 458, column: 6)
!455 = !DILocation(line: 458, column: 11, scope: !454, inlinedAt: !415)
!456 = !DILocation(line: 458, column: 6, scope: !409, inlinedAt: !415)
!457 = !DILocation(line: 458, column: 26, scope: !454, inlinedAt: !415)
!458 = !DILocation(line: 459, column: 6, scope: !459, inlinedAt: !415)
!459 = distinct !DILexicalBlock(scope: !409, file: !12, line: 459, column: 6)
!460 = !DILocation(line: 459, column: 11, scope: !459, inlinedAt: !415)
!461 = !DILocation(line: 459, column: 6, scope: !409, inlinedAt: !415)
!462 = !DILocation(line: 459, column: 26, scope: !459, inlinedAt: !415)
!463 = !DILocation(line: 460, column: 6, scope: !464, inlinedAt: !415)
!464 = distinct !DILexicalBlock(scope: !409, file: !12, line: 460, column: 6)
!465 = !DILocation(line: 460, column: 11, scope: !464, inlinedAt: !415)
!466 = !DILocation(line: 460, column: 6, scope: !409, inlinedAt: !415)
!467 = !DILocation(line: 460, column: 26, scope: !464, inlinedAt: !415)
!468 = !DILocation(line: 461, column: 6, scope: !469, inlinedAt: !415)
!469 = distinct !DILexicalBlock(scope: !409, file: !12, line: 461, column: 6)
!470 = !DILocation(line: 461, column: 11, scope: !469, inlinedAt: !415)
!471 = !DILocation(line: 461, column: 6, scope: !409, inlinedAt: !415)
!472 = !DILocation(line: 461, column: 26, scope: !469, inlinedAt: !415)
!473 = !DILocation(line: 462, column: 6, scope: !474, inlinedAt: !415)
!474 = distinct !DILexicalBlock(scope: !409, file: !12, line: 462, column: 6)
!475 = !DILocation(line: 462, column: 11, scope: !474, inlinedAt: !415)
!476 = !DILocation(line: 462, column: 6, scope: !409, inlinedAt: !415)
!477 = !DILocation(line: 462, column: 26, scope: !474, inlinedAt: !415)
!478 = !DILocation(line: 463, column: 6, scope: !479, inlinedAt: !415)
!479 = distinct !DILexicalBlock(scope: !409, file: !12, line: 463, column: 6)
!480 = !DILocation(line: 463, column: 11, scope: !479, inlinedAt: !415)
!481 = !DILocation(line: 463, column: 6, scope: !409, inlinedAt: !415)
!482 = !DILocation(line: 463, column: 26, scope: !479, inlinedAt: !415)
!483 = !DILocation(line: 464, column: 6, scope: !484, inlinedAt: !415)
!484 = distinct !DILexicalBlock(scope: !409, file: !12, line: 464, column: 6)
!485 = !DILocation(line: 464, column: 11, scope: !484, inlinedAt: !415)
!486 = !DILocation(line: 464, column: 6, scope: !409, inlinedAt: !415)
!487 = !DILocation(line: 464, column: 26, scope: !484, inlinedAt: !415)
!488 = !DILocation(line: 465, column: 6, scope: !489, inlinedAt: !415)
!489 = distinct !DILexicalBlock(scope: !409, file: !12, line: 465, column: 6)
!490 = !DILocation(line: 465, column: 11, scope: !489, inlinedAt: !415)
!491 = !DILocation(line: 465, column: 6, scope: !409, inlinedAt: !415)
!492 = !DILocation(line: 465, column: 26, scope: !489, inlinedAt: !415)
!493 = !DILocation(line: 466, column: 6, scope: !494, inlinedAt: !415)
!494 = distinct !DILexicalBlock(scope: !409, file: !12, line: 466, column: 6)
!495 = !DILocation(line: 466, column: 11, scope: !494, inlinedAt: !415)
!496 = !DILocation(line: 466, column: 6, scope: !409, inlinedAt: !415)
!497 = !DILocation(line: 466, column: 26, scope: !494, inlinedAt: !415)
!498 = !DILocation(line: 467, column: 6, scope: !499, inlinedAt: !415)
!499 = distinct !DILexicalBlock(scope: !409, file: !12, line: 467, column: 6)
!500 = !DILocation(line: 467, column: 11, scope: !499, inlinedAt: !415)
!501 = !DILocation(line: 467, column: 6, scope: !409, inlinedAt: !415)
!502 = !DILocation(line: 467, column: 26, scope: !499, inlinedAt: !415)
!503 = !DILocation(line: 468, column: 6, scope: !504, inlinedAt: !415)
!504 = distinct !DILexicalBlock(scope: !409, file: !12, line: 468, column: 6)
!505 = !DILocation(line: 468, column: 11, scope: !504, inlinedAt: !415)
!506 = !DILocation(line: 468, column: 6, scope: !409, inlinedAt: !415)
!507 = !DILocation(line: 468, column: 26, scope: !504, inlinedAt: !415)
!508 = !DILocation(line: 469, column: 6, scope: !509, inlinedAt: !415)
!509 = distinct !DILexicalBlock(scope: !409, file: !12, line: 469, column: 6)
!510 = !DILocation(line: 469, column: 11, scope: !509, inlinedAt: !415)
!511 = !DILocation(line: 469, column: 6, scope: !409, inlinedAt: !415)
!512 = !DILocation(line: 469, column: 26, scope: !509, inlinedAt: !415)
!513 = !DILocation(line: 470, column: 6, scope: !514, inlinedAt: !415)
!514 = distinct !DILexicalBlock(scope: !409, file: !12, line: 470, column: 6)
!515 = !DILocation(line: 470, column: 11, scope: !514, inlinedAt: !415)
!516 = !DILocation(line: 470, column: 6, scope: !409, inlinedAt: !415)
!517 = !DILocation(line: 470, column: 26, scope: !514, inlinedAt: !415)
!518 = !DILocation(line: 471, column: 6, scope: !519, inlinedAt: !415)
!519 = distinct !DILexicalBlock(scope: !409, file: !12, line: 471, column: 6)
!520 = !DILocation(line: 471, column: 11, scope: !519, inlinedAt: !415)
!521 = !DILocation(line: 471, column: 6, scope: !409, inlinedAt: !415)
!522 = !DILocation(line: 471, column: 26, scope: !519, inlinedAt: !415)
!523 = !DILocation(line: 472, column: 6, scope: !524, inlinedAt: !415)
!524 = distinct !DILexicalBlock(scope: !409, file: !12, line: 472, column: 6)
!525 = !DILocation(line: 472, column: 11, scope: !524, inlinedAt: !415)
!526 = !DILocation(line: 472, column: 6, scope: !409, inlinedAt: !415)
!527 = !DILocation(line: 472, column: 26, scope: !524, inlinedAt: !415)
!528 = !DILocation(line: 473, column: 6, scope: !529, inlinedAt: !415)
!529 = distinct !DILexicalBlock(scope: !409, file: !12, line: 473, column: 6)
!530 = !DILocation(line: 473, column: 11, scope: !529, inlinedAt: !415)
!531 = !DILocation(line: 473, column: 6, scope: !409, inlinedAt: !415)
!532 = !DILocation(line: 473, column: 27, scope: !529, inlinedAt: !415)
!533 = !DILocation(line: 474, column: 6, scope: !534, inlinedAt: !415)
!534 = distinct !DILexicalBlock(scope: !409, file: !12, line: 474, column: 6)
!535 = !DILocation(line: 474, column: 11, scope: !534, inlinedAt: !415)
!536 = !DILocation(line: 474, column: 6, scope: !409, inlinedAt: !415)
!537 = !DILocation(line: 474, column: 32, scope: !534, inlinedAt: !415)
!538 = !DILocation(line: 476, column: 50, scope: !539, inlinedAt: !415)
!539 = distinct !DILexicalBlock(scope: !409, file: !12, line: 476, column: 6)
!540 = !DILocation(line: 476, column: 6, scope: !409, inlinedAt: !415)
!541 = !DILocation(line: 482, column: 2, scope: !409, inlinedAt: !415)
!542 = !DILocation(line: 479, column: 3, scope: !543, inlinedAt: !415)
!543 = distinct !DILexicalBlock(scope: !544, file: !12, line: 479, column: 3)
!544 = distinct !DILexicalBlock(scope: !539, file: !12, line: 479, column: 3)
!545 = !{i64 2152116748, i64 2152116777, i64 2152116823, i64 2152116881, i64 2152116935, i64 2152116989, i64 2152117044, i64 2152117075}
!546 = !DILocation(line: 479, column: 3, scope: !544, inlinedAt: !415)
!547 = !DILocation(line: 483, column: 1, scope: !409, inlinedAt: !415)
!548 = !DILocation(line: 598, column: 9, scope: !397, inlinedAt: !387)
!549 = !DILocation(line: 600, column: 33, scope: !397, inlinedAt: !387)
!550 = !DILocation(line: 600, column: 40, scope: !397, inlinedAt: !387)
!551 = !DILocalVariable(name: "flags", arg: 1, scope: !552, file: !12, line: 400, type: !29)
!552 = distinct !DISubprogram(name: "kmalloc_type", scope: !12, file: !12, line: 400, type: !553, scopeLine: 401, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !78)
!553 = !DISubroutineType(types: !554)
!554 = !{!11, !29, !45}
!555 = !DILocation(line: 400, column: 67, scope: !552, inlinedAt: !556)
!556 = distinct !DILocation(line: 600, column: 20, scope: !397, inlinedAt: !387)
!557 = !DILocalVariable(name: "caller", arg: 2, scope: !552, file: !12, line: 400, type: !45)
!558 = !DILocation(line: 400, column: 88, scope: !552, inlinedAt: !556)
!559 = !DILocation(line: 406, column: 6, scope: !560, inlinedAt: !556)
!560 = distinct !DILexicalBlock(scope: !552, file: !12, line: 406, column: 6)
!561 = !DILocation(line: 406, column: 6, scope: !552, inlinedAt: !556)
!562 = !DILocation(line: 412, column: 3, scope: !560, inlinedAt: !556)
!563 = !DILocation(line: 422, column: 38, scope: !564, inlinedAt: !556)
!564 = distinct !DILexicalBlock(scope: !552, file: !12, line: 422, column: 6)
!565 = !DILocation(line: 422, column: 44, scope: !564, inlinedAt: !556)
!566 = !DILocation(line: 422, column: 6, scope: !552, inlinedAt: !556)
!567 = !DILocation(line: 423, column: 3, scope: !564, inlinedAt: !556)
!568 = !DILocation(line: 425, column: 3, scope: !569, inlinedAt: !556)
!569 = distinct !DILexicalBlock(scope: !552, file: !12, line: 424, column: 6)
!570 = !DILocation(line: 428, column: 1, scope: !552, inlinedAt: !556)
!571 = !DILocation(line: 600, column: 5, scope: !397, inlinedAt: !387)
!572 = !DILocation(line: 600, column: 51, scope: !397, inlinedAt: !387)
!573 = !DILocation(line: 601, column: 5, scope: !397, inlinedAt: !387)
!574 = !DILocation(line: 601, column: 12, scope: !397, inlinedAt: !387)
!575 = !DILocation(line: 599, column: 10, scope: !397, inlinedAt: !387)
!576 = !DILocation(line: 599, column: 3, scope: !397, inlinedAt: !387)
!577 = !DILocation(line: 603, column: 19, scope: !385, inlinedAt: !387)
!578 = !DILocation(line: 603, column: 25, scope: !385, inlinedAt: !387)
!579 = !DILocation(line: 603, column: 9, scope: !385, inlinedAt: !387)
!580 = !DILocation(line: 603, column: 2, scope: !385, inlinedAt: !387)
!581 = !DILocation(line: 604, column: 1, scope: !385, inlinedAt: !387)
!582 = !DILocation(line: 720, column: 2, scope: !370)
!583 = distinct !DISubprogram(name: "register_free_hook", scope: !3, file: !3, line: 160, type: !62, scopeLine: 161, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !78)
!584 = !DILocalVariable(name: "free_hook", arg: 1, scope: !583, file: !3, line: 160, type: !32)
!585 = !DILocation(line: 160, column: 31, scope: !583)
!586 = !DILocation(line: 162, column: 19, scope: !583)
!587 = !DILocation(line: 162, column: 17, scope: !583)
!588 = !DILocation(line: 163, column: 1, scope: !583)
!589 = distinct !DISubprogram(name: "register_alloc_hook", scope: !3, file: !3, line: 165, type: !62, scopeLine: 166, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !78)
!590 = !DILocalVariable(name: "alloc_hook", arg: 1, scope: !589, file: !3, line: 165, type: !32)
!591 = !DILocation(line: 165, column: 32, scope: !589)
!592 = !DILocation(line: 167, column: 20, scope: !589)
!593 = !DILocation(line: 167, column: 18, scope: !589)
!594 = !DILocation(line: 168, column: 1, scope: !589)
!595 = distinct !DISubprogram(name: "alloc_chunk", scope: !3, file: !3, line: 170, type: !596, scopeLine: 171, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !78)
!596 = !DISubroutineType(types: !597)
!597 = !{!32, !7}
!598 = !DILocalVariable(name: "size", arg: 1, scope: !595, file: !3, line: 170, type: !7)
!599 = !DILocation(line: 170, column: 32, scope: !595)
!600 = !DILocation(line: 172, column: 11, scope: !601)
!601 = distinct !DILexicalBlock(scope: !595, file: !3, line: 172, column: 6)
!602 = !DILocation(line: 172, column: 6, scope: !601)
!603 = !DILocation(line: 172, column: 6, scope: !595)
!604 = !DILocation(line: 173, column: 8, scope: !601)
!605 = !DILocation(line: 173, column: 19, scope: !601)
!606 = !DILocation(line: 173, column: 3, scope: !601)
!607 = !DILocalVariable(name: "ret", scope: !595, file: !3, line: 175, type: !32)
!608 = !DILocation(line: 175, column: 8, scope: !595)
!609 = !DILocalVariable(name: "index", scope: !595, file: !3, line: 176, type: !22)
!610 = !DILocation(line: 176, column: 6, scope: !595)
!611 = !DILocation(line: 176, column: 28, scope: !595)
!612 = !DILocation(line: 176, column: 14, scope: !595)
!613 = !DILocalVariable(name: "curr_entry", scope: !614, file: !3, line: 178, type: !37)
!614 = distinct !DILexicalBlock(scope: !595, file: !3, line: 178, column: 2)
!615 = !DILocation(line: 178, column: 28, scope: !614)
!616 = !DILocation(line: 178, column: 57, scope: !614)
!617 = !DILocation(line: 178, column: 41, scope: !614)
!618 = !DILocation(line: 178, column: 7, scope: !614)
!619 = !DILocation(line: 179, column: 7, scope: !620)
!620 = distinct !DILexicalBlock(scope: !614, file: !3, line: 178, column: 2)
!621 = !DILocation(line: 179, column: 18, scope: !620)
!622 = !DILocation(line: 178, column: 2, scope: !614)
!623 = !DILocation(line: 180, column: 7, scope: !624)
!624 = distinct !DILexicalBlock(scope: !625, file: !3, line: 180, column: 7)
!625 = distinct !DILexicalBlock(scope: !620, file: !3, line: 179, column: 58)
!626 = !DILocation(line: 180, column: 19, scope: !624)
!627 = !DILocation(line: 180, column: 28, scope: !624)
!628 = !DILocation(line: 180, column: 7, scope: !625)
!629 = !DILocation(line: 181, column: 10, scope: !630)
!630 = distinct !DILexicalBlock(scope: !624, file: !3, line: 180, column: 37)
!631 = !DILocation(line: 181, column: 22, scope: !630)
!632 = !DILocation(line: 181, column: 8, scope: !630)
!633 = !DILocation(line: 182, column: 27, scope: !630)
!634 = !DILocation(line: 182, column: 39, scope: !630)
!635 = !DILocation(line: 182, column: 49, scope: !630)
!636 = !DILocation(line: 182, column: 4, scope: !630)
!637 = !DILocation(line: 182, column: 16, scope: !630)
!638 = !DILocation(line: 182, column: 25, scope: !630)
!639 = !DILocation(line: 183, column: 4, scope: !630)
!640 = !DILocation(line: 185, column: 2, scope: !625)
!641 = !DILocation(line: 179, column: 40, scope: !620)
!642 = !DILocation(line: 179, column: 52, scope: !620)
!643 = !DILocation(line: 179, column: 38, scope: !620)
!644 = !DILocation(line: 178, column: 2, scope: !620)
!645 = distinct !{!645, !622, !646}
!646 = !DILocation(line: 185, column: 2, scope: !614)
!647 = !DILocation(line: 187, column: 6, scope: !648)
!648 = distinct !DILexicalBlock(scope: !595, file: !3, line: 187, column: 6)
!649 = !DILocation(line: 187, column: 10, scope: !648)
!650 = !DILocation(line: 187, column: 6, scope: !595)
!651 = !DILocalVariable(name: "new", scope: !652, file: !3, line: 188, type: !37)
!652 = distinct !DILexicalBlock(scope: !648, file: !3, line: 187, column: 19)
!653 = !DILocation(line: 188, column: 24, scope: !652)
!654 = !DILocation(line: 188, column: 42, scope: !652)
!655 = !DILocation(line: 188, column: 30, scope: !652)
!656 = !DILocation(line: 193, column: 31, scope: !652)
!657 = !DILocation(line: 193, column: 15, scope: !652)
!658 = !DILocation(line: 193, column: 3, scope: !652)
!659 = !DILocation(line: 193, column: 8, scope: !652)
!660 = !DILocation(line: 193, column: 13, scope: !652)
!661 = !DILocation(line: 194, column: 28, scope: !652)
!662 = !DILocation(line: 194, column: 19, scope: !652)
!663 = !DILocation(line: 194, column: 3, scope: !652)
!664 = !DILocation(line: 194, column: 26, scope: !652)
!665 = !DILocation(line: 195, column: 9, scope: !652)
!666 = !DILocation(line: 195, column: 14, scope: !652)
!667 = !DILocation(line: 195, column: 7, scope: !652)
!668 = !DILocation(line: 196, column: 19, scope: !652)
!669 = !DILocation(line: 196, column: 24, scope: !652)
!670 = !DILocation(line: 196, column: 34, scope: !652)
!671 = !DILocation(line: 196, column: 3, scope: !652)
!672 = !DILocation(line: 196, column: 8, scope: !652)
!673 = !DILocation(line: 196, column: 17, scope: !652)
!674 = !DILocation(line: 197, column: 2, scope: !652)
!675 = !DILocation(line: 203, column: 9, scope: !595)
!676 = !DILocation(line: 203, column: 2, scope: !595)
!677 = distinct !DISubprogram(name: "free_chunk", scope: !3, file: !3, line: 206, type: !62, scopeLine: 207, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !78)
!678 = !DILocalVariable(name: "chunk", arg: 1, scope: !677, file: !3, line: 206, type: !32)
!679 = !DILocation(line: 206, column: 23, scope: !677)
!680 = !DILocation(line: 208, column: 11, scope: !681)
!681 = distinct !DILexicalBlock(scope: !677, file: !3, line: 208, column: 6)
!682 = !DILocation(line: 208, column: 6, scope: !681)
!683 = !DILocation(line: 208, column: 6, scope: !677)
!684 = !DILocation(line: 209, column: 8, scope: !681)
!685 = !DILocation(line: 209, column: 18, scope: !681)
!686 = !DILocation(line: 209, column: 3, scope: !681)
!687 = !DILocalVariable(name: "page", scope: !677, file: !3, line: 211, type: !33)
!688 = !DILocation(line: 211, column: 17, scope: !677)
!689 = !DILocation(line: 211, column: 24, scope: !677)
!690 = !DILocalVariable(name: "i", scope: !691, file: !3, line: 213, type: !22)
!691 = distinct !DILexicalBlock(scope: !677, file: !3, line: 213, column: 2)
!692 = !DILocation(line: 213, column: 11, scope: !691)
!693 = !DILocation(line: 213, column: 7, scope: !691)
!694 = !DILocation(line: 213, column: 18, scope: !695)
!695 = distinct !DILexicalBlock(scope: !691, file: !3, line: 213, column: 2)
!696 = !DILocation(line: 213, column: 20, scope: !695)
!697 = !DILocation(line: 213, column: 2, scope: !691)
!698 = !DILocalVariable(name: "curr_entry", scope: !699, file: !3, line: 214, type: !37)
!699 = distinct !DILexicalBlock(scope: !700, file: !3, line: 214, column: 3)
!700 = distinct !DILexicalBlock(scope: !695, file: !3, line: 213, column: 34)
!701 = !DILocation(line: 214, column: 29, scope: !699)
!702 = !DILocation(line: 214, column: 58, scope: !699)
!703 = !DILocation(line: 214, column: 42, scope: !699)
!704 = !DILocation(line: 214, column: 8, scope: !699)
!705 = !DILocation(line: 215, column: 8, scope: !706)
!706 = distinct !DILexicalBlock(scope: !699, file: !3, line: 214, column: 3)
!707 = !DILocation(line: 215, column: 19, scope: !706)
!708 = !DILocation(line: 214, column: 3, scope: !699)
!709 = !DILocation(line: 216, column: 8, scope: !710)
!710 = distinct !DILexicalBlock(scope: !711, file: !3, line: 216, column: 8)
!711 = distinct !DILexicalBlock(scope: !706, file: !3, line: 215, column: 59)
!712 = !DILocation(line: 216, column: 16, scope: !710)
!713 = !DILocation(line: 216, column: 28, scope: !710)
!714 = !DILocation(line: 216, column: 13, scope: !710)
!715 = !DILocation(line: 216, column: 8, scope: !711)
!716 = !DILocation(line: 218, column: 6, scope: !717)
!717 = distinct !DILexicalBlock(scope: !710, file: !3, line: 216, column: 34)
!718 = !DILocation(line: 218, column: 18, scope: !717)
!719 = !DILocation(line: 217, column: 24, scope: !717)
!720 = !DILocation(line: 217, column: 6, scope: !717)
!721 = !DILocation(line: 217, column: 32, scope: !717)
!722 = !DILocation(line: 217, column: 37, scope: !717)
!723 = !DILocation(line: 219, column: 28, scope: !717)
!724 = !DILocation(line: 219, column: 5, scope: !717)
!725 = !DILocation(line: 219, column: 17, scope: !717)
!726 = !DILocation(line: 219, column: 26, scope: !717)
!727 = !DILocation(line: 227, column: 5, scope: !717)
!728 = !DILocation(line: 229, column: 3, scope: !711)
!729 = !DILocation(line: 215, column: 41, scope: !706)
!730 = !DILocation(line: 215, column: 53, scope: !706)
!731 = !DILocation(line: 215, column: 39, scope: !706)
!732 = !DILocation(line: 214, column: 3, scope: !706)
!733 = distinct !{!733, !708, !734}
!734 = !DILocation(line: 229, column: 3, scope: !699)
!735 = !DILocation(line: 230, column: 2, scope: !700)
!736 = !DILocation(line: 213, column: 30, scope: !695)
!737 = !DILocation(line: 213, column: 2, scope: !695)
!738 = distinct !{!738, !697, !739}
!739 = !DILocation(line: 230, column: 2, scope: !691)
!740 = !DILocation(line: 232, column: 2, scope: !677)
