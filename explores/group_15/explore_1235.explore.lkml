# Explore: explore_1235
# Auto-generated LookML Explore File

include: "/views/domain_06/view_03706.view.lkml"
include: "/views/domain_08/view_03708.view.lkml"
include: "/views/domain_09/view_03709.view.lkml"
include: "/views/domain_10/view_03710.view.lkml"

explore: explore_1235 {
  label: "Explore Explore 1235"
  description: "Comprehensive analytics explore joining base view_03706 with related tables."
  group_label: "Analytics Domain 16"
  
  view_name: view_03706
  
  always_filter: {
    filters: [view_03706.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_03706.created_at_date: "7 days"]
    unless: [view_03706.id, view_03706.status]
  }

  join: view_03708 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_03706.user_id} = ${view_03708.id} ;;
    required_joins: []
  }

  join: view_03709 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_03706.account_id} = ${view_03709.account_id} ;;
    required_joins: [view_03708]
  }

  join: view_03710 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_03706.category} = ${view_03710.category} ;;
  }

  access_filter: {
    field: view_03706.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_03706.is_deleted} = false ;;
}
