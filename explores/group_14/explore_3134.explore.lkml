# Explore: explore_3134
# Auto-generated LookML Explore File

include: "/views/domain_03/view_09403.view.lkml"
include: "/views/domain_05/view_09405.view.lkml"
include: "/views/domain_06/view_09406.view.lkml"
include: "/views/domain_07/view_09407.view.lkml"

explore: explore_3134 {
  label: "Explore Explore 3134"
  description: "Comprehensive analytics explore joining base view_09403 with related tables."
  group_label: "Analytics Domain 15"
  
  view_name: view_09403
  
  always_filter: {
    filters: [view_09403.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_09403.created_at_date: "7 days"]
    unless: [view_09403.id, view_09403.status]
  }

  join: view_09405 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_09403.user_id} = ${view_09405.id} ;;
    required_joins: []
  }

  join: view_09406 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_09403.account_id} = ${view_09406.account_id} ;;
    required_joins: [view_09405]
  }

  join: view_09407 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_09403.category} = ${view_09407.category} ;;
  }

  access_filter: {
    field: view_09403.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_09403.is_deleted} = false ;;
}
