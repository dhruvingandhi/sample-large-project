# Explore: explore_2646
# Auto-generated LookML Explore File

include: "/views/domain_39/view_07939.view.lkml"
include: "/views/domain_41/view_07941.view.lkml"
include: "/views/domain_42/view_07942.view.lkml"
include: "/views/domain_43/view_07943.view.lkml"

explore: explore_2646 {
  label: "Explore Explore 2646"
  description: "Comprehensive analytics explore joining base view_07939 with related tables."
  group_label: "Analytics Domain 07"
  
  view_name: view_07939
  
  always_filter: {
    filters: [view_07939.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_07939.created_at_date: "7 days"]
    unless: [view_07939.id, view_07939.status]
  }

  join: view_07941 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_07939.user_id} = ${view_07941.id} ;;
    required_joins: []
  }

  join: view_07942 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_07939.account_id} = ${view_07942.account_id} ;;
    required_joins: [view_07941]
  }

  join: view_07943 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_07939.category} = ${view_07943.category} ;;
  }

  access_filter: {
    field: view_07939.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_07939.is_deleted} = false ;;
}
