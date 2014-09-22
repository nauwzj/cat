<style>
    .metric,
    .subCondition {
        margin-bottom: 5px;
    }

    .condition,
    .config {
        margin-bottom: 10px;
        border: 1px solid rgba(0, 0, 0, 0.2);
        border-radius: 6px;
        box-shadow: 0 5px 10px rgba(0, 0, 0, 0.2);
        margin-left: 20px;
    }
</style>
<form>
    规则ID(必填)： <input id="ruleId" type="text"/>
    <div id="configs">
        <strong class="text-success">监控规则配置：</strong>

        <div class="config">
            监控开始时间：<input name="startMinute" class="startMinute input-small" type=" text" placeholder="格式如 00:00"/>
            监控结束时间：<input name="endMinute" class="endMinute input-small" type=" text" placeholder="格式如 24:00"/>
            <br><br>

            <div class="condition">
                <p class="text-center text-success">监控条件</p>
                连续分钟：<input name="configMinute" class="configMinute input-mini" type="text"/>
                告警级别：<input name="level" class="level input-mini" type="text"/>
                <br>

                <p class="text-success">子条件</p>

                <div class="subconditions">
                    <div class="subCondition">
                        &nbsp;&nbsp;&nbsp;规则类型：
                        <select name="ruleType" class="ruleType">
                            <option value="DescVal">下降值</option>
                            <option value="DescPer">下降百分比</option>
                            <option value="AscVal">上升值</option>
                            <option value="AscPer">上升百分比</option>
                            <option value="MaxVal">最大值</option>
                            <option value="MinVal">最小值</option>
                            <option value="FluAscPer">波动上升百分比</option>
                            <option value="FluDescPer">波动下降百分比</option>
                        </select>
                        阈值：<input name="value" class="value input-mini" type="text"/>
                        <button class="btn btn-danger btn-small delete-subcondition-button" type="button">
                            删除子条件<i class="icon-trash icon-white"></i>
                        </button>
                    </div>
                </div>
                <button class="btn btn-success btn-small add-subCondition-button" type="button">
                    添加子条件<i class="icon-plus icon-white"></i>
                </button>
                <button class="btn btn-danger btn-small delete-condition-button" type="button">
                    删除监控条件<i class="icon-trash icon-white"></i>
                </button>
            </div>
            <button class="btn btn-success btn-small add-condition-button" type="button">
                添加监控条件<i class="icon-plus icon-white"></i>
            </button>
            <button class="btn btn-danger btn-small delete-config-button" type="button">
                删除监控规则<i class="icon-trash icon-white"></i>
            </button>
        </div>
    </div>
    <br>
    <button class="btn btn-success btn-small" id="add-config-button" type="button">
        添加监控规则<i class="icon-plus icon-white"></i>
    </button>
    <br>

    <br><br>
    <button class="btn btn-primary" id="modalSubmit" type="button" style="display:none">提交</button>
</form>

