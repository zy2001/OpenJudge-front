<template>
  <el-main>
    <template>
      <el-carousel :interval="2000" height="400px" class="carousel">
        <el-carousel-item v-for="item in message" :key="item" class="carousel_context">
          <h3>{{ item }}</h3>
        </el-carousel-item>
      </el-carousel>
    </template>
  </el-main>
</template>

<script>

export default {
  data() {
    return {
      message: ["Welcome To", "OPENJUDGE", "Online Judge System"]
    };
  },
  methods: {}
};
</script>

<style scoped>
.el-carousel__item h3 {
  color: #475669;
  font-size: 80px;
  text-align: center;
  padding-top: 70px;
  opacity: 0.75;
  line-height: 200px;
  margin: 0;
}

.el-carousel__item:nth-child(2n) {
  background-color: #99a9bf;
}

.el-carousel__item:nth-child(2n + 1) {
  background-color: #d3dce6;
}

.carousel {
  padding-top: 80px;
}
</style>

