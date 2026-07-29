# Explore: explore_1276
# Auto-generated LookML Explore File

include: "/views/domain_29/view_03829.view.lkml"
include: "/views/domain_31/view_03831.view.lkml"
include: "/views/domain_32/view_03832.view.lkml"
include: "/views/domain_33/view_03833.view.lkml"

explore: explore_1276 {
  label: "Explore Explore 1276"
  description: "Comprehensive analytics explore joining base view_03829 with related tables."
  group_label: "Analytics Domain 17"
  
  view_name: view_03829
  
  always_filter: {
    filters: [view_03829.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_03829.created_at_date: "7 days"]
    unless: [view_03829.id, view_03829.status]
  }

  join: view_03831 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_03829.user_id} = ${view_03831.id} ;;
    required_joins: []
  }

  join: view_03832 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_03829.account_id} = ${view_03832.account_id} ;;
    required_joins: [view_03831]
  }

  join: view_03833 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_03829.category} = ${view_03833.category} ;;
  }

  access_filter: {
    field: view_03829.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_03829.is_deleted} = false ;;
}
