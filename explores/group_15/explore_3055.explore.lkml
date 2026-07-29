# Explore: explore_3055
# Auto-generated LookML Explore File

include: "/views/domain_16/view_09166.view.lkml"
include: "/views/domain_18/view_09168.view.lkml"
include: "/views/domain_19/view_09169.view.lkml"
include: "/views/domain_20/view_09170.view.lkml"

explore: explore_3055 {
  label: "Explore Explore 3055"
  description: "Comprehensive analytics explore joining base view_09166 with related tables."
  group_label: "Analytics Domain 16"
  
  view_name: view_09166
  
  always_filter: {
    filters: [view_09166.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_09166.created_at_date: "7 days"]
    unless: [view_09166.id, view_09166.status]
  }

  join: view_09168 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_09166.user_id} = ${view_09168.id} ;;
    required_joins: []
  }

  join: view_09169 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_09166.account_id} = ${view_09169.account_id} ;;
    required_joins: [view_09168]
  }

  join: view_09170 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_09166.category} = ${view_09170.category} ;;
  }

  access_filter: {
    field: view_09166.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_09166.is_deleted} = false ;;
}
