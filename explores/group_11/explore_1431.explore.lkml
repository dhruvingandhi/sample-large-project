# Explore: explore_1431
# Auto-generated LookML Explore File

include: "/views/domain_44/view_04294.view.lkml"
include: "/views/domain_46/view_04296.view.lkml"
include: "/views/domain_47/view_04297.view.lkml"
include: "/views/domain_48/view_04298.view.lkml"

explore: explore_1431 {
  label: "Explore Explore 1431"
  description: "Comprehensive analytics explore joining base view_04294 with related tables."
  group_label: "Analytics Domain 12"
  
  view_name: view_04294
  
  always_filter: {
    filters: [view_04294.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_04294.created_at_date: "7 days"]
    unless: [view_04294.id, view_04294.status]
  }

  join: view_04296 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_04294.user_id} = ${view_04296.id} ;;
    required_joins: []
  }

  join: view_04297 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_04294.account_id} = ${view_04297.account_id} ;;
    required_joins: [view_04296]
  }

  join: view_04298 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_04294.category} = ${view_04298.category} ;;
  }

  access_filter: {
    field: view_04294.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_04294.is_deleted} = false ;;
}
