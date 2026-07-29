# Explore: explore_0646
# Auto-generated LookML Explore File

include: "/views/domain_39/view_01939.view.lkml"
include: "/views/domain_41/view_01941.view.lkml"
include: "/views/domain_42/view_01942.view.lkml"
include: "/views/domain_43/view_01943.view.lkml"

explore: explore_0646 {
  label: "Explore Explore 0646"
  description: "Comprehensive analytics explore joining base view_01939 with related tables."
  group_label: "Analytics Domain 07"
  
  view_name: view_01939
  
  always_filter: {
    filters: [view_01939.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_01939.created_at_date: "7 days"]
    unless: [view_01939.id, view_01939.status]
  }

  join: view_01941 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_01939.user_id} = ${view_01941.id} ;;
    required_joins: []
  }

  join: view_01942 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_01939.account_id} = ${view_01942.account_id} ;;
    required_joins: [view_01941]
  }

  join: view_01943 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_01939.category} = ${view_01943.category} ;;
  }

  access_filter: {
    field: view_01939.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_01939.is_deleted} = false ;;
}
