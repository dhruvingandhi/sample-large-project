# Explore: explore_1046
# Auto-generated LookML Explore File

include: "/views/domain_39/view_03139.view.lkml"
include: "/views/domain_41/view_03141.view.lkml"
include: "/views/domain_42/view_03142.view.lkml"
include: "/views/domain_43/view_03143.view.lkml"

explore: explore_1046 {
  label: "Explore Explore 1046"
  description: "Comprehensive analytics explore joining base view_03139 with related tables."
  group_label: "Analytics Domain 07"
  
  view_name: view_03139
  
  always_filter: {
    filters: [view_03139.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_03139.created_at_date: "7 days"]
    unless: [view_03139.id, view_03139.status]
  }

  join: view_03141 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_03139.user_id} = ${view_03141.id} ;;
    required_joins: []
  }

  join: view_03142 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_03139.account_id} = ${view_03142.account_id} ;;
    required_joins: [view_03141]
  }

  join: view_03143 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_03139.category} = ${view_03143.category} ;;
  }

  access_filter: {
    field: view_03139.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_03139.is_deleted} = false ;;
}
