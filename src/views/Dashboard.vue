<template>
  <div>
    <div>
      <h3>Created Items</h3>
      <created-item />
    </div>
    <div>
      <h3>Sold Items</h3>
      <sold-items />
    </div>
  </div>
</template>

<script>
import CreatedItem from "../components/DashboardCreatedItem.vue";
import SoldItems from "../components/SoldItems.vue";
export default {
  data() {
    return {};
  },
  components: { CreatedItem, SoldItems },
};
</script>

<style></style>
