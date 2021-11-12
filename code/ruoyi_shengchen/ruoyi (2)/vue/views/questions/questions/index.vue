<template>
  <div class="app-container">
    <el-form :model="queryParams" ref="queryForm" :inline="true" v-show="showSearch" label-width="68px">
      <el-form-item label="题目类型，选择判断填空简答编程" prop="type">
        <el-select v-model="queryParams.type" placeholder="请选择题目类型，选择判断填空简答编程" clearable size="small">
          <el-option label="请选择字典生成" value="" />
        </el-select>
      </el-form-item>
      <el-form-item label="课程ID" prop="classId">
        <el-input
          v-model="queryParams.classId"
          placeholder="请输入课程ID"
          clearable
          size="small"
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="知识点" prop="point">
        <el-input
          v-model="queryParams.point"
          placeholder="请输入知识点"
          clearable
          size="small"
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="出题人id" prop="setterid">
        <el-input
          v-model="queryParams.setterid"
          placeholder="请输入出题人id"
          clearable
          size="small"
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="是否删除" prop="isDelete">
        <el-input
          v-model="queryParams.isDelete"
          placeholder="请输入是否删除"
          clearable
          size="small"
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item>
        <el-button type="primary" icon="el-icon-search" size="mini" @click="handleQuery">搜索</el-button>
        <el-button icon="el-icon-refresh" size="mini" @click="resetQuery">重置</el-button>
      </el-form-item>
    </el-form>

    <el-row :gutter="10" class="mb8">
      <el-col :span="1.5">
        <el-button
          type="primary"
          plain
          icon="el-icon-plus"
          size="mini"
          @click="handleAdd"
          v-hasPermi="['questions:questions:add']"
        >新增</el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button
          type="success"
          plain
          icon="el-icon-edit"
          size="mini"
          :disabled="single"
          @click="handleUpdate"
          v-hasPermi="['questions:questions:edit']"
        >修改</el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button
          type="danger"
          plain
          icon="el-icon-delete"
          size="mini"
          :disabled="multiple"
          @click="handleDelete"
          v-hasPermi="['questions:questions:remove']"
        >删除</el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button
          type="warning"
          plain
          icon="el-icon-download"
          size="mini"
          @click="handleExport"
          v-hasPermi="['questions:questions:export']"
        >导出</el-button>
      </el-col>
      <right-toolbar :showSearch.sync="showSearch" @queryTable="getList"></right-toolbar>
    </el-row>

    <el-table v-loading="loading" :data="questionsList" @selection-change="handleSelectionChange">
      <el-table-column type="selection" width="55" align="center" />
      <el-table-column label="题目ID" align="center" prop="id" />
      <el-table-column label="题目类型，选择判断填空简答编程" align="center" prop="type" />
      <el-table-column label="题目内容" align="center" prop="content" />
      <el-table-column label="题目图片" align="center" prop="image" />
      <el-table-column label="课程ID" align="center" prop="classId" />
      <el-table-column label="知识点" align="center" prop="point" />
      <el-table-column label="答案" align="center" prop="answer" />
      <el-table-column label="出题人id" align="center" prop="setterid" />
      <el-table-column label="题目备注" align="center" prop="remark" />
      <el-table-column label="整题解析" align="center" prop="analysis" />
      <el-table-column label="是否删除" align="center" prop="isDelete" />
      <el-table-column label="A选项" align="center" prop="optionA" />
      <el-table-column label="B选项" align="center" prop="optionB" />
      <el-table-column label="C选项" align="center" prop="optionC" />
      <el-table-column label="D选项" align="center" prop="optionD" />
      <el-table-column label="操作" align="center" class-name="small-padding fixed-width">
        <template slot-scope="scope">
          <el-button
            size="mini"
            type="text"
            icon="el-icon-edit"
            @click="handleUpdate(scope.row)"
            v-hasPermi="['questions:questions:edit']"
          >修改</el-button>
          <el-button
            size="mini"
            type="text"
            icon="el-icon-delete"
            @click="handleDelete(scope.row)"
            v-hasPermi="['questions:questions:remove']"
          >删除</el-button>
        </template>
      </el-table-column>
    </el-table>
    
    <pagination
      v-show="total>0"
      :total="total"
      :page.sync="queryParams.pageNum"
      :limit.sync="queryParams.pageSize"
      @pagination="getList"
    />

    <!-- 添加或修改题库管理对话框 -->
    <el-dialog :title="title" :visible.sync="open" width="500px" append-to-body>
      <el-form ref="form" :model="form" :rules="rules" label-width="80px">
        <el-form-item label="题目类型，选择判断填空简答编程" prop="type">
          <el-select v-model="form.type" placeholder="请选择题目类型，选择判断填空简答编程">
            <el-option label="请选择字典生成" value="" />
          </el-select>
        </el-form-item>
        <el-form-item label="题目内容">
          <editor v-model="form.content" :min-height="192"/>
        </el-form-item>
        <el-form-item label="题目图片">
          <imageUpload v-model="form.image"/>
        </el-form-item>
        <el-form-item label="课程ID" prop="classId">
          <el-input v-model="form.classId" placeholder="请输入课程ID" />
        </el-form-item>
        <el-form-item label="知识点" prop="point">
          <el-input v-model="form.point" placeholder="请输入知识点" />
        </el-form-item>
        <el-form-item label="答案" prop="answer">
          <el-input v-model="form.answer" type="textarea" placeholder="请输入内容" />
        </el-form-item>
        <el-form-item label="出题人id" prop="setterid">
          <el-input v-model="form.setterid" placeholder="请输入出题人id" />
        </el-form-item>
        <el-form-item label="题目备注" prop="remark">
          <el-input v-model="form.remark" placeholder="请输入题目备注" />
        </el-form-item>
        <el-form-item label="整题解析" prop="analysis">
          <el-input v-model="form.analysis" type="textarea" placeholder="请输入内容" />
        </el-form-item>
        <el-form-item label="是否删除" prop="isDelete">
          <el-input v-model="form.isDelete" placeholder="请输入是否删除" />
        </el-form-item>
        <el-form-item label="A选项" prop="optionA">
          <el-input v-model="form.optionA" placeholder="请输入A选项" />
        </el-form-item>
        <el-form-item label="B选项" prop="optionB">
          <el-input v-model="form.optionB" placeholder="请输入B选项" />
        </el-form-item>
        <el-form-item label="C选项" prop="optionC">
          <el-input v-model="form.optionC" placeholder="请输入C选项" />
        </el-form-item>
        <el-form-item label="D选项" prop="optionD">
          <el-input v-model="form.optionD" placeholder="请输入D选项" />
        </el-form-item>
      </el-form>
      <div slot="footer" class="dialog-footer">
        <el-button type="primary" @click="submitForm">确 定</el-button>
        <el-button @click="cancel">取 消</el-button>
      </div>
    </el-dialog>
  </div>
