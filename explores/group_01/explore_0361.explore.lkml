# Explore: explore_0361
# Auto-generated LookML Explore File

include: "/views/domain_34/view_01084.view.lkml"
include: "/views/domain_36/view_01086.view.lkml"
include: "/views/domain_37/view_01087.view.lkml"
include: "/views/domain_38/view_01088.view.lkml"

explore: explore_0361 {
  label: "Explore Explore 0361"
  description: "Comprehensive analytics explore joining base view_01084 with related tables."
  group_label: "Analytics Domain 02"
  
  view_name: view_01084
  
  always_filter: {
    filters: [view_01084.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_01084.created_at_date: "7 days"]
    unless: [view_01084.id, view_01084.status]
  }

  join: view_01086 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_01084.user_id} = ${view_01086.id} ;;
    required_joins: []
  }

  join: view_01087 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_01084.account_id} = ${view_01087.account_id} ;;
    required_joins: [view_01086]
  }

  join: view_01088 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_01084.category} = ${view_01088.category} ;;
  }

  access_filter: {
    field: view_01084.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_01084.is_deleted} = false ;;
}
