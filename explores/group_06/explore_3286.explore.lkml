# Explore: explore_3286
# Auto-generated LookML Explore File

include: "/views/domain_09/view_09859.view.lkml"
include: "/views/domain_11/view_09861.view.lkml"
include: "/views/domain_12/view_09862.view.lkml"
include: "/views/domain_13/view_09863.view.lkml"

explore: explore_3286 {
  label: "Explore Explore 3286"
  description: "Comprehensive analytics explore joining base view_09859 with related tables."
  group_label: "Analytics Domain 07"
  
  view_name: view_09859
  
  always_filter: {
    filters: [view_09859.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_09859.created_at_date: "7 days"]
    unless: [view_09859.id, view_09859.status]
  }

  join: view_09861 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_09859.user_id} = ${view_09861.id} ;;
    required_joins: []
  }

  join: view_09862 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_09859.account_id} = ${view_09862.account_id} ;;
    required_joins: [view_09861]
  }

  join: view_09863 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_09859.category} = ${view_09863.category} ;;
  }

  access_filter: {
    field: view_09859.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_09859.is_deleted} = false ;;
}
