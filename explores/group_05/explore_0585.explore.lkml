# Explore: explore_0585
# Auto-generated LookML Explore File

include: "/views/domain_06/view_01756.view.lkml"
include: "/views/domain_08/view_01758.view.lkml"
include: "/views/domain_09/view_01759.view.lkml"
include: "/views/domain_10/view_01760.view.lkml"

explore: explore_0585 {
  label: "Explore Explore 0585"
  description: "Comprehensive analytics explore joining base view_01756 with related tables."
  group_label: "Analytics Domain 06"
  
  view_name: view_01756
  
  always_filter: {
    filters: [view_01756.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_01756.created_at_date: "7 days"]
    unless: [view_01756.id, view_01756.status]
  }

  join: view_01758 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_01756.user_id} = ${view_01758.id} ;;
    required_joins: []
  }

  join: view_01759 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_01756.account_id} = ${view_01759.account_id} ;;
    required_joins: [view_01758]
  }

  join: view_01760 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_01756.category} = ${view_01760.category} ;;
  }

  access_filter: {
    field: view_01756.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_01756.is_deleted} = false ;;
}
