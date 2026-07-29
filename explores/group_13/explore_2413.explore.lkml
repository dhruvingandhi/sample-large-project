# Explore: explore_2413
# Auto-generated LookML Explore File

include: "/views/domain_40/view_07240.view.lkml"
include: "/views/domain_42/view_07242.view.lkml"
include: "/views/domain_43/view_07243.view.lkml"
include: "/views/domain_44/view_07244.view.lkml"

explore: explore_2413 {
  label: "Explore Explore 2413"
  description: "Comprehensive analytics explore joining base view_07240 with related tables."
  group_label: "Analytics Domain 14"
  
  view_name: view_07240
  
  always_filter: {
    filters: [view_07240.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_07240.created_at_date: "7 days"]
    unless: [view_07240.id, view_07240.status]
  }

  join: view_07242 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_07240.user_id} = ${view_07242.id} ;;
    required_joins: []
  }

  join: view_07243 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_07240.account_id} = ${view_07243.account_id} ;;
    required_joins: [view_07242]
  }

  join: view_07244 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_07240.category} = ${view_07244.category} ;;
  }

  access_filter: {
    field: view_07240.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_07240.is_deleted} = false ;;
}
