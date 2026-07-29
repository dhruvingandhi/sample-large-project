# Explore: explore_2695
# Auto-generated LookML Explore File

include: "/views/domain_36/view_08086.view.lkml"
include: "/views/domain_38/view_08088.view.lkml"
include: "/views/domain_39/view_08089.view.lkml"
include: "/views/domain_40/view_08090.view.lkml"

explore: explore_2695 {
  label: "Explore Explore 2695"
  description: "Comprehensive analytics explore joining base view_08086 with related tables."
  group_label: "Analytics Domain 16"
  
  view_name: view_08086
  
  always_filter: {
    filters: [view_08086.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_08086.created_at_date: "7 days"]
    unless: [view_08086.id, view_08086.status]
  }

  join: view_08088 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_08086.user_id} = ${view_08088.id} ;;
    required_joins: []
  }

  join: view_08089 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_08086.account_id} = ${view_08089.account_id} ;;
    required_joins: [view_08088]
  }

  join: view_08090 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_08086.category} = ${view_08090.category} ;;
  }

  access_filter: {
    field: view_08086.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_08086.is_deleted} = false ;;
}
