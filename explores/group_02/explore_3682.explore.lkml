# Update for 500 file diff target
# Explore: explore_3682
# Auto-generated LookML Explore File

include: "/views/domain_47/view_11047.view.lkml"
include: "/views/domain_49/view_11049.view.lkml"
include: "/views/domain_50/view_11050.view.lkml"
include: "/views/domain_01/view_11051.view.lkml"

explore: explore_3682 {
  label: "Explore Explore 3682"
  description: "Comprehensive analytics explore joining base view_11047 with related tables."
  group_label: "Analytics Domain 03"
  
  view_name: view_11047
  
  always_filter: {
    filters: [view_11047.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_11047.created_at_date: "7 days"]
    unless: [view_11047.id, view_11047.status]
  }

  join: view_11049 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_11047.user_id} = ${view_11049.id} ;;
    required_joins: []
  }

  join: view_11050 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_11047.account_id} = ${view_11050.account_id} ;;
    required_joins: [view_11049]
  }

  join: view_11051 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_11047.category} = ${view_11051.category} ;;
  }

  access_filter: {
    field: view_11047.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_11047.is_deleted} = false ;;
}
