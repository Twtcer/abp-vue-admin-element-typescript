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
            @change="onFrameworkChanged"
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
            ref="userMenuTree"
            show-checkbox
            :check-strictly="true"
            node-key="id"
            :data="menus"
            :props="menuProps"
            :default-checked-keys="userMenuIds"
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
import MenuService, { Menu, GetAllMenu, UserMenu } from '@/api/menu'
import { generateTree } from '@/utils'
import { Tree } from 'element-ui'

@Component({
  name: 'ManageUserMenuDialog'
})
export default class ManageUserMenuDialog extends Mixins(LocalizationMiXin) {
  @Prop({ default: false })
  private showDialog!: boolean

  @Prop({ default: '' })
  private userId!: string

  private menus = new Array<Menu>()
  private uiFrameworks: string[] = []
  private userMenuIds = new Array<string>()
  private getMenuQuery = new GetAllMenu()
  private confirmButtonBusy = false
  private menuProps = {
    children: 'children',
    label: 'displayName'
  }

  get confirmButtonTitle() {
    if (this.confirmButtonBusy) {
      return this.l('AbpUi.SavingWithThreeDot')
    }
    return this.l('AbpUi.Save')
  }

  @Watch('showDialog', { immediate: true })
  private onShowDialogChanged() {
    this.handleGetUserMenus()
  }

  mounted() {
    this.getUIFrameworks()
  }

  private onFrameworkChanged() {
    this.handleGetMenus()
    this.handleGetUserMenus()
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

  private handleGetUserMenus() {
    if (this.showDialog && this.userId) {
      MenuService
        .getUserMenuList(this.userId, this.getMenuQuery.framework)
        .then(res => {
          this.userMenuIds = res.items.map(item => item.id)
        })
    } else {
      this.userMenuIds.length = 0
    }
  }

  private onSave() {
    const userMenuTree = this.$refs.userMenuTree as Tree
    const userMenu = new UserMenu()
    userMenu.userId = this.userId
    userMenu.menuIds = userMenuTree.getCheckedKeys()
    MenuService
      .setUserMenu(userMenu)
      .then(() => {
        this.$message.success(this.l('successful'))
        this.onFormClosed()
      })
  }

  private onFormClosed() {
    this.$nextTick(() => {
      const tree = this.$refs.userMenuTree as Tree
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