<script>
$(document).ready(function () {

    $("#configs").delegate(".add-subCondition-button", "click", function () {
        var newSubCondition = $('<div class="subCondition"> &nbsp;&nbsp;&nbsp;规则类型： <select name="ruleType" class="ruleType"> <option value="DescVal">下降值</option> <option value="DescPer">下降百分比</option> <option value="AscVal">上升值</option> <option value="AscPer">上升百分比</option> <option value="MaxVal">最大值</option> <option value="MinVal">最小值</option> <option value="FluAscPer">波动上升百分比</option> <option value="FluDescPer">波动下降百分比</option> </select> 阈值：<input name="value" class="value input-mini" type="text"/> <button class="btn btn-danger btn-small delete-subcondition-button" type="button"> 删除子条件<i class="icon-trash icon-white"></i> </button> </div>');
        $(this).prev().append(newSubCondition);
    })

    $("#configs").delegate(".add-condition-button", "click", function () {
        var newCondition = $('<div class="condition"> <p class="text-center text-success">监控条件</p> 连续分钟：<input name="configMinute" class="configMinute input-mini" type="text"/> 告警级别：<input name="level" class="level input-mini" type="text"/> <br> <p class="text-success">子条件</p> <div class="subconditions"> <div class="subCondition"> &nbsp;&nbsp;&nbsp;规则类型： <select name="ruleType" class="ruleType"> <option value="DescVal">下降值</option> <option value="DescPer">下降百分比</option> <option value="AscVal">上升值</option> <option value="AscPer">上升百分比</option> <option value="MaxVal">最大值</option> <option value="MinVal">最小值</option> <option value="FluAscPer">波动上升百分比</option> <option value="FluDescPer">波动下降百分比</option> </select> 阈值：<input name="value" class="value input-mini" type="text"/> <button class="btn btn-danger btn-small delete-subcondition-button" type="button"> 删除子条件<i class="icon-trash icon-white"></i> </button> </div> </div> <button class="btn btn-success btn-small add-subCondition-button" type="button"> 添加子条件<i class="icon-plus icon-white"></i> </button> <button class="btn btn-danger btn-small delete-condition-button" type="button"> 删除监控条件<i class="icon-trash icon-white"></i> </button> </div>');
        $(this).before(newCondition);
    })

    $("#configs").delegate(".delete-condition-button, .delete-subcondition-button, .delete-config-button", "click", function () {
        $(this).parent().remove();
    })

    $("#add-config-button").click(function () {
        var newConfig = $('<div class="config"> <strong class="text-success">监控规则：</strong> <br> 监控开始时间：<input name="startMinute" class="startMinute input-small" type=" text" placeholder="格式如 00:00"/> 监控结束时间：<input name="endMinute" class="endMinute input-small" type=" text" placeholder="格式如 24:00"/> <br><br> <div class="condition"> <p class="text-center text-success">监控条件</p> 连续分钟：<input name="configMinute" class="configMinute input-mini" type="text"/> 告警级别：<input name="level" class="level input-mini" type="text"/> <br> <p class="text-success">子条件</p> <div class="subconditions"> <div class="subCondition"> &nbsp;&nbsp;&nbsp;规则类型： <select name="ruleType" class="ruleType"> <option value="DescVal">下降值</option> <option value="DescPer">下降百分比</option> <option value="AscVal">上升值</option> <option value="AscPer">上升百分比</option> <option value="MaxVal">最大值</option> <option value="MinVal">最小值</option> <option value="FluAscPer">波动上升百分比</option> <option value="FluDescPer">波动下降百分比</option> </select> 阈值：<input name="value" class="value input-mini" type="text"/> <button class="btn btn-danger btn-small delete-subcondition-button" type="button"> 删除子条件<i class="icon-trash icon-white"></i> </button> </div> </div> <button class="btn btn-success btn-small add-subCondition-button" type="button"> 添加子条件<i class="icon-plus icon-white"></i> </button> <button class="btn btn-danger btn-small delete-condition-button" type="button"> 删除监控条件<i class="icon-trash icon-white"></i> </button> </div> <button class="btn btn-success btn-small add-condition-button" type="button"> 添加监控条件<i class="icon-plus icon-white"></i> </button> <button class="btn btn-danger btn-small delete-config-button" type="button"> 删除监控规则<i class="icon-trash icon-white"></i> </button> </div>');
        $("#configs").append(newConfig);
    })

    drawConfig();

    $("html").delegate("input[]")

    $("#modalSubmit").click(function () {
        var configStr = generateConfigJsonString();
        window.location.href="${link}&content="+configStr;
    })
})

