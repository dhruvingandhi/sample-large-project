# Explore: explore_1861
# Auto-generated LookML Explore File

include: "/views/domain_34/view_05584.view.lkml"
include: "/views/domain_36/view_05586.view.lkml"
include: "/views/domain_37/view_05587.view.lkml"
include: "/views/domain_38/view_05588.view.lkml"

explore: explore_1861 {
  label: "Explore Explore 1861"
  description: "Comprehensive analytics explore joining base view_05584 with related tables."
  group_label: "Analytics Domain 02"
  
  view_name: view_05584
  
  always_filter: {
    filters: [view_05584.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_05584.created_at_date: "7 days"]
    unless: [view_05584.id, view_05584.status]
  }

  join: view_05586 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_05584.user_id} = ${view_05586.id} ;;
    required_joins: []
  }

  join: view_05587 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_05584.account_id} = ${view_05587.account_id} ;;
    required_joins: [view_05586]
  }

  join: view_05588 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_05584.category} = ${view_05588.category} ;;
  }

  access_filter: {
    field: view_05584.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_05584.is_deleted} = false ;;
}
