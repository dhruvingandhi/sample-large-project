# Explore: explore_1130
# Auto-generated LookML Explore File

include: "/views/domain_41/view_03391.view.lkml"
include: "/views/domain_43/view_03393.view.lkml"
include: "/views/domain_44/view_03394.view.lkml"
include: "/views/domain_45/view_03395.view.lkml"

explore: explore_1130 {
  label: "Explore Explore 1130"
  description: "Comprehensive analytics explore joining base view_03391 with related tables."
  group_label: "Analytics Domain 11"
  
  view_name: view_03391
  
  always_filter: {
    filters: [view_03391.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_03391.created_at_date: "7 days"]
    unless: [view_03391.id, view_03391.status]
  }

  join: view_03393 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_03391.user_id} = ${view_03393.id} ;;
    required_joins: []
  }

  join: view_03394 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_03391.account_id} = ${view_03394.account_id} ;;
    required_joins: [view_03393]
  }

  join: view_03395 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_03391.category} = ${view_03395.category} ;;
  }

  access_filter: {
    field: view_03391.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_03391.is_deleted} = false ;;
}