</template>

<script>
import { listQuestions, getQuestions, delQuestions, addQuestions, updateQuestions } from "@/api/questions/questions";

export default {
  name: "Questions",
  data() {
    return {
      // 遮罩层
      loading: true,
      // 选中数组
      ids: [],
      // 非单个禁用
      single: true,
      // 非多个禁用
      multiple: true,
      // 显示搜索条件
      showSearch: true,
      // 总条数
      total: 0,
      // 题库管理表格数据
      questionsList: [],
      // 弹出层标题
      title: "",
      // 是否显示弹出层
      open: false,
      // 查询参数
      queryParams: {
        pageNum: 1,
        pageSize: 10,
        type: null,
        content: null,
        classId: null,
        point: null,
        answer: null,
        setterid: null,
        isDelete: null,
      },
      // 表单参数
      form: {},
      // 表单校验
      rules: {
        type: [
          { required: true, message: "题目类型，选择判断填空简答编程不能为空", trigger: "change" }
        ],
        content: [
          { required: true, message: "题目内容不能为空", trigger: "blur" }
        ],
        image: [
          { required: true, message: "题目图片不能为空", trigger: "blur" }
        ],
        classId: [
          { required: true, message: "课程ID不能为空", trigger: "blur" }
        ],
        point: [
          { required: true, message: "知识点不能为空", trigger: "blur" }
        ],
        answer: [
          { required: true, message: "答案不能为空", trigger: "blur" }
        ],
        setterid: [
          { required: true, message: "出题人id不能为空", trigger: "blur" }
        ],
        createTime: [
          { required: true, message: "创建时间不能为空", trigger: "blur" }
        ],
        updateTime: [
          { required: true, message: "更新时间不能为空", trigger: "blur" }
        ],
        remark: [
          { required: true, message: "题目备注不能为空", trigger: "blur" }
        ],
        analysis: [
          { required: true, message: "整题解析不能为空", trigger: "blur" }
        ],
        isDelete: [
          { required: true, message: "是否删除不能为空", trigger: "blur" }
        ],
      }
    };
  },
  created() {
    this.getList();
  },
  methods: {
    /** 查询题库管理列表 */
    getList() {
      this.loading = true;
      listQuestions(this.queryParams).then(response => {
        this.questionsList = response.rows;
        this.total = response.total;
        this.loading = false;
      });
    },
    // 取消按钮
    cancel() {
      this.open = false;
      this.reset();
    },
    // 表单重置
    reset() {
      this.form = {
        id: null,
        type: null,
        content: null,
        image: null,
        classId: null,
        point: null,
        answer: null,
        setterid: null,
        createTime: null,
        updateTime: null,
        remark: null,
        analysis: null,
        isDelete: null,
        optionA: null,
        optionB: null,
        optionC: null,
        optionD: null
      };
      this.resetForm("form");
    },
    /** 搜索按钮操作 */
    handleQuery() {
      this.queryParams.pageNum = 1;
      this.getList();
    },
    /** 重置按钮操作 */
    resetQuery() {
      this.resetForm("queryForm");
      this.handleQuery();
    },
    // 多选框选中数据
    handleSelectionChange(selection) {
      this.ids = selection.map(item => item.id)
      this.single = selection.length!==1
      this.multiple = !selection.length
    },
    /** 新增按钮操作 */
    handleAdd() {
      this.reset();
      this.open = true;
      this.title = "添加题库管理";
    },
    /** 修改按钮操作 */
    handleUpdate(row) {
      this.reset();
      const id = row.id || this.ids
      getQuestions(id).then(response => {
        this.form = response.data;
        this.open = true;
        this.title = "修改题库管理";
      });
    },
    /** 提交按钮 */
    submitForm() {
      this.$refs["form"].validate(valid => {
        if (valid) {
          if (this.form.id != null) {
            updateQuestions(this.form).then(response => {
              this.$modal.msgSuccess("修改成功");
              this.open = false;
              this.getList();
            });
          } else {
            addQuestions(this.form).then(response => {
              this.$modal.msgSuccess("新增成功");
              this.open = false;
              this.getList();
            });
          }
        }
      });
    },
    /** 删除按钮操作 */
    handleDelete(row) {
      const ids = row.id || this.ids;
      this.$modal.confirm('是否确认删除题库管理编号为"' + ids + '"的数据项？').then(function() {
        return delQuestions(ids);
      }).then(() => {
        this.getList();
        this.$modal.msgSuccess("删除成功");
      }).catch(() => {});
    },
    /** 导出按钮操作 */
    handleExport() {
      this.download('questions/questions/export', {
        ...this.queryParams
      }, `questions_questions.xlsx`)
    }
  }
};
</script>