# Explore: explore_1254
# Auto-generated LookML Explore File

include: "/views/domain_13/view_03763.view.lkml"
include: "/views/domain_15/view_03765.view.lkml"
include: "/views/domain_16/view_03766.view.lkml"
include: "/views/domain_17/view_03767.view.lkml"

explore: explore_1254 {
  label: "Explore Explore 1254"
  description: "Comprehensive analytics explore joining base view_03763 with related tables."
  group_label: "Analytics Domain 15"
  
  view_name: view_03763
  
  always_filter: {
    filters: [view_03763.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_03763.created_at_date: "7 days"]
    unless: [view_03763.id, view_03763.status]
  }

  join: view_03765 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_03763.user_id} = ${view_03765.id} ;;
    required_joins: []
  }

  join: view_03766 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_03763.account_id} = ${view_03766.account_id} ;;
    required_joins: [view_03765]
  }

  join: view_03767 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_03763.category} = ${view_03767.category} ;;
  }

  access_filter: {
    field: view_03763.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_03763.is_deleted} = false ;;
}
