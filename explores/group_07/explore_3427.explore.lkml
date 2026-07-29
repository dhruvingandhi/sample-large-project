# Explore: explore_3427
# Auto-generated LookML Explore File

include: "/views/domain_32/view_10282.view.lkml"
include: "/views/domain_34/view_10284.view.lkml"
include: "/views/domain_35/view_10285.view.lkml"
include: "/views/domain_36/view_10286.view.lkml"

explore: explore_3427 {
  label: "Explore Explore 3427"
  description: "Comprehensive analytics explore joining base view_10282 with related tables."
  group_label: "Analytics Domain 08"
  
  view_name: view_10282
  
  always_filter: {
    filters: [view_10282.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_10282.created_at_date: "7 days"]
    unless: [view_10282.id, view_10282.status]
  }

  join: view_10284 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_10282.user_id} = ${view_10284.id} ;;
    required_joins: []
  }

  join: view_10285 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_10282.account_id} = ${view_10285.account_id} ;;
    required_joins: [view_10284]
  }

  join: view_10286 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_10282.category} = ${view_10286.category} ;;
  }

  access_filter: {
    field: view_10282.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_10282.is_deleted} = false ;;
}
