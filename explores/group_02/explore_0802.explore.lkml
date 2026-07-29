# Explore: explore_0802
# Auto-generated LookML Explore File

include: "/views/domain_07/view_02407.view.lkml"
include: "/views/domain_09/view_02409.view.lkml"
include: "/views/domain_10/view_02410.view.lkml"
include: "/views/domain_11/view_02411.view.lkml"

explore: explore_0802 {
  label: "Explore Explore 0802"
  description: "Comprehensive analytics explore joining base view_02407 with related tables."
  group_label: "Analytics Domain 03"
  
  view_name: view_02407
  
  always_filter: {
    filters: [view_02407.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_02407.created_at_date: "7 days"]
    unless: [view_02407.id, view_02407.status]
  }

  join: view_02409 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_02407.user_id} = ${view_02409.id} ;;
    required_joins: []
  }

  join: view_02410 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_02407.account_id} = ${view_02410.account_id} ;;
    required_joins: [view_02409]
  }

  join: view_02411 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_02407.category} = ${view_02411.category} ;;
  }

  access_filter: {
    field: view_02407.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_02407.is_deleted} = false ;;
}
