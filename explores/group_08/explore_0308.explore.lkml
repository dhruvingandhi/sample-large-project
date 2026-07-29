# Explore: explore_0308
# Auto-generated LookML Explore File

include: "/views/domain_25/view_00925.view.lkml"
include: "/views/domain_27/view_00927.view.lkml"
include: "/views/domain_28/view_00928.view.lkml"
include: "/views/domain_29/view_00929.view.lkml"

explore: explore_0308 {
  label: "Explore Explore 0308"
  description: "Comprehensive analytics explore joining base view_00925 with related tables."
  group_label: "Analytics Domain 09"
  
  view_name: view_00925
  
  always_filter: {
    filters: [view_00925.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_00925.created_at_date: "7 days"]
    unless: [view_00925.id, view_00925.status]
  }

  join: view_00927 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_00925.user_id} = ${view_00927.id} ;;
    required_joins: []
  }

  join: view_00928 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_00925.account_id} = ${view_00928.account_id} ;;
    required_joins: [view_00927]
  }

  join: view_00929 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_00925.category} = ${view_00929.category} ;;
  }

  access_filter: {
    field: view_00925.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_00925.is_deleted} = false ;;
}
