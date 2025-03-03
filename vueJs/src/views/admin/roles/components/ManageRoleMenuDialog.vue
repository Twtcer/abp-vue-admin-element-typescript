<template>
  <el-dialog
    v-el-draggable-dialog
    width="800px"
    :title="$t('AppPlatform.Menu:Manage')"
    :visible="showDialog"
    custom-class="modal-form"
    :close-on-click-modal="false"
    :close-on-press-escape="false"
    :show-close="false"
    @close="onFormClosed"
  >
    <el-form>
      <el-card>
        <el-form-item
          label-width="120px"
          :label="$t('AppPlatform.DisplayName:UIFramework')"
        >
          <el-select
            v-model="getMenuQuery.framework"
            style="width: 100%;"
            class="filter-item"
            clearable
            :placeholder="$t('pleaseSelectBy', {name: $t('AppPlatform.DisplayName:UIFramework')})"
            @change="onFrameworksChanged"
          >
            <el-option
              v-for="framework in uiFrameworks"
              :key="framework"
              :label="framework"
              :value="framework"
            />
          </el-select>
        </el-form-item>
        <el-form-item
          label-width="120px"
          :label="$t('AppPlatform.DisplayName:Menus')"
        >
          <el-tree
            ref="roleMenuTree"
            show-checkbox
            :check-strictly="true"
            node-key="id"
            :data="menus"
            :props="menuProps"
            :default-checked-keys="roleMenuIds"
          />
        </el-form-item>
      </el-card>
      <el-form-item>
        <el-button
          class="cancel"
          type="info"
          style="width:100px"
          @click="onFormClosed"
        >
          {{ $t('AbpUi.Cancel') }}
        </el-button>
        <el-button
          class="confirm"
          type="primary"
          style="width:100px"
          icon="el-icon-check"
          :loading="confirmButtonBusy"
          @click="onSave"
        >
          {{ confirmButtonTitle }}
        </el-button>
      </el-form-item>
    </el-form>
  </el-dialog>
</template>

<script lang="ts">
import { Component, Mixins, Prop, Watch } from 'vue-property-decorator'
import LocalizationMiXin from '@/mixins/LocalizationMiXin'
import DataService from '@/api/data-dictionary'
import MenuService, { Menu, GetAllMenu, RoleMenu } from '@/api/menu'
import { generateTree } from '@/utils'
import { Tree } from 'element-ui'

@Component({
  name: 'ManageRoleMenuDialog'
})
export default class ManageRoleMenuDialog extends Mixins(LocalizationMiXin) {
  @Prop({ default: false })
  private showDialog!: boolean

  @Prop({ default: '' })
  private roleName!: string

  private menus = new Array<Menu>()
  private roleMenuIds = new Array<string>()
  private getMenuQuery = new GetAllMenu()
  private uiFrameworks: string[] = []
  private confirmButtonBusy = false
  private menuProps = {
    children: 'children',
    label: 'displayName'
  }

  get confirmButtonTitle() {
    if (this.confirmButtonBusy) {
      return this.$t('AbpUi.SavingWithThreeDot')
    }
    return this.$t('AbpUi.Save')
  }

  @Watch('showDialog', { immediate: true })
  private onShowDialogChanged() {
    this.handleGetRoleMenus()
  }

  mounted() {
    this.getUIFrameworks()
  }

  private onFrameworksChanged() {
    this.handleGetMenus()
    this.handleGetRoleMenus()
  }

  private getUIFrameworks() {
    DataService
      .getByName('UI Framewark')
      .then(res => {
        this.uiFrameworks = res.items.map(item => item.name)
      })
  }

  private handleGetMenus() {
    MenuService
      .getAll(this.getMenuQuery)
      .then(res => {
        this.menus = generateTree(res.items)
      })
  }

  private handleGetRoleMenus() {
    if (this.showDialog && this.roleName) {
      MenuService
        .getRoleMenuList(this.roleName, this.getMenuQuery.framework)
        .then(res => {
          this.roleMenuIds = res.items.map(item => item.id)
        })
    } else {
      this.roleMenuIds.length = 0
    }
  }

  private onSave() {
    const roleMenuTree = this.$refs.roleMenuTree as Tree
    const roleMenu = new RoleMenu()
    roleMenu.roleName = this.roleName
    roleMenu.menuIds = roleMenuTree.getCheckedKeys()
    MenuService
      .setRoleMenu(roleMenu)
      .then(() => {
        this.$message.success(this.l('successful'))
        this.onFormClosed()
      })
  }

  private onFormClosed() {
    this.$nextTick(() => {
      const tree = this.$refs.roleMenuTree as Tree
      tree.setCheckedKeys([])
    })
    this.$emit('closed')
  }
}
</script>

<style lang="scss" scoped>
.confirm {
  position: absolute;
  margin-top: 10px;
  right: 0px;
}
.cancel {
  position: absolute;
  margin-top: 10px;
  right: 120px;
}
</style>
