# Explore: explore_2510
# Auto-generated LookML Explore File

include: "/views/domain_31/view_07531.view.lkml"
include: "/views/domain_33/view_07533.view.lkml"
include: "/views/domain_34/view_07534.view.lkml"
include: "/views/domain_35/view_07535.view.lkml"

explore: explore_2510 {
  label: "Explore Explore 2510"
  description: "Comprehensive analytics explore joining base view_07531 with related tables."
  group_label: "Analytics Domain 11"
  
  view_name: view_07531
  
  always_filter: {
    filters: [view_07531.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_07531.created_at_date: "7 days"]
    unless: [view_07531.id, view_07531.status]
  }

  join: view_07533 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_07531.user_id} = ${view_07533.id} ;;
    required_joins: []
  }

  join: view_07534 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_07531.account_id} = ${view_07534.account_id} ;;
    required_joins: [view_07533]
  }

  join: view_07535 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_07531.category} = ${view_07535.category} ;;
  }

  access_filter: {
    field: view_07531.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_07531.is_deleted} = false ;;
}
