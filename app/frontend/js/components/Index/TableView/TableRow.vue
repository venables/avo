<template>
  <tr v-if="resource"
    class="hover:bg-gray-100 hover:shadow-row relative z-20"
    :resource-name="resourceName"
    :resource-id="resource.id"
  >
    <td class="w-10">
      <div class="flex justify-center h-full">
        <input type="checkbox"
          class="mx-3 w-4 h-4"
          @click="updateSelection(resource)"
        />
      </div>
    </td>
    <component
      v-for="(field, index) in fields"
      :key="uniqueKey(field, index)"
      :is="`index-${field.component}`"
      :field="field"
      :field-id="field.id"
      :field-component="field.component"
      :resource="resource"
      :resource-name="resourceName"
      :via-resource-name="viaResourceName"
      :via-resource-id="viaResourceId"
    />

    <td class="text-right whitespace-no-wrap px-2">
      <div class="flex items-center justify-end flex-grow-0 h-full w-full">
        <item-controls
          class="flex flex-row"
          :resource="resource"
          :resource-name="resourceName"
          :via-resource-name="viaResourceName"
          :via-resource-id="viaResourceId"
          :field="field"
          @resource-deleted="$emit('resource-deleted')"
        />
      </div>
    </td>
  </tr>
</template>

<script>
import { mapMutations } from 'vuex'
import ExtractsFields from '@/js/mixins/extracts-fields'
import HasUniqueKey from '@/js/mixins/has-unique-key'

export default {
  mixins: [HasUniqueKey, ExtractsFields],
  props: [
    'resource',
    'resourceName',
    'viaResourceName',
    'viaResourceId',
    'field',
  ],
  computed: {
    resourceFields() {
      if (this.resource
        && this.resource.fields
        && this.resource.fields.length > 0) return this.resource.fields

      return []
    },
  },
  methods: {
    ...mapMutations('index', [
      'updateSelection',
    ]),
  },
}
</script>
