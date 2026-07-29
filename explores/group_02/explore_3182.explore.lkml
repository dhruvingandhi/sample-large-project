# Explore: explore_3182
# Auto-generated LookML Explore File

include: "/views/domain_47/view_09547.view.lkml"
include: "/views/domain_49/view_09549.view.lkml"
include: "/views/domain_50/view_09550.view.lkml"
include: "/views/domain_01/view_09551.view.lkml"

explore: explore_3182 {
  label: "Explore Explore 3182"
  description: "Comprehensive analytics explore joining base view_09547 with related tables."
  group_label: "Analytics Domain 03"
  
  view_name: view_09547
  
  always_filter: {
    filters: [view_09547.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_09547.created_at_date: "7 days"]
    unless: [view_09547.id, view_09547.status]
  }

  join: view_09549 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_09547.user_id} = ${view_09549.id} ;;
    required_joins: []
  }

  join: view_09550 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_09547.account_id} = ${view_09550.account_id} ;;
    required_joins: [view_09549]
  }

  join: view_09551 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_09547.category} = ${view_09551.category} ;;
  }

  access_filter: {
    field: view_09547.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_09547.is_deleted} = false ;;
}
