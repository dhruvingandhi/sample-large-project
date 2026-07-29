# Explore: explore_2696
# Auto-generated LookML Explore File

include: "/views/domain_39/view_08089.view.lkml"
include: "/views/domain_41/view_08091.view.lkml"
include: "/views/domain_42/view_08092.view.lkml"
include: "/views/domain_43/view_08093.view.lkml"

explore: explore_2696 {
  label: "Explore Explore 2696"
  description: "Comprehensive analytics explore joining base view_08089 with related tables."
  group_label: "Analytics Domain 17"
  
  view_name: view_08089
  
  always_filter: {
    filters: [view_08089.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_08089.created_at_date: "7 days"]
    unless: [view_08089.id, view_08089.status]
  }

  join: view_08091 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_08089.user_id} = ${view_08091.id} ;;
    required_joins: []
  }

  join: view_08092 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_08089.account_id} = ${view_08092.account_id} ;;
    required_joins: [view_08091]
  }

  join: view_08093 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_08089.category} = ${view_08093.category} ;;
  }

  access_filter: {
    field: view_08089.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_08089.is_deleted} = false ;;
}
