# Explore: explore_0031
# Auto-generated LookML Explore File

include: "/views/domain_44/view_00094.view.lkml"
include: "/views/domain_46/view_00096.view.lkml"
include: "/views/domain_47/view_00097.view.lkml"
include: "/views/domain_48/view_00098.view.lkml"

explore: explore_0031 {
  label: "Explore Explore 0031"
  description: "Comprehensive analytics explore joining base view_00094 with related tables."
  group_label: "Analytics Domain 12"
  
  view_name: view_00094
  
  always_filter: {
    filters: [view_00094.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_00094.created_at_date: "7 days"]
    unless: [view_00094.id, view_00094.status]
  }

  join: view_00096 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_00094.user_id} = ${view_00096.id} ;;
    required_joins: []
  }

  join: view_00097 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_00094.account_id} = ${view_00097.account_id} ;;
    required_joins: [view_00096]
  }

  join: view_00098 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_00094.category} = ${view_00098.category} ;;
  }

  access_filter: {
    field: view_00094.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_00094.is_deleted} = false ;;
}
