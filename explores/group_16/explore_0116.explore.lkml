# Explore: explore_0116
# Auto-generated LookML Explore File

include: "/views/domain_49/view_00349.view.lkml"
include: "/views/domain_01/view_00351.view.lkml"
include: "/views/domain_02/view_00352.view.lkml"
include: "/views/domain_03/view_00353.view.lkml"

explore: explore_0116 {
  label: "Explore Explore 0116"
  description: "Comprehensive analytics explore joining base view_00349 with related tables."
  group_label: "Analytics Domain 17"
  
  view_name: view_00349
  
  always_filter: {
    filters: [view_00349.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_00349.created_at_date: "7 days"]
    unless: [view_00349.id, view_00349.status]
  }

  join: view_00351 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_00349.user_id} = ${view_00351.id} ;;
    required_joins: []
  }

  join: view_00352 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_00349.account_id} = ${view_00352.account_id} ;;
    required_joins: [view_00351]
  }

  join: view_00353 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_00349.category} = ${view_00353.category} ;;
  }

  access_filter: {
    field: view_00349.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_00349.is_deleted} = false ;;
}
