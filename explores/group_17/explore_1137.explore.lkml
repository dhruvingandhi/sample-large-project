# Explore: explore_1137
# Auto-generated LookML Explore File

include: "/views/domain_12/view_03412.view.lkml"
include: "/views/domain_14/view_03414.view.lkml"
include: "/views/domain_15/view_03415.view.lkml"
include: "/views/domain_16/view_03416.view.lkml"

explore: explore_1137 {
  label: "Explore Explore 1137"
  description: "Comprehensive analytics explore joining base view_03412 with related tables."
  group_label: "Analytics Domain 18"
  
  view_name: view_03412
  
  always_filter: {
    filters: [view_03412.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_03412.created_at_date: "7 days"]
    unless: [view_03412.id, view_03412.status]
  }

  join: view_03414 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_03412.user_id} = ${view_03414.id} ;;
    required_joins: []
  }

  join: view_03415 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_03412.account_id} = ${view_03415.account_id} ;;
    required_joins: [view_03414]
  }

  join: view_03416 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_03412.category} = ${view_03416.category} ;;
  }

  access_filter: {
    field: view_03412.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_03412.is_deleted} = false ;;
}
