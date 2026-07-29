# Explore: explore_2936
# Auto-generated LookML Explore File

include: "/views/domain_09/view_08809.view.lkml"
include: "/views/domain_11/view_08811.view.lkml"
include: "/views/domain_12/view_08812.view.lkml"
include: "/views/domain_13/view_08813.view.lkml"

explore: explore_2936 {
  label: "Explore Explore 2936"
  description: "Comprehensive analytics explore joining base view_08809 with related tables."
  group_label: "Analytics Domain 17"
  
  view_name: view_08809
  
  always_filter: {
    filters: [view_08809.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_08809.created_at_date: "7 days"]
    unless: [view_08809.id, view_08809.status]
  }

  join: view_08811 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_08809.user_id} = ${view_08811.id} ;;
    required_joins: []
  }

  join: view_08812 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_08809.account_id} = ${view_08812.account_id} ;;
    required_joins: [view_08811]
  }

  join: view_08813 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_08809.category} = ${view_08813.category} ;;
  }

  access_filter: {
    field: view_08809.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_08809.is_deleted} = false ;;
}
