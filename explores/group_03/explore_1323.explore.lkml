# Explore: explore_1323
# Auto-generated LookML Explore File

include: "/views/domain_20/view_03970.view.lkml"
include: "/views/domain_22/view_03972.view.lkml"
include: "/views/domain_23/view_03973.view.lkml"
include: "/views/domain_24/view_03974.view.lkml"

explore: explore_1323 {
  label: "Explore Explore 1323"
  description: "Comprehensive analytics explore joining base view_03970 with related tables."
  group_label: "Analytics Domain 04"
  
  view_name: view_03970
  
  always_filter: {
    filters: [view_03970.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_03970.created_at_date: "7 days"]
    unless: [view_03970.id, view_03970.status]
  }

  join: view_03972 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_03970.user_id} = ${view_03972.id} ;;
    required_joins: []
  }

  join: view_03973 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_03970.account_id} = ${view_03973.account_id} ;;
    required_joins: [view_03972]
  }

  join: view_03974 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_03970.category} = ${view_03974.category} ;;
  }

  access_filter: {
    field: view_03970.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_03970.is_deleted} = false ;;
}
