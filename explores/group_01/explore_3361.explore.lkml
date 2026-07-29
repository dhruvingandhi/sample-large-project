# Explore: explore_3361
# Auto-generated LookML Explore File

include: "/views/domain_34/view_10084.view.lkml"
include: "/views/domain_36/view_10086.view.lkml"
include: "/views/domain_37/view_10087.view.lkml"
include: "/views/domain_38/view_10088.view.lkml"

explore: explore_3361 {
  label: "Explore Explore 3361"
  description: "Comprehensive analytics explore joining base view_10084 with related tables."
  group_label: "Analytics Domain 02"
  
  view_name: view_10084
  
  always_filter: {
    filters: [view_10084.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_10084.created_at_date: "7 days"]
    unless: [view_10084.id, view_10084.status]
  }

  join: view_10086 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_10084.user_id} = ${view_10086.id} ;;
    required_joins: []
  }

  join: view_10087 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_10084.account_id} = ${view_10087.account_id} ;;
    required_joins: [view_10086]
  }

  join: view_10088 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_10084.category} = ${view_10088.category} ;;
  }

  access_filter: {
    field: view_10084.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_10084.is_deleted} = false ;;
}