function drawConfig() {
    var alertRuleText = '${rule}';
    var alertRule = {};
    
    if(alertRuleText == undefined || alertRuleText == ""){
    	return;
    }
    
    try {
        alertRule = JSON.parse(alertRuleText);
    } catch (e) {
        alert("读取规则错误！请刷新重试或联系leon.li@dianping.com");
        return;
    }

    var id = alertRule["id"];
    if (id != undefined) {
        $("#ruleId").val(id);
    }
    
    var configs = alertRule["configs"];
    if (configs != undefined) {
        for (count in configs) {
            var config = configs[count];
            if (count > 0) {
                $("#add-config-button").trigger("click");
            }

            var configForm = $(".config").last();
            var starttime = config["starttime"];
            var endtime = config["endtime"];
            var conditions = config["conditions"];

            if (starttime) {
                configForm.find(".startMinute").val(starttime);
            }
            if (endtime) {
                configForm.find(".endMinute").val(endtime);
            }
            if (conditions) {
                for (c in conditions) {
                    var condition = conditions[c];
                    var minute = condition["minute"];
                    var level = condition["alertType"];
                    var subconditions = condition["sub-conditions"];

                    if (c > 0) {
                        configForm.find(".add-condition-button").trigger("click");
                    }
                    var conditionForm = configForm.find(".condition").last();

                    if (minute) {
                        conditionForm.find(".configMinute").val(minute);
                    }
                    if (level) {
                        conditionForm.find(".level").val(level);
                    }
                    if (subconditions) {
                        for (cou in subconditions) {
                            var subcondition = subconditions[cou];
                            var type = subcondition["type"];
                            var text = subcondition["text"];

                            if (cou > 0) {
                                conditionForm.find(".add-subCondition-button").trigger("click");
                            }
                            var subconditionFrom = conditionForm.find(".subCondition").last();

                            if (type) {
                                subconditionFrom.find("option[value='" + type + "']").prop("selected", "selected");
                            }
                            if (text != undefined) {
                                subconditionFrom.find(".value").val(text);
                            }
                        }
                    }
                }
            }
        }
    }
}

function generateConfigJsonString() {
    var configModel = {};
    var id = $("#ruleId").val();
    if (id != "") {
        configModel["id"] = id;
    }

    var metricLength = $(".metric").length;
    if (metricLength > 0) {
        var metricList = [];
        $(".metric").each(function () {
            var metric = {};
            var hasPro = false;
            var productLineText = $(this).find(".productlineText").val();
            var metricText = $(this).find(".metricText").val()

            if (productLineText != "") {
                metric["productText"] = productLineText;
                hasPro = true;
            }
            if (metricText != "") {
                metric["metricItemText"] = metricText;
                hasPro = true;
            }
            if ($(this).find($("input[name='count']")).prop("checked") == true) {
                metric["monitorCount"] = true;
                hasPro = true;
            }
            if ($(this).find($("input[name='sum']")).prop("checked") == true) {
                metric["monitorSum"] = true;
                hasPro = true;
            }
            if ($(this).find($("input[name='avg']")).prop("checked") == true) {
                metric["monitorAvg"] = true;
                hasPro = true;
            }

            if (hasPro) {
                metricList.push(metric);
            }
        });
        if (metricList.length > 0) {
            configModel["metric-items"] = metricList;
        }
    }

    var configLength = $(".config").length;
    if (configLength > 0) {
        var configList = [];
        $(".config").each(function () {
            var config = {};
            var conditionList = [];
            var conditions = $(this).find(".condition");

            conditions.each(function () {
                var subconditions = [];

                $(this).find(".subCondition").each(function () {
                    var ruleType = $(this).find(".ruleType").val();
                    var ruleValue = $(this).find(".value").val();

                    if (ruleType != "" && ruleValue != "") {
                        var subcondition = {};
                        subcondition["type"] = ruleType;
                        subcondition["text"] = ruleValue;

                        subconditions.push(subcondition);
                    }
                })

                if (subconditions.length > 0) {
                    var condition = {}
                    var minute = $(this).find(".configMinute").val();
                    var alertType = $(this).find(".level").val();

                    condition["sub-conditions"] = subconditions;
                    if (minute != "") {
                        condition["minute"] = minute;
                    }
                    if (alertType != "") {
                        condition["alertType"] = alertType;
                    }
                    conditionList.push(condition);
                }
            })

            if (conditionList.length > 0) {
                config["conditions"] = conditionList;
                var starttime = $(this).find(".startMinute").val();
                var endtime = $(this).find(".endMinute").val();

                if (starttime != "") {
                    config["starttime"] = starttime;
                }
                if (endtime != "") {
                    config["endtime"] = endtime;
                }
                configList.push(config);
            }
        })
        if (configList.length > 0) {
            configModel["configs"] = configList;
        }
    }
    return JSON.stringify(configModel);
}
</script>