# Explore: explore_3046
# Auto-generated LookML Explore File

include: "/views/domain_39/view_09139.view.lkml"
include: "/views/domain_41/view_09141.view.lkml"
include: "/views/domain_42/view_09142.view.lkml"
include: "/views/domain_43/view_09143.view.lkml"

explore: explore_3046 {
  label: "Explore Explore 3046"
  description: "Comprehensive analytics explore joining base view_09139 with related tables."
  group_label: "Analytics Domain 07"
  
  view_name: view_09139
  
  always_filter: {
    filters: [view_09139.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_09139.created_at_date: "7 days"]
    unless: [view_09139.id, view_09139.status]
  }

  join: view_09141 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_09139.user_id} = ${view_09141.id} ;;
    required_joins: []
  }

  join: view_09142 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_09139.account_id} = ${view_09142.account_id} ;;
    required_joins: [view_09141]
  }

  join: view_09143 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_09139.category} = ${view_09143.category} ;;
  }

  access_filter: {
    field: view_09139.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_09139.is_deleted} = false ;;
}
