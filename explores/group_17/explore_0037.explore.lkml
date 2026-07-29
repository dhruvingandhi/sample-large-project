# Explore: explore_0037
# Auto-generated LookML Explore File

include: "/views/domain_12/view_00112.view.lkml"
include: "/views/domain_14/view_00114.view.lkml"
include: "/views/domain_15/view_00115.view.lkml"
include: "/views/domain_16/view_00116.view.lkml"

explore: explore_0037 {
  label: "Explore Explore 0037"
  description: "Comprehensive analytics explore joining base view_00112 with related tables."
  group_label: "Analytics Domain 18"
  
  view_name: view_00112
  
  always_filter: {
    filters: [view_00112.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_00112.created_at_date: "7 days"]
    unless: [view_00112.id, view_00112.status]
  }

  join: view_00114 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_00112.user_id} = ${view_00114.id} ;;
    required_joins: []
  }

  join: view_00115 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_00112.account_id} = ${view_00115.account_id} ;;
    required_joins: [view_00114]
  }

  join: view_00116 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_00112.category} = ${view_00116.category} ;;
  }

  access_filter: {
    field: view_00112.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_00112.is_deleted} = false ;;
}
