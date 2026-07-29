# Explore: explore_2361
# Auto-generated LookML Explore File

include: "/views/domain_34/view_07084.view.lkml"
include: "/views/domain_36/view_07086.view.lkml"
include: "/views/domain_37/view_07087.view.lkml"
include: "/views/domain_38/view_07088.view.lkml"

explore: explore_2361 {
  label: "Explore Explore 2361"
  description: "Comprehensive analytics explore joining base view_07084 with related tables."
  group_label: "Analytics Domain 02"
  
  view_name: view_07084
  
  always_filter: {
    filters: [view_07084.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_07084.created_at_date: "7 days"]
    unless: [view_07084.id, view_07084.status]
  }

  join: view_07086 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_07084.user_id} = ${view_07086.id} ;;
    required_joins: []
  }

  join: view_07087 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_07084.account_id} = ${view_07087.account_id} ;;
    required_joins: [view_07086]
  }

  join: view_07088 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_07084.category} = ${view_07088.category} ;;
  }

  access_filter: {
    field: view_07084.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_07084.is_deleted} = false ;;
}
